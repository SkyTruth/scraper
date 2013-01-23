# -*- coding: utf-8 -*-
"""
Created on Fri Dec 21 15:27:02 2012

@author: Craig
"""

# standard modules
from datetime import datetime, timedelta
from string import Template
import uuid
import types

# site modules
from scrapy.item import Field
from scrapy.contrib.loader import ItemLoader, XPathItemLoader
from scrapy.contrib.loader.processor import TakeFirst, MapCompose, Join
from scrapy.contrib.loader.processor import Identity, Compose
from scrapy.http import Request, Response, TextResponse, FormRequest
from scrapy.shell import inspect_response
from scrapy import log
from scrapy.selector import HtmlXPathSelector

# local modules
from nrc.JobBot import JobBot
from nrc.items import NrcItem, FeedEntry, FeedEntryTag
from nrc.spiders.CogisScraper import CogisInspection, CogisSpill

# CONSTANTS
insp_title_template = Template(
        "Violation reported at well $api operated by $operator")
spill_title_template = Template(
        "Operator $operator reports spill at well $api")

insp_summ_template = Template("""\
A field inspection by the Colorado Oil and Gas Conservation Commission on $date
reported a violation at well $api operated by $operator.
""")
spill_summ_template = Template("""\
A spill was reported at well $api operated by $operator.
""")

content_template = Template("""\
<b>Report Details</b><br/>
Report: <a href="$doc_href">$doc_num</a><br/>
Well API Record: <a href="$well_href">$api</a><br/>
Operator: $operator<br/>
Report Date: $date<br/>
County: $county<br/>
$notestring
<a href="$doc_href">View original report</a><br/>
""")

# COGIS Records Geolocator
class CogisLocator (JobBot):
    name = 'CogisLocator'
    allowed_domains = None
#    task_conditions = {'CogisScraper':'NEW'}
#    local_task_params = {
#            'task_id':'1001',
#            'source_task_id':'124',
#            'feedsource_id':'1001',
#            'Item':'CogisInspection',
#            'loc_key_field':'insp_api_num',
#            'target_fields':'site_lat, site_lng, operator',
#            'url_template':
#    'http://cogcc.state.co.us/cogis/FacilityDetail.asp?facid={0}&type=WELL',
#            }

    def process_job(self):
        job = self.job_params
        try:
            task_ids = job['task_ids']
        except KeyError:
            task_ids = ""
        job_conditions = job['job_conditions']
        for item in self.process_job_items(job_conditions, task_ids):
            yield item

    def process_job_item(self, task_key):
        job = self.job_params
        item = self.get_cogis_item(job, task_key)
        if item is None: return
        api_key = item[job["loc_key_field"]].replace("-","")
        url = job["url_template"].format(api_key)
        req = Request(url,
                      callback=self.parse_well,
                      dont_filter=True,
                      errback=self.error_callback)
        req.meta['job'] = job
        req.meta['task_key'] = task_key
        yield req

        return

    def parse_well(self, response):
        job = response.meta['job']
        task_key = response.meta['task_key']
        hxs = HtmlXPathSelector(response)
        fields = hxs.select('//td//text()')
        lat, lng = None, None
        for field in fields:
            # Note that there may be two instances of lat/lng in the record,
            # one is 'as planned' and the 2nd is 'as built'.
            # We want the 2nd if it's there.
            l1, l2 = self.extract_lat_lng(field.extract())
            if l1 is not None:
                lat, lng = l1, l2
        operator = None
        take_next = False
        for field in fields:
            if field.extract().strip() == 'Operator:':
                take_next = True
                continue
            elif take_next:
                operator = ''.join([c for c in
                                    field.extract().strip()[:-7].strip()
                                    if ord(c)<127])
                if not operator: continue
                break
        if operator or lat is not None:
            item = self.get_cogis_item(job, task_key)
            if item is None: return
            target_fields = [f.strip()
                             for f in job['target_fields'].split(',')]
            if item[target_fields[2]]:
                operator = item[target_fields[2]]
            update_fields = dict(zip(target_fields, (lat, lng, operator)))
            self.db.updateItem (task['Item'],
                                item['st_id'],
                                update_fields,
                                id_field='st_id')
            for key, val in update_fields.items():
                item[key] = val
        if lat is not None:
            self.log('set lat/lng for cogis %s to %s/%s' %(task_key, lat, lng),
                     log.INFO)
            self.item_completed(task_key)
            return self.screen_feed_entry(item, job)
        else:
            self.log('lat/lng values not found for cogis %s' % (task_key,),
                     log.INFO)
            self.item_dropped(task_key)

    def item_stored(self, item, id):
        if isinstance(item, (CogisInspection, CogisSpill)):
            self.item_completed(item['doc_num'])

    def get_cogis_item(self, job, keyval):
        item = globals()[job['Item']]()
        cogis_rec = self.db.loadItem (item, match_fields={'doc_num':keyval})
        if cogis_rec is None:
            self.log("No {0} record for doc_num {1}."
                     .format(job['Item'], keyval),
                     log.ERROR)
            assert False
            return None
        for field_name, value in cogis_rec.items():
            if field_name == 'timestamp':
                continue
            item[field_name] = value
        return item

    def extract_lat_lng(self, s):
        if "lat/long" in s.lower():
            s2 = ''.join([c for c in s if c in "0123456789-./"]).split('/')
            if len(s2) == 3:
                try:
                    float(s2[1])
                    float(s2[2])
                    return s2[1:]
                except ValueError:
                    pass
        return None, None

    def screen_feed_entry(self, item, job):
        if (isinstance(item, CogisInspection)):
            if item["violation"] == 'Y':
                return self.create_insp_feed_entry(item, job)

        if (isinstance(item, CogisSpill)
           ):
            return self.create_spill_feed_entry(item, job)

    def create_insp_feed_entry (self, item, job):
        params = {}
        params['lat'] = item['site_lat']
        params['lng'] = item['site_lng']
        params['operator'] = item['operator']
        params['api'] = item['insp_api_num']
        params['title_tmpl'] = insp_title_template
        params['summ_tmpl'] = insp_summ_template
        params['notestring'] = ""
        params['notes'] = []
        return self.create_feed_entry(item, job, params)

    def create_spill_feed_entry (self, item, job):
        params = {}
        params['lat'] = item['spill_lat']
        params['lng'] = item['spill_lng']
        params['operator'] = item['company_name']
        params['api'] = item['facility_id']
        params['title_tmpl'] = spill_title_template
        params['summ_tmpl'] = spill_summ_template
        params['notestring'] = ""
        params['notes'] = []
        if item['groundwater'].upper() == 'Y':
            params['notes'].append('groundwater affected')
        if item['surfacewater'].upper() == 'Y':
            params['notes'].append('surfacewater affected')
        return self.create_feed_entry(item, job, params)

    def create_feed_entry (self, item, job, params):
        params['county'] = item['county_name']
        params['doc_num'] = item['doc_num']
        params['doc_href'] = item['doc_href']
        params['date'] = item['date']
        facility_id = ''.join([c for c in params['api']
                               if c in ('0123456789')])
        params['well_href'] = ("http://cogcc.state.co.us/cogis/"
                               "FacilityDetail.asp?facid={0}&type=WELL"
                               .format(facility_id))
        params['content_tmpl'] = content_template
        if params['notes']:
            params['notestring'] = ("Notes: %s<br/>"
                                    % (', '.join(params['notes']),))

        # create a new feed item
        l=ItemLoader (FeedEntry())

        url = params['doc_href']
        feed_entry_id = uuid.uuid3(uuid.NAMESPACE_URL, url.encode('ASCII'))
        l.add_value ('id', feed_entry_id)

        l.add_value ('title', params['title_tmpl'].substitute(params))
        l.add_value ('incident_datetime', params['date'])
        l.add_value ('link', params['doc_href'])

        l.add_value ('summary', params['summ_tmpl'].substitute(params))
        l.add_value ('content', params['content_tmpl'].substitute(params))

        l.add_value ('lat', params['lat'])
        l.add_value ('lng', params['lng'])

        l.add_value ('source_id', job['feed_source_id'])

        feed_item = l.load_item()

        if (feed_item.get('lat') and feed_item.get('lng')
            and feed_item.get('incident_datetime')
            and (datetime.now().date() - feed_item.get('incident_datetime'))
                 <= timedelta(days=60)):
            yield feed_item
            for tag in self.get_tags(item):
                yield self.create_tag (feed_entry_id, tag)


    def get_tags (self, item):
        tags = []
        if (isinstance(item, CogisInspection)):
            tags.append ('violation')

        if (isinstance(item, CogisSpill)):
            tags.append ('spill')
            tags.append ('release')

        tags.append ('drilling')
        tags.append ('COGIS')

        return tags

#class CogisSpillLocator (CogisLocator):
#    name = 'CogisSpillLocator'
#    task_conditions = {'CogisSpillScraper':'NEW'}
#    local_task_params = {
#            'task_id':'1002',
#            'source_task_id':'125',
#            'feedsource_id':'1001',
#            'loc_key_field':'facility_id',
#            'target_fields':'spill_lat, spill_lng, company_name',
#            'url_template':
#    'http://cogcc.state.co.us/cogis/FacilityDetail.asp?facid={0}&type=WELL',
#            }

