# CO Well Permit Scraper

import re
from datetime import datetime, timedelta
import xlrd
import uuid
from string import Template
from xml.sax.saxutils import escape
from urlparse import urlsplit, urljoin
from random import shuffle

from scrapy.spider import BaseSpider
from scrapy.contrib.loader import ItemLoader
from scrapy.http import Request, Response, TextResponse, FormRequest
from scrapy.contrib.loader.processor import TakeFirst, MapCompose, Join
from scrapy.shell import inspect_response
from scrapy import log
#from scrapy.stats import stats
from scrapy.selector import HtmlXPathSelector


#from nrc.items import CO_DrillingPermit, FeedEntry, FeedEntryTag
from nrc.items import FeedEntry, FeedEntryTag
from nrc.database import NrcDatabase
from nrc.NrcBot import NrcBot
from nrc.ExcelScraper import ExcelScraper


class COPermitScraper (NrcBot):
    name = 'COPermitScraper'
    allowed_domains = None
    field_names = [
        'API',
        'permit_number',
        'permit_type',
        'current_operator',
        'farm_name',
        'well_number',
        'permit_activity_type',
        'permit_activity_date',
        'utm_north',
        'utm_east',
        'datum']

    county_ids = None
#    county_ids = ['009']

#    county_ids = ['001','003','005','007','009','011','013','015','017','019','021','023','025','027','029','031','033','035',
#        '037','039','041','043','045','049','051','053','047','055','057','059','061','063','065','067','069','200',
#        '071','073','075','077','079','081','083','085','087','089','091','093','095','998','097','099','101','103',
#        '105','107','109']
    counties = {
        '001' : 'Barbour',
        '003' : 'Berkeley',
        '005' : 'Boone',
        '007' : 'Braxton',
        '009' : 'Brooke',
        '011' : 'Cabell',
        '013' : 'Calhoun',
        '015' : 'Clay',
        '017' : 'Doddridge',
        '019' : 'Fayette',
        '021' : 'Gilmer',
        '023' : 'Grant',
        '025' : 'Greenbrier',
        '027' : 'Hampshire',
        '029' : 'Hancock',
        '031' : 'Hardy',
        '033' : 'Harrison',
        '035' : 'Jackson',
        '037' : 'Jefferson',
        '039' : 'Kanawha',
        '041' : 'Lewis',
        '043' : 'Lincoln',
        '045' : 'Logan',
        '049' : 'Marion',
        '051' : 'Marshall',
        '053' : 'Mason',
        '047' : 'McDowell',
        '055' : 'Mercer',
        '057' : 'Mineral',
        '059' : 'Mingo',
        '061' : 'Monongalia',
        '063' : 'Monroe',
        '065' : 'Morgan',
        '067' : 'Nicholas',
        '069' : 'Ohio',
        '200' : 'Out of State',
        '071' : 'Pendleton',
        '073' : 'Pleasants',
        '075' : 'Pocahontas',
        '077' : 'Preston',
        '079' : 'Putnam',
        '081' : 'Raleigh',
        '083' : 'Randolph',
        '085' : 'Ritchie',
        '087' : 'Roane',
        '089' : 'Summers',
        '091' : 'Taylor',
        '093' : 'Tucker',
        '095' : 'Tyler',
        '998' : 'Unknown',
        '097' : 'Upshur',
        '099' : 'Wayne',
        '101' : 'Webster',
        '103' : 'Wetzel',
        '105' : 'Wirt',
        '107' : 'Wood',
        '109' : 'Wyoming'
    }

    def get_next_county_id (self):
        if self.county_ids == None:
            self.county_ids = self.counties.keys()
            shuffle(self.county_ids)

        if self.county_ids:
            return self.county_ids.pop(0)
        return None

    def process_item(self, task):
        yield self.form_request(task)

    def form_request(self, task):
        url = task['target_url']
        request = Request (url, callback=self.parse_form, dont_filter=True, errback=self.error_callback)
        self.log('retrieving request form url %s' % (url), log.INFO)
        request.meta['task'] = task
        return request

    def parse_form(self, response):
        task = response.meta['task']
        county_id = self.get_next_county_id()
        if county_id:
            self.log('Requesting permit data for county %s: %s' % (county_id, self.counties[county_id]), log.INFO)
            request = FormRequest.from_response(response,
            formdata={
                'county': county_id,
                'countyCx': 'on',
                'searchButton': 'Search',
                'searchPage': 'yes'
            },
            callback=self.parse_page,
            errback=self.error_callback,
            dont_filter=True)
            request.meta['task'] = task
            request.meta['county_id'] = county_id
            yield request

    def parse_page (self, response):
        task = response.meta['task']
        county_id = response.meta['county_id']
        hxs = HtmlXPathSelector(response)

#        inspect_response (response);

        #get next page
        next = hxs.select("//a[contains(text(),'Next')]/@href")
#        if 0:
        if len(next) > 0:
            request = Request (urljoin(response.url, next[0].extract()), callback=self.parse_page, errback=self.error_callback, dont_filter=True)
            request.meta['task'] = task
            request.meta['county_id'] = county_id
            yield request
        else:
            yield self.form_request(task)

        rows = hxs.select ('/html/body/table[4]/tr')
        if (len(rows) == 0):
            self.send_alert ('No permit data found in search response')
            self.log('No permit data table present in response', log.ERROR)
        elif (len(rows) == 1):
            self.log('No incident reports found in response', log.WARNING)
        else:
            # Skip the first report record because this is the header row
            rows.pop (0)
            self.log('Retrieved {0} permits'.format(len(rows)), log.INFO)
            for row in rows:
                r = dict(zip(self.field_names, [f.strip() for f in row.select ('td/text()').extract_unquoted()]))
                r['county'] = self.counties[county_id]
                for item in self.process_row(r, task):
                    yield item


    def process_row (self, row, task):
        stats = self.crawler.stats
        l=ItemLoader (WV_DrillingPermit())
        l.add_value (None, row)
        item = l.load_item()

        if item['API'] and item ['permit_activity_type'] and item ['permit_activity_date']:
            existing_item = self.db.loadItem (item, {'API': item['API'],
                    'permit_activity_type': item ['permit_activity_type'],
                    'permit_activity_date': item ['permit_activity_date']
                    })

            if existing_item:
                stats.inc_value ('_existing_count', spider=self)
            else:
                stats.inc_value ('_new_count', spider=self)
                yield item

                dt = datetime.strptime(item ['permit_activity_date'], '%Y-%m-%d %H:%M:%S')
#                if item['permit_activity_type'] in ('Permit Issued', 'Permit Commenced', 'Permit Completed'):
                if item['permit_activity_type'] in ('Permit Issued', 'Permits Issued') and datetime.now() - dt  < timedelta(days=365):
                    for item in self.create_feed_entry(item, task):
                        yield item


    def create_feed_entry (self, item, task):

        params = dict(item)
        for f in item.fields:
            params[f] = escape ("%s" % params.get(f,''))

        params['operator'] = unicode.title(params['current_operator'])
        params['permit_type_full'] = self.get_permit_type_full(item)
        params['history'] = self.get_history(item)

        # create a new feed item
        l=ItemLoader (FeedEntry())

        url = "%s/%s/%s/%s" % (task['target_url'], item['API'], item ['permit_activity_type'], item ['permit_activity_date'])
        #feed_entry_id = uuid.uuid3(uuid.NAMESPACE_URL, url.encode('ASCII'))
        feed_entry_id = self.db.uuid3_str(name=url.encode('ASCII'))
        l.add_value ('id', feed_entry_id)

        l.add_value ('title', self.title_template(item).substitute(params))
        l.add_value ('incident_datetime', item.get('permit_activity_date'))
        l.add_value ('link', task['about_url'])

        l.add_value ('summary', self.summary_template(item).substitute(params))
        l.add_value ('content', self.content_template().substitute(params))

        if item['datum'] == 27:
            srid = 26717    # NAD 27 UTM 17N    SRID=26717
        else:
            srid = 26917    # NAD 83 UTM 17N    SRID=26917

        coords = self.geodb.transformCoords(item['utm_east'], item['utm_north'], srid, 4326)
        l.add_value ('lat', coords['y'])
        l.add_value ('lng', coords['x'])

        if item['permit_activity_type'] in ('Permit Issued', 'Permits Issued'):
            l.add_value ('source_id', 7)
        else:
            l.add_value ('source_id', 8)

        feed_item = l.load_item()

        if feed_item.get('lat') and feed_item.get('lng'):
            yield feed_item
            for tag in self.get_tags(item):
                yield self.create_tag (feed_entry_id, tag)

    def error_callback (self, err):
        self.log ('HTTP request failed %s'  % (err.getErrorMessage()), log.WARNING)

    def create_tag (self, feed_entry_id, tag, comment = ''):
        l = ItemLoader (FeedEntryTag())
        l.add_value ('feed_entry_id', feed_entry_id)
        l.add_value ('tag', tag)
        l.add_value ('comment', comment)
        return l.load_item()

    def item_stored(self, item, id):
        self.item_new (id)
        pass

    # get all WV permits that have the same API
    def get_history(self, item):

        load_item = WV_DrillingPermit()
        history_items = self.db.loadItems (load_item, match_fields={'API':item['API']})


        item_template = self.history_item_template (item)
        html_items = []
        for history_item in sorted(history_items, key=lambda i: i['permit_activity_date']):
            html_items.append (item_template.substitute(history_item))

        return self.history_template(item).substitute({'history_items': ''.join(html_items)})


    def get_tags (self, item):
        tags = []
        if item['permit_type'] in ('COALH', 'COALM', 'COALP', 'COALR', 'DRILD', 'DRDCM', 'FRACM'):
            tags.append('coalbed methane')

        if item['permit_type'] in ('FRACM', 'FRACT', 'FRADD', 'FRAGI', 'FRAHW', 'FRANW', 'FRAPP'):
            tags.append('frack')

        if item['permit_type'] in ('BRIND', 'BRNDC'):
            tags.append('brine')

        if item['permit_type'] in ('PARTP', 'PLUG'):
            tags.append('plug')

        if item['permit_activity_type'] in ('Permit Issued', 'Permits Issued'):
            tags.append('permit')

        if item['permit_type'] not in ('ASSPN', 'POP', 'STOR', 'STORM'):
            tags.append('drilling')
            if item['permit_activity_type'] in ('Permit Commenced'):
                tags.append('spud')

        tags.append ('WVDEP')

        return tags

    def get_permit_type_full (self, item):
        m = {
            'ASSPN':'Assigned Permit Number',
            'BRIND':'Brine Disposal',
            'BRNDC':'Brine Disposal / Convert',
            'COALH':'Coalbed Methane Horizontal',
            'COALM':'Coalbed Methane Well',
            'COALP':'Coalbed Methane Production',
            'COALR':'Coalbed Methane Rework',
            'DRILD':'Coalbed Methane Drill Deeper',
            'DEEP' :'Deep Well',                    # Not used?
            'DRDCM':'Coalbed Methane Drill Deeper', # Not used?
            'DRILD':'Drill Deeper',                 # Not used?
            'FRACM':'Coalbed Methane Frac Well',
            'FRACT':'Frac Well',
            'FRADD':'Frac Well Drill Deeper',
            'FRAGI':'Frac Gas Injection Well',      # Not used?
            'FRAHW':'Frac Horizontal Well',
            'FRANW':'Frac New Well',                # Not used?
            'FRAPP':'Frac Well Partial Plug',
            'GASIW':'Gas Injection Well',           # Not used?
            'HDEEP':'Horizontal Deep Well',
            'HORIW':'Horizontal Well',
            'NEWEL':'New Well',
            'OTHRW':'Other Well',
            'PARTP':'Well Partial Plug',
            'PLUG' :'Well Plug',
            'POP'  :'Pit-Only',
            'PPRD' :'Partial Plug Re-Drill Well',
            'REDRI':'Well Re-Drill',
            'REWOR':'Well Rework',
            'SOLMI':'Solution Mining',
            'SRECW':'Secondary Recovery Well',
            'STOR' :'Storage',
            'STORM':'Stormwater'                    # Not used?
        }
        code = item.get('permit_type')
        return m.get(code, code)


    def title_template (self, item):
        if item['permit_activity_type'] in ('Permit Issued', 'Permits Issued'):
            return Template ('WV $permit_type_full $permit_activity_type to $operator in $county County')
        else:
            return Template ('$operator Reports $permit_type_full $permit_activity_type in $county County')

    def summary_template (self, item):
        if item['permit_activity_type'] in ('Permit Issued', 'Permits Issued'):
            return Template ('WV $permit_type_full $permit_activity_type on $permit_activity_date to $operator in $county County')
        else:
            return Template ('$operator Reports $permit_type_full $permit_activity_type on $permit_activity_date in $county County')

    def history_template (self, item):
        return Template ('<table>$history_items</table>')

    def history_item_template (self, item):
        return Template ('<tr><td>$permit_activity_date</td><td>$permit_activity_type</td></tr>')


    def content_template (self):
        return Template (
"""<b>Report Details</b><br/>
Permit Type: $permit_type_full ($permit_type) <br/>
Permit Activity Type: $permit_activity_type <br/>
Activity Date: $permit_activity_date <br/>
Operator: $operator <br/>
Farm Name: $farm_name <br/>
Well number: $well_number<br/>
County: $county <br/>
Well API Number: $API <br/>
<b>History</b><br/>
$history
""")

