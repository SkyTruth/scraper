# PA Well Permit Scraper

import re
from datetime import datetime, timedelta
import xlrd
#import uuid
from string import Template
from xml.sax.saxutils import escape
from dateutil.parser import parse as parse_date

from scrapy.spider import BaseSpider
from scrapy.contrib.loader import ItemLoader
from scrapy.http import Request, Response, TextResponse
from scrapy.contrib.loader.processor import TakeFirst, MapCompose, Join
from scrapy.shell import inspect_response
from scrapy import log
#from scrapy.stats import stats

from nrc.items import PA_DrillingPermit, FeedEntry, FeedEntryTag
from nrc.database import NrcDatabase
from nrc.NrcBot import NrcBot
from nrc.AtomPubScraper import AtomPubScraper


class PAPermitScraper (AtomPubScraper):
    name = 'PAPermitScraper'
    allowed_domains = None

    def process_item(self, task):
        from_date = parse_date('11-01-2012', fuzzy=1)
        to_date =  parse_date('12-31-2013', fuzzy=1)
        if 'from_date' in task and 'to_date' in task:
            from_date = parse_date(task['from_date'], fuzzy=1)
            to_date = parse_date(task['to_date'], fuzzy=1)
        elif 'date_offset' in task:
            to_date = datetime.today()
            from_date = to_date - timedelta(days=int(task['date_offset']))

        date_fmt = "%m/%d/%Y 23:59:59"
        target_url = ("%s&P_START_DATE=%s&P_END_DATE=%s"
                      % (task['target_url'],
                         from_date.strftime(date_fmt),
                         to_date.strftime(date_fmt)))

        request = Request (target_url, callback=self.parse_xml)
        self.log('Downloading xml from url %s' % (target_url), log.INFO)
        request.meta['task'] = task
        yield request

    def process_row (self, row, task):

        #screen for bad API
        if not self.base_api(row['WELL_API']):
            self.log("Invalid API '';".format(row['WELL_API']), log.WARNING)
            yield None
            return

        l=ItemLoader (PA_DrillingPermit())
        l.Well_Type_in = lambda slist: [s[:20] for s in slist]
        l.County_Name_in = lambda slist: [s[:20] for s in slist]
        l.Municipality_Name_in = lambda slist: [s[:20] for s in slist]
        l.Site_Name_in = lambda slist: [s[:50] for s in slist]

        #l.add_value ('County_Name', row['COUNTY_NAME'])
        l.add_value ('County_Name', row['COUNTY'])
        #l.add_value ('Municipality_Name', row['MUNICIPALITY_NAME'])
        l.add_value ('Municipality_Name', row['MUNICIPALITY'])
        l.add_value ('Auth_Id', row['AUTHORIZATION_ID'])
        l.add_value ('Date_Disposed', self.parse_date(row['PERMIT_ISSUED_DATE']))
        l.add_value ('Appl_Type_Code', row['APPLICATION_TYPE'])
        l.add_value ('Auth_Type_Description', row['AUTH_TYPE_DESCRIPTION'])
        l.add_value ('Complete_API_', row['WELL_API'])
        l.add_value ('Other_Id', self.base_api(row['WELL_API']))
#        l.add_value ('Marcellus_Shale_Well', row['MARCELLUS_SHALE_IND'])
        #l.add_value ('Horizontal_Well', row['HORIZONTAL_WELL_IND'])
        if row['CONFIGURATION'] in ("Horizontal Well", "Deviated Well"):
            horiz = 'Y'
        else:
            horiz = 'N'
            if row['CONFIGURATION'] not in ("Vertical Well",):
                self.log("Unknown PA Configuration: {0}."
                         .format(row['CONFIGURATION']), log.INFO)
        l.add_value ('Horizontal_Well', horiz)
        l.add_value ('Well_Type', row['WELL_TYPE'])
        l.add_value ('Site_Name', row['FARM_NAME'])
        l.add_value ('Latitude_Decimal', row['LATITUDE_DECIMAL'])
        l.add_value ('Longitude_Decimal', row['LONGITUDE_DECIMAL'])
        l.add_value ('Client_Id', row['CLIENT_ID'])
        l.add_value ('Operator', row['OPERATOR'])
        l.add_value ('Address1', row['OPERATOR_ADDRESS'])
        l.add_value ('City', row['CITY'])
        l.add_value ('State_Code', row['STATE'])
        l.add_value ('Zip_Code', row['ZIP_CODE'])

        l.add_value ('Unconventional', row['UNCONVENTIONAL'])
        l.add_value ('OGO_Num', row['OGO_NUM'])
        #l.add_value ('Facility_Id', row['PRIMARY_FACILITY_ID'])
        l.add_value ('Facility_Id', row['PRMRY_FAC_ID'])

        item = l.load_item()
        if item['Complete_API_'] and item ['Date_Disposed']:
            stats = self.crawler.stats
            existing_item = self.db.loadItem (item, {'Complete_API_': item['Complete_API_'], 'Date_Disposed': item ['Date_Disposed']})

            if existing_item:
#                diff = item.contentDiff (existing_item)

#                if diff:
#                    self.send_alert ('PA Permit values in %s have changed since previous scrape\n\n%s' % (item, diff))
#                    self.log ('PA Permit values in %s have changed since previous scrape\n\n%s' % (item, diff), log.ERROR)
#                    stats.inc_value ('_error_count', spider=self)
#                else:
#                    self.log('Skipping existing item %s' % (item), log.DEBUG)
#                    stats.inc_value ('_unchanged_count', spider=self)

                stats.inc_value ('_existing_count', spider=self)
            else:
                stats.inc_value ('_new_count', spider=self)
                yield item

                params = dict(item)
                for f in item.fields:
                    params[f] = escape ("%s" % params.get(f,''))

                params['Appl_Type_Code'] = self.get_appl_type(item)
                params['Well_Type'] = self.get_well_type(item)

                # create a new feed item
                l=ItemLoader (FeedEntry())

                url = "%s/%s/%s" % (task['target_url'], item['Complete_API_'], item ['Date_Disposed'])
                #feed_entry_id = uuid.uuid3(uuid.NAMESPACE_URL, url.encode('ASCII'))
                feed_entry_id = self.db.uuid3_str(name=url.encode('ASCII'))
                l.add_value ('id', feed_entry_id)
                l.add_value ('title', "PA %s Drilling Permit Issued in %s Township" % (params.get('Well_Type'), item.get('Municipality_Name') ))
#                l.add_value ('updated', item.get('Date_Disposed'))
                l.add_value ('incident_datetime', item.get('Date_Disposed'))
                l.add_value ('link', task['about_url'])


                l.add_value ('summary', self.summary_template().substitute(params))
                l.add_value ('content', self.content_template().substitute(params))

                l.add_value ('lat', item.get('Latitude_Decimal'))
                l.add_value ('lng', item.get('Longitude_Decimal'))
                l.add_value ('source_id', 4)

                feed_item = l.load_item()

                if feed_item.get('lat') and feed_item.get('lng'):
                    yield feed_item

                    yield self.create_tag (feed_entry_id, 'PADEP')
                    yield self.create_tag (feed_entry_id, 'frack')
                    yield self.create_tag (feed_entry_id, 'permit')
                    yield self.create_tag (feed_entry_id, 'drilling')
                    if item.get('Marcellus_Shale_Well') == 'Y':
                        yield self.create_tag (feed_entry_id, 'marcellus')
                    well_type = params.get('Well_Type')
                    if well_type:
                        yield self.create_tag (feed_entry_id, well_type)


    def base_api(self, complete_api):
        rex = r'[0-9]{3}-[0-9]{5}'
        mo = re.match(rex, complete_api)
        if mo:
            return mo.group()
        return ''

    def create_tag (self, feed_entry_id, tag, comment = ''):
        l = ItemLoader (FeedEntryTag())
        l.add_value ('feed_entry_id', feed_entry_id)
        l.add_value ('tag', tag)
        l.add_value ('comment', comment)
        return l.load_item()

    def item_stored(self, item, id):
        self.item_new (id)
        pass

    def get_appl_type (self, item):
        m = {'NEW': 'New', 'REN': 'Renewal'}
        code = item.get('Appl_Type_Code')
        return m.get(code, code)

    def get_well_type (self, item):
        m = {'GAS': 'Gas', 'OIL': 'Oil'}
        code = item.get('Well_Type')
        return m.get(code, code)

    def summary_template (self):
        return Template ("$Well_Type permit issued on $Date_Disposed to $Operator for site $Site_Name in $Municipality_Name township, $County_Name county")


    def content_template (self):
        return Template (
"""<b>Report Details</b>
<table>
<tr><th>Well Type:</th><td>$Well_Type</td></tr>
<tr><th>Permit Issued:</th><td>$Date_Disposed</td></tr>
<tr><th>Operator:</th><td>$Operator</td></tr>
<tr><th>Site Name:</th><td>$Site_Name</td></tr>
<tr><th>Township:</th><td>$Municipality_Name</td></tr>
<tr><th>County:</th><td>$County_Name</td></tr>
<tr><th>Permit Type:</th><td>$Appl_Type_Code</td></tr>
<tr><th>Description:</th><td>$Auth_Type_Description</td></tr>
<tr><th>Unconventional:</th><td>$Unconventional</td></tr>
<tr><th>Horizontal:</th><td>$Horizontal_Well</td></tr>
<tr><th>Total Depth:</th><td>$Total_Depth</td></tr>
<tr><th>Well API Number:</th><td>$Complete_API_</td></tr>
<tr><th>OGO Number:</th><td>$OGO_Num</td></tr>
<tr><th>Facility ID:</th><td>$Facility_Id</td></tr>
</table>
""")
