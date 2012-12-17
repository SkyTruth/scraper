# COGIS Inspection/Spill Records Scraper

# std library
import re
from datetime import datetime, timedelta
import xlrd
import uuid
from string import Template
from xml.sax.saxutils import escape
from urlparse import urlsplit, urljoin
from random import shuffle

# site modles
from scrapy.spider import BaseSpider
from scrapy.contrib.loader import ItemLoader, XPathItemLoader
from scrapy.contrib.loader.processor import TakeFirst, MapCompose, Join
from scrapy.contrib.loader.processor import Identity, Compose
from scrapy.http import Request, Response, TextResponse, FormRequest
from scrapy.shell import inspect_response
from scrapy import log
#from scrapy.stats import stats
from scrapy.selector import HtmlXPathSelector

# local modules
from nrc.items import CogisInspection, CogisSpill, FeedEntry, FeedEntryTag
from nrc.items import convert_fuzzy_date
from nrc.database import NrcDatabase
from nrc.NrcBot import NrcBot
from nrc.ExcelScraper import ExcelScraper

class CogisScraper (NrcBot):
    name = 'CogisScraper'
    allowed_domains = None
    # NOTE:  field names are in html display order, non-displayed data at end.
    insp_field_names = [
            "date",
            "doc_num",
            "loc_id",
            "insp_api_num",
            "insp_status",
            "insp_overall",
            "ir_pass_fail",
            "fr_pass_fail",
            "violation",
            "doc_href",
            "county_code",
            "county_name",
            ]

    spill_field_names = [
            'date',
            'doc_num',
            'facility_id',
            'operator_num',
            'company_name',
            'groundwater',
            'surfacewater',
            'berm_contained',
            'spill_area',
            'doc_href',
            'county_code',
            'county_name',
            ]

    county_ids = None
    counties = {
            "001": "ADAMS",        "003": "ALAMOSA",      "005": "ARAPAHOE",
            "007": "ARCHULETA",    "009": "BACA",         "011": "BENT",
            "013": "BOULDER",      "014": "BROOMFIELD",   "015": "CHAFFEE",
            "017": "CHEYENNE",     "019": "CLEAR CREEK",  "021": "CONEJOS",
            "023": "COSTILLA",     "025": "CROWLEY",      "027": "CUSTER",
            "029": "DELTA",        "031": "DENVER",       "033": "DOLORES",
            "035": "DOUGLAS",      "037": "EAGLE",        "039": "ELBERT",
            "041": "EL PASO",      "043": "FREMONT",      "045": "GARFIELD",
            "047": "GILPIN",       "049": "GRAND",        "051": "GUNNISON",
            "053": "HINSDALE",     "055": "HUERFANO",     "057": "JACKSON",
            "059": "JEFFERSON",    "061": "KIOWA",        "063": "KIT CARSON",
            "065": "LAKE",         "067": "LA PLATA",     "069": "LARIMER",
            "071": "LAS ANIMAS",   "073": "LINCOLN",      "075": "LOGAN",
            "077": "MESA",         "079": "MINERAL",      "081": "MOFFAT",
            "083": "MONTEZUMA",    "085": "MONTROSE",     "087": "MORGAN",
            "089": "OTERO",        "091": "OURAY",        "093": "PARK",
            "095": "PHILLIPS",     "097": "PITKIN",       "099": "PROWERS",
            "101": "PUEBLO",       "103": "RIO BLANCO",   "105": "RIO GRANDE",
            "107": "ROUTT",        "109": "SAGUACHE",     "111": "SAN JUAN",
            "113": "SAN MIGUEL",   "115": "SEDGWICK",     "117": "SUMMIT",
            "119": "TELLER",       "121": "WASHINGTON",   "123": "WELD",
            "125": "YUMA",
            }

    def setup_county_ids (self):
        if not self.county_ids:
            self.county_ids = self.counties.keys()
            shuffle(self.county_ids)

    def process_item(self, task):
        yield self.form_request(task)

    def form_request(self, task):
        url = task['target_url']
        request = Request (url,
                           callback=self.parse_form,
                           dont_filter=True,
                           errback=self.error_callback)
        self.log('retrieving request form url %s' % (url), log.INFO)
        request.meta['task'] = task
        return request

    def parse_form(self, response):
        task = response.meta['task']
        table = task['table']
        count = task['count']
        if table not in ('insp', 'spill'):
            self.send_alert ("Invalid COGIS table parameter: '%s'"%table)
            self.log("Invalid COGIS table parameter: '%s'"%table, log.ERROR)
            return
        self.setup_county_ids()
        for county_id in self.county_ids:
            county_nm = self.counties[county_id]
            self.log('Requesting COGIS %s data for county %s: %s'
                     % (table, county_id, county_nm), log.INFO)
            req = FormRequest.from_response(
                    response,
                    formdata={
                            'ApiCountyCode':county_id,
                            'itype':table,
                            'maxrec':count,
                            'operator_name_number': 'name',
                            'facility_name_number': 'name',
                            },
                    callback=self.parse_cogis_records)
            req.meta['county'] = (county_id, county_nm)
            req.meta['task'] = task
            yield(req)
        return

    def parse_cogis_records(self, response):
        task = response.meta['task']
        table = task['table']
        hxs = HtmlXPathSelector(response)

        rows = hxs.select('//table[2]//tr')
        if (len(rows) == 0):
            self.send_alert ('No %s data found in search response'%table)
            self.log('No %s data table present in response'%table, log.ERROR)
        elif (len(rows) <= 2):
            self.log('No %s reports found in %s response'
                     %(table, response.meta['county'][1]), log.WARNING)
        else:
            self.log('%s %s reports found in %s response'
                     %(len(rows), table, response.meta['county'][1]),
                     log.INFO)
            for row in rows[2:]:
                if table == 'insp':
                    ldr = Cogis_inspItemLoader(CogisInspection())
                    field_names = self.insp_field_names
                    process_table_item = self.process_insp_item
                elif table == 'spill':
                    ldr = Cogis_spillItemLoader(CogisSpill())
                    field_names = self.spill_field_names
                    process_table_item = self.process_spill_item
                else:
                    return
                for field_nm, field_val in zip(
                        field_names,
                        [[x] for x in row.select('./td')]):
                    ldr.add_value(field_nm, field_val)
                ldr.add_value('doc_href', row.select('./td')[1])
                ldr.add_value('county_code', response.meta['county'][0])
                ldr.add_value('county_name', response.meta['county'][1])
                ldr.load_item()
                if process_table_item(ldr.item):
                    yield(ldr.item)

    def process_spill_item(self, item):
        stats = self.crawler.stats
        if item['doc_num'] and item['doc_href'] and item['facility_id']:
            existing_item = self.db.loadItem(item,
                                            {'doc_num':item['doc_num'],
                                             'doc_href':item['doc_href'],
                                             'facility_id':item['facility_id'],
                                            })
            if existing_item:
                stats.inc_value('_existing_spill_count', spider=self)
            else:
                stats.inc_value('_new_spill_count', spider=self)
                return item

    def process_insp_item(self, item):
        stats = self.crawler.stats
        if item['doc_num'] and item['doc_href'] and item['loc_id']:
            existing_item = self.db.loadItem(item,
                                             {'doc_num':item['doc_num'],
                                              'doc_href':item['doc_href'],
                                              'loc_id':item['loc_id'],
                                             })
            if existing_item:
                stats.inc_value('_existing_insp_count', spider=self)
            else:
                stats.inc_value('_new_insp_count', spider=self)
                return item

#    def create_feed_entry (self, item, task):
#
#        params = dict(item)
#        for f in item.fields:
#            params[f] = escape ("%s" % params.get(f,''))
#
#        params['operator'] = unicode.title(params['current_operator'])
#        params['permit_type_full'] = self.get_permit_type_full(item)
#        params['history'] = self.get_history(item)
#
#        # create a new feed item
#        l=ItemLoader (FeedEntry())
#
#        url = "%s/%s/%s/%s" %(
#                task['target_url'],
#                item['API'],
#                item ['permit_activity_type'],
#                item ['permit_activity_date'])
#        feed_entry_id = uuid.uuid3(uuid.NAMESPACE_URL, url.encode('ASCII'))
#        l.add_value ('id', feed_entry_id)
#
#        l.add_value ('title', self.title_template(item).substitute(params))
#        l.add_value ('incident_datetime', item.get('permit_activity_date'))
#        l.add_value ('link', task['about_url'])
#
#        l.add_value ('summary', self.summary_template(item).substitute(params))
#        l.add_value ('content', self.content_template().substitute(params))
#
#        if item['datum'] == 27:
#            srid = 26717    # NAD 27 UTM 17N    SRID=26717
#        else:
#            srid = 26917    # NAD 83 UTM 17N    SRID=26917
#
#        coords = self.geodb.transformCoords(item['utm_east'],
#                                            item['utm_north'],
#                                            srid, 4326)
#        l.add_value ('lat', coords['y'])
#        l.add_value ('lng', coords['x'])
#
#        if item['permit_activity_type'] in ('Permit Issued', 'Permits Issued'):
#            l.add_value ('source_id', 7)
#        else:
#            l.add_value ('source_id', 8)
#
#        feed_item = l.load_item()
#
#        if feed_item.get('lat') and feed_item.get('lng'):
#            yield feed_item
#            for tag in self.get_tags(item):
#                yield self.create_tag (feed_entry_id, tag)
#
#    def error_callback (self, err):
#        self.log ('HTTP request failed %s'
#                  % (err.getErrorMessage()), log.WARNING)
#
#    def create_tag (self, feed_entry_id, tag, comment = ''):
#        l = ItemLoader (FeedEntryTag())
#        l.add_value ('feed_entry_id', feed_entry_id)
#        l.add_value ('tag', tag)
#        l.add_value ('comment', comment)
#        return l.load_item()
#
#    def item_stored(self, item, id):
#        self.item_new (id)
#        pass
#
#    # get all WV permits that have the same API
#    def get_history(self, item):
#
#        load_item = CogisInspection()
#        history_items = self.db.loadItems (
#                load_item, match_fields={'API':item['API']})
#
#
#        item_template = self.history_item_template (item)
#        html_items = []
#        for history_item in sorted(
#                history_items, key=lambda i: i['permit_activity_date']):
#            html_items.append (item_template.substitute(history_item))
#
#        return self.history_template(item).substitute(
#                {'history_items': ''.join(html_items)})
#
#
#    def get_tags (self, item):
#        tags = []
#        if item['permit_type'] in (
#                'COALH', 'COALM', 'COALP', 'COALR', 'DRILD', 'DRDCM', 'FRACM'):
#            tags.append('coalbed methane')
#
#        if item['permit_type'] in (
#                'FRACM', 'FRACT', 'FRADD', 'FRAGI', 'FRAHW', 'FRANW', 'FRAPP'):
#            tags.append('frack')
#
#        if item['permit_type'] in ('BRIND', 'BRNDC'):
#            tags.append('brine')
#
#        if item['permit_type'] in ('PARTP', 'PLUG'):
#            tags.append('plug')
#
#        if item['permit_activity_type'] in ('Permit Issued', 'Permits Issued'):
#            tags.append('permit')
#
#        if item['permit_type'] not in ('ASSPN', 'POP', 'STOR', 'STORM'):
#            tags.append('drilling')
#            if item['permit_activity_type'] in ('Permit Commenced'):
#                tags.append('spud')
#
#        tags.append ('WVDEP')
#
#        return tags
#
#    def title_template (self, item):
#        if item['permit_activity_type'] in ('Permit Issued', 'Permits Issued'):
#            return Template ('WV $permit_type_full $permit_activity_type '
#                             'to $operator in $county County')
#        else:
#            return Template ('$operator Reports $permit_type_full '
#                             '$permit_activity_type in $county County')
#
#    def summary_template (self, item):
#        if item['permit_activity_type'] in ('Permit Issued', 'Permits Issued'):
#            return Template (
#                    'WV $permit_type_full $permit_activity_type '
#                    'on $permit_activity_date to $operator in $county County')
#        else:
#            return Template (
#                    '$operator Reports $permit_type_full '
#                    '$permit_activity_type '
#                    'on $permit_activity_date in $county County')
#
#    def history_template (self, item):
#        return Template ('<table>$history_items</table>')
#
#    def history_item_template (self, item):
#        return Template ('<tr><td>$permit_activity_date</td>'
#                         '<td>$permit_activity_type</td></tr>')
#
#
#    def content_template (self):
#        return Template (
#"""<b>Report Details</b><br/>
#Permit Type: $permit_type_full ($permit_type) <br/>
#Permit Activity Type: $permit_activity_type <br/>
#Activity Date: $permit_activity_date <br/>
#Operator: $operator <br/>
#Farm Name: $farm_name <br/>
#Well number: $well_number<br/>
#County: $county <br/>
#Well API Number: $API <br/>
#<b>History</b><br/>
#$history
#""")

def extract_text(td):
    if td is None:
        text = ""
    else:
        text = ' '.join(td.select('.//text()').extract()).strip()
    return text

def extract_link(td):
    if td is None:
        link = "None"
    else:
        link =  ' '.join(td.select('.//@href').extract()).strip()
    return link

def extract_date(td):
    date = convert_fuzzy_date(extract_text(td)).split()[0]
    return date

class Cogis_inspItemLoader(ItemLoader):
    #default_input_processor = Compose(TakeFirst(), extract_text)
    doc_num_in = \
    loc_id_in = \
    insp_api_num_in = \
    insp_status_in = \
    insp_overall_in = \
    ir_pass_fail_in = \
    fr_pass_fail_in = \
    violation_in = \
            Compose(TakeFirst(), extract_text)

    doc_href_in = Compose(TakeFirst(), extract_link)
    date_in = Compose(TakeFirst(), extract_date)
    county_code_in = TakeFirst()
    county_name_in = TakeFirst()

class Cogis_spillItemLoader(ItemLoader):
    doc_num_in = \
    facility_id_in = \
    operator_num_in = \
    company_name_in = \
    groundwater_in = \
    surfacewater_in = \
    berm_contained_in = \
    spill_area_in = \
            Compose(TakeFirst(), extract_text)
    doc_href_in = Compose(TakeFirst(), extract_link)
    date_in = Compose(TakeFirst(), extract_date)
    county_code_in = TakeFirst()
    county_name_in = TakeFirst()
