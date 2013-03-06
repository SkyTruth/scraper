# COGIS Inspection/Spill Records Scraper

# std library
import re
from datetime import datetime, timedelta
from string import Template
from xml.sax.saxutils import escape
from urlparse import urlsplit, urljoin
from random import shuffle

# site modles
from scrapy.item import Field
from scrapy.contrib.loader import ItemLoader
from scrapy.contrib.loader.processor import TakeFirst, Compose
from scrapy.contrib.loader.processor import Identity, Join
from scrapy.http import Request, FormRequest
from scrapy.shell import inspect_response
from scrapy import log
from scrapy.selector import HtmlXPathSelector

# local modules
from nrc.items import NrcItem, FeedEntry, FeedEntryTag
from nrc.items import convert_fuzzy_date
from nrc.NrcBot import NrcBot


COGCC_SERVER = "cogcc.state.co.us"
COGCC_PAGE = "http://{0}/cogis".format(COGCC_SERVER)

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
        if table == 'insp':
            CogisInspection.task = task
        else:
            CogisSpill.task = task
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
        if response.meta['county'][0] == self.county_ids[-1]:
            self.item_completed (task['task_id'])

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

    def item_stored(self, item, id):
        self.log('Stored item %s to NEW' % (item['doc_num'],), log.INFO)
        self.item_new(item['doc_num'])

class CogisSpillScraper (CogisScraper):
    name = 'CogisSpillScraper'

class CogisInspection (NrcItem):
    insert_mode = 'replace'
    st_id = Field()
    doc_num = Field()
    county_code = Field()
    county_name = Field()
    date = Field()
    doc_href = Field()
    operator = Field()
    loc_id = Field()
    insp_api_num = Field()
    insp_status = Field()
    insp_overall = Field()
    ir_pass_fail = Field()
    fr_pass_fail = Field()
    violation = Field()
    site_lat = Field()
    site_lng = Field()
    time_stamp = Field()
    ft_id = Field()

class CogisSpill (NrcItem):
    insert_mode = 'replace'
    st_id = Field()
    doc_num = Field()
    county_code = Field()
    county_name = Field()
    date = Field()
    doc_href = Field()
    facility_id = Field()
    operator_num = Field()
    company_name = Field()
    groundwater = Field()
    surfacewater = Field()
    berm_contained = Field()
    spill_area = Field()
    spill_lat = Field()
    spill_lng = Field()
    time_stamp = Field()
    ft_id = Field()

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
        if link.find("http")<0 and link.find(COGCC_SERVER)<0:
            link = '/'.join([COGCC_PAGE, link])
    return link

def extract_date(td):
    raw_date = extract_text(td)
    if raw_date is None or raw_date == '' or raw_date == 'N/A':
        return ""
    date = convert_fuzzy_date(raw_date).split()[0]
    return date

class Cogis_inspItemLoader(ItemLoader):
    default_input_processor = Compose(TakeFirst(), extract_text)
    doc_href_in = Compose(TakeFirst(), extract_link)
    date_in = Compose(TakeFirst(), extract_date)
    county_code_in = TakeFirst()
    county_name_in = TakeFirst()
    default_output_processor = TakeFirst()

class Cogis_spillItemLoader(ItemLoader):
    default_input_processor = Compose(TakeFirst(), extract_text)
    doc_href_in = Compose(TakeFirst(), extract_link)
    date_in = Compose(TakeFirst(), extract_date)
    county_code_in = TakeFirst()
    county_name_in = TakeFirst()
    default_output_processor = TakeFirst()
