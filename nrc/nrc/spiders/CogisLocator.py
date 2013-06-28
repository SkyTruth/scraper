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
from nrc.NrcBot import NrcBot
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
class CogisLocator (NrcBot):
    name = 'CogisLocator'
    task_conditions = {'CogisScraper':'NEW'}
    local_task_params = {
            'task_id':'1001',
            'source_task_id':'124',
            'feedsource_id':'1001',
            'Item':'CogisInspection',
            'loc_key_field':'insp_api_num',
            'target_fields':'site_lat, site_lng, operator',
            'url_template':
    'http://cogcc.state.co.us/cogis/FacilityDetail.asp?facid={0}&type=WELL',
            }
    allowed_domains = None

    def process_item(self, task):
        if not isinstance(task, dict):
            keyval = task
            task = dict(self.local_task_params.items())

            item = self.get_cogis_item(task, keyval)
            if item is None: return
            api_key = item[task["loc_key_field"]].replace("-","")
            url = task["url_template"].format(api_key)
            req = Request(url,
                          callback=self.parse_well,
                          dont_filter=True,
                          errback=self.error_callback)
            req.meta['task'] = task
            req.meta['task_keyval'] = keyval
            yield req

        else:
            # this is for the new task structure only
            self.item_dropped(keyval)
            self.log('CogisLocator.process_item got task parameter dictionary',
                     log.ERROR)
        return

    def parse_well(self, response):
        task = response.meta['task']
        keyval = response.meta['task_keyval']
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
            item = self.get_cogis_item(task, keyval)
            if item is None: return
            target_fields = [f.strip()
                             for f in task['target_fields'].split(',')]
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
            self.log('set lat/lng for cogis %s to %s/%s' % (keyval, lat, lng),
                     log.INFO)
            self.item_completed(keyval)
            return self.screen_feed_entry(item, task)
        else:
            self.log('lat/lng values not found for cogis %s' % (keyval,),
                     log.INFO)
            self.item_dropped(keyval)

    def get_cogis_item(self, task, keyval):
        item = globals()[task['Item']]()
        cogis_rec = self.db.loadItem (item,
                                      match_fields={'doc_num':str(keyval)})
        if cogis_rec is None:
            self.log("No {0} record for doc_num {1}."
                     .format(task['Item'], keyval),
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

    def screen_feed_entry(self, item, task):
        if (isinstance(item, CogisInspection)):
            if item["violation"] == 'Y':
                return self.create_insp_feed_entry(item, task)

        if (isinstance(item, CogisSpill)
           ):
            return self.create_spill_feed_entry(item, task)

    def create_insp_feed_entry (self, item, task):
        params = {}
        params['lat'] = item['site_lat']
        params['lng'] = item['site_lng']
        params['operator'] = item['operator']
        params['api'] = item['insp_api_num']
        params['title_tmpl'] = insp_title_template
        params['summ_tmpl'] = insp_summ_template
        params['notestring'] = ""
        params['notes'] = []
        return self.create_feed_entry(item, task, params)

    def create_spill_feed_entry (self, item, task):
        params = {}
        params['lat'] = item['spill_lat']
        params['lng'] = item['spill_lng']
        params['operator'] = item['company_name']
        params['api'] = item['facility_id']
        params['title_tmpl'] = spill_title_template
        params['summ_tmpl'] = spill_summ_template
        params['notestring'] = ""
        params['notes'] = []
        if item['groundwater'] and item['groundwater'].upper() == 'Y':
            params['notes'].append('groundwater affected')
        if item['surfacewater'] and item['surfacewater'].upper() == 'Y':
            params['notes'].append('surfacewater affected')
        return self.create_feed_entry(item, task, params)

    def create_feed_entry (self, item, task, params):
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
        #feed_entry_id = uuid.uuid3(uuid.NAMESPACE_URL, url.encode('ASCII'))
        feed_entry_id = self.db.uuid3_str(name=url.encode('ASCII'))
        l.add_value ('id', feed_entry_id)

        l.add_value ('title', params['title_tmpl'].substitute(params))
        l.add_value ('incident_datetime', params['date'])
        l.add_value ('link', params['doc_href'])

        l.add_value ('summary', params['summ_tmpl'].substitute(params))
        l.add_value ('content', params['content_tmpl'].substitute(params))

        l.add_value ('lat', params['lat'])
        l.add_value ('lng', params['lng'])

        l.add_value ('source_id', task['feedsource_id'])

        feed_item = l.load_item()

        if (feed_item.get('lat')
            and feed_item.get('lng')
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

class CogisSpillLocator (CogisLocator):
    name = 'CogisSpillLocator'
    task_conditions = {'CogisSpillScraper':'NEW'}
    local_task_params = {
            'task_id':'1002',
            'source_task_id':'125',
            'feedsource_id':'1001',
            'Item':'CogisSpill',
            'loc_key_field':'facility_id',
            'target_fields':'spill_lat, spill_lng, company_name',
            'url_template':
    'http://cogcc.state.co.us/cogis/FacilityDetail.asp?facid={0}&type=WELL',
            }

