# WV Well Permit Scraper

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
from scrapy.selector import HtmlXPathSelector


from nrc.items import WV_DrillingPermit, FeedEntry, FeedEntryTag
from nrc.items import normalize_api
from nrc.database import NrcDatabase
from nrc.NrcBot import NrcBot
from nrc.ExcelScraper import ExcelScraper


class WVPermitScraper (NrcBot):
    name = 'WVPermitScraper'
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

    formation_ids = None
    formations = {
        "TF055": "Alexander",
        "TF001": "Balltown",
        "TF002": "Bayard",
        "TF066": "Beckley",
        "TF003": "Benson",
        "TF004": "Berea",
        "TF005": "Big Dunkard",
        "TF006": "Big Injun",
        "TF007": "Big Lime",
        "TF008": "Big Six",
        "TF009": "Black River",
        "TF076": "Blue Monday",
        "TF072": "Bradford",
        "TF010": "Braller Shale",
        "TF011": "Brown Shale",
        "TF116": "Burkett",
        "TF088": "Chagrin",
        "TF093": "Chert",
        "TF012": "Clinton",
        "TF108": "Cloyd",
        "TF013": "Coffee Shale",
        "TF014": "Cononsaga",
        "TF106": "Copper Ridge Dolomite",
        "TF068": "Denmar",
        "TF015": "Devonian Shale",
        "TF016": "Elizabeth",
        "TF017": "Elk",
        "TF018": "Fifth",
        "TF096": "Fifth Elk",
        "TF019": "Fifty-Foot",
        "TF065": "Firecreek",
        "TF103": "First Elk",
        "TF020": "Fourth",
        "TF109": "Fourth Elk",
        "TF021": "Gantz",
        "TF094": "Genesee",
        "TF022": "Gordon",
        "TF023": "Gordon Stray",
        "TF107": "Greenbrier",
        "TF058": "Haverty",
        "TF057": "Helderberg",
        "TF082": "Hillsdale",
        "TF024": "Huntersville Chert",
        "TF025": "Huron",
        "TF026": "Java",
        "TF113": "Juniata",
        "TF027": "Keener",
        "TF080": "Leopold",
        "TF028": "Little Dunkard",
        "TF099": "Little Lime",
        "TF029": "Little Lime",
        "TF030": "Lockport Dolomite",
        "TF078": "Lower Beckley",
        "TF101": "Lower Berea",
        "TF074": "Lower Horsepen",
        "TF031": "Lower Huron",
        "TF092": "Lower Kittanning",
        "TF032": "Lower Maxton",
        "TF105": "Lower Speechly",
        "TF089": "Lower Weir",
        "TF033": "Loyalhanna",
        "TF034": "Marcellus Shale",
        "TF035": "Maxton",
        "TF112": "Medina",
        "TF097": "Middle Huron",
        "TF091": "Middle Kittanning",
        "TF102": "Middle Maxton",
        "TF036": "Needmore Shale",
        "TF115": "Nestor Dolostone",
        "TF037": "Newburg",
        "TF038": "Onondaga Limestone",
        "TF039": "Oriskany Sandstone",
        "TF069": "Pickway",
        "TF054": "Pittsburgh",
        "TF059": "Pocahontas 1",
        "TF060": "Pocahontas 2",
        "TF061": "Pocahontas 3",
        "TF062": "Pocahontas 4",
        "TF063": "Pocahontas 5",
        "TF064": "Pocahontas 6",
        "TF083": "Pocahontas 7",
        "TF084": "Pocahontas 8",
        "TF085": "Pocahontas 9",
        "TF077": "Pocono",
        "TF117": "Point Pleasant",
        "TF075": "Price",
        "TF067": "Price",
        "TF040": "Princeton",
        "TF041": "Ravencliffe",
        "TF042": "Rhinestreet",
        "TF056": "Riley",
        "TF043": "Rose Run",
        "TF044": "Salina",
        "TF045": "Salt Sands",
        "TF098": "Second Elk",
        "TF046": "Speechley",
        "TF047": "Squaw",
        "TF048": "Sycamore Grit",
        "TF087": "Third Elk",
        "TF071": "Third Riley",
        "TF049": "Thirty Foot",
        "TF050": "Trenton",
        "TF051": "Tuscarora",
        "TF073": "Tygart",
        "TF070": "Union",
        "TF081": "Upper Balltown",
        "TF100": "Upper Berea",
        "TF111": "Upper Devonian Shale",
        "TF079": "Upper Huron",
        "TF090": "Upper Kittanning",
        "TF086": "Upper Maxton",
        "TF095": "Upper Riley",
        "TF104": "Upper Speechly",
        "TF110": "Utica",
        "TF052": "Warren",
        "TF053": "Weir",
        "TF114": "Westfalls",
    }
    formations_by_county = ("TF034", "TF031")  # Marcellus Shale, Lower Huron

    def get_next_county_id (self, task):
        if self.county_ids == None:
            self.county_ids = self.counties.keys()
            shuffle(self.county_ids)

        if self.county_ids:
            return self.county_ids.pop(0)
        return None

    def get_county_from_api(self, api):
        norm_api = normalize_api(api, gmax=2)
        if norm_api[3] != '-': return None
        return self.counties.get(norm_api[:3], None)

    def get_next_formation_id(self):
        if self.formation_ids == None:
            self.formation_ids = self.formations.keys()
            shuffle(self.formation_ids)

        if self.formation_ids:
            return self.formation_ids.pop(0)
        return None

    def process_item(self, task):
        if task.get('county_id'):
            self.county_ids = [task.get('county_id')]
        if task.get('formation_id'):
            self.formation_ids = [task.get('formation_id')]

        yield self.form_request(task)

    def form_request(self, task):
        url = task['target_url']
        request = Request (url, callback=self.parse_form, dont_filter=True, errback=self.error_callback)
        self.log('retrieving request form url %s' % (url), log.INFO)
        request.meta['task'] = task
        return request

    def parse_form(self, response):
        task = response.meta['task']

        #county_id = self.get_next_county_id(task)
        formation_id = self.get_next_formation_id()
        if formation_id in self.formations_by_county:
            pass
        #if county_id:
        if formation_id:
            #self.log('Requesting permit data for county %s: %s' % (county_id, self.counties[county_id]), log.INFO)
            self.log('Requesting permit data for formation %s: %s' % (formation_id, self.formations[formation_id]), log.INFO)
            request = FormRequest.from_response(response,
                                                formdata={
                                                    #'county': county_id,
                                                    #'countyCx': 'on',
                                                    'Target_Formation': formation_id,
                                                    'tfCx': 'on',

                                                    'searchButton': 'Search',
                                                    'searchPage': 'yes'
                                                },
                                                callback=self.parse_page,
                                                errback=self.error_callback,
                                                dont_filter=True)
            request.meta['task'] = task
            #request.meta['county_id'] = county_id
            request.meta['formation_id'] = formation_id
            yield request

    def parse_page (self, response):
        task = response.meta['task']
        #county_id = response.meta['county_id']
        formation_id = response.meta['formation_id']
        hxs = HtmlXPathSelector(response)

#        inspect_response (response);

        #get next page
        next = hxs.select("//a[contains(text(),'Next')]/@href")
#        if 0:
        if len(next) > 0:
            request = Request (urljoin(response.url, next[0].extract()), callback=self.parse_page, errback=self.error_callback, dont_filter=True)
            request.meta['task'] = task
            #request.meta['county_id'] = county_id
            request.meta['formation_id'] = formation_id
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
                #r['county'] = self.counties[county_id]
                r['county'] = self.get_county_from_api(r['API'])
                r['target_formation'] = self.formations[formation_id]
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
                # Put in test for new method of determining county from API.
                if existing_item['county'] != item['county']:
                    self.log('County name mismatch on formation update: api %s, county %s, new county %s'
                             %(item['API'], existing_item['county'], item['county']), log.ERROR)
                    return
                # Check for formation in existing item.
                if existing_item['target_formation'] == row['target_formation']:
                    stats.inc_value ('_existing_count', spider=self)
                else:
                    # Update existing record with formation name
                    self.db.updateItem(table_name='WV_DrillingPermit',
                                       id=existing_item['st_id'],
                                       update_fields={'target_formation':row['target_formation']},
                                       id_field='st_id')
                    stats.inc_value ('_update_count', spider=self)
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

