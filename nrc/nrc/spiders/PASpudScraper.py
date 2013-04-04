# PA Well Permit Scraper

import re
from datetime import datetime, timedelta
import xlrd
#import uuid
from string import Template
from xml.sax.saxutils import escape


from scrapy.spider import BaseSpider
from scrapy.contrib.loader import ItemLoader
from scrapy.http import Request, Response, TextResponse
from scrapy.contrib.loader.processor import TakeFirst, MapCompose, Join
from scrapy.shell import inspect_response
from scrapy import log
#from scrapy.stats import stats

from nrc.items import PA_Spud, FeedEntry, FeedEntryTag
from nrc.database import NrcDatabase
from nrc.NrcBot import NrcBot
from nrc.AtomPubScraper import AtomPubScraper


class PASpudScraper (AtomPubScraper):
    name = 'PASpudScraper'
    allowed_domains = None


    def process_row (self, row, task):

        l=ItemLoader (PA_Spud())
        l.County_in = lambda slist: [s[:20] for s in slist]
        l.Municipality_in = lambda slist: [s[:20] for s in slist]
        l.Created_By_in = lambda slist: [s[:20] for s in slist]
        l.Modified_By_in = lambda slist: [s[:20] for s in slist]
        l.Well_Type_in = lambda slist: [s[:20] for s in slist]

        #l.add_value ('OGO__', row['OPERATOR_OGO_NUM'])
        l.add_value ('OGO__', row['OGO_NUM'])
        l.add_value ('SPUD_Date', self.parse_date(row['SPUD_DATE']))
        l.add_value ('County', row['COUNTY'])
        l.add_value ('Municipality', row['MUNICIPALITY'])
        l.add_value ('Operator_s_Name', row['OPERATOR'])
        l.add_value ('Farm_Name', row['FARM_NAME'])
        #l.add_value ('Well_Number', row['WELL_NUM'])
        l.add_value ('Well_Number', '')  # Now included in FARM_NAME
        l.add_value ('Latitude', row['LATITUDE'])
        l.add_value ('Longitude', row['LONGITUDE'])
#        l.add_value ('Marcellus_Ind_', row['MARCELLUS_IND'])
        #l.add_value ('Horizontal_Ind_', row['HORIZONTAL_WELL_IND'])
        if row['CONFIGURATION'] in ("Horizontal Well", "Deviated Well"):
            horiz = 'Y'
        else:
            horiz = 'N'
            if row['CONFIGURATION'] not in ("Vertical Well",):
                self.log("Unknown PA Configuration: {0}."
                         .format(row['CONFIGURATION']), log.INFO)
        l.add_value ('Horizontal_Ind_', horiz)
        #l.add_value ('Creation_Date', self.parse_date(row['CREATED_DATE']))
        #l.add_value ('Created_By', row['CREATED_BY'])
        #l.add_value ('Modification_Date', self.parse_date(row['MODIFIED_DATE']))
        #l.add_value ('Modified_By', row['MODIFIED_BY'])

        #l.add_value ('Well_Type', row['WELL_TYPE'])
        l.add_value ('Well_Type', row['WELL_CODE_DESC'])

        l.add_value ('Unconventional', row['UNCONVENTIONAL'])
        l.add_value ('Region', row['REGION'])

        #l.add_value ('Well_API__', '37-%s-00-00' % row['PERMIT_NUMBER'])
        l.add_value ('Well_API__', '37-%s-00-00' % row['API'])


        item = l.load_item()
        if item['Well_API__'] and item ['SPUD_Date']:
            stats = self.crawler.stats
            existing_item = self.db.loadItem (item, {'Well_API__': item['Well_API__'], 'SPUD_Date': item ['SPUD_Date']})

            if existing_item:
                stats.inc_value ('_existing_count', spider=self)
            else:
                stats.inc_value ('_new_count', spider=self)
                yield item

                params = dict(item)
                for f in item.fields:
                    params[f] = escape ("%s" % params.get(f,''))

                if task.get('no_alert'):
                    pass
                else:
                    # create a new feed item
                    l=ItemLoader (FeedEntry())

                    url = "%s/%s/%s" % (task['target_url'], item['Well_API__'], item ['SPUD_Date'])
                    #feed_entry_id = uuid.uuid3(uuid.NAMESPACE_URL, url.encode('ASCII'))
                    feed_entry_id = self.db.uuid3_str(name=url.encode('ASCII'))
                    l.add_value ('id', feed_entry_id)
                    l.add_value ('title', "%s Reports Drilling Started (SPUD) in %s Township" % (item.get('Operator_s_Name'), item.get('Municipality') ))
                    l.add_value ('incident_datetime', item.get('SPUD_Date'))
                    l.add_value ('link', task['about_url'])


                    l.add_value ('summary', self.summary_template().substitute(params))
                    l.add_value ('content', self.content_template().substitute(params))

                    l.add_value ('lat', item.get('Latitude'))
                    l.add_value ('lng', item.get('Longitude'))
                    l.add_value ('source_id', 5)

                    feed_item = l.load_item()

                    if feed_item.get('lat') and feed_item.get('lng'):
                        yield feed_item

                        yield self.create_tag (feed_entry_id, 'PADEP')
                        yield self.create_tag (feed_entry_id, 'frack')
                        yield self.create_tag (feed_entry_id, 'spud')
                        yield self.create_tag (feed_entry_id, 'drilling')
                        well_type = item.get('Well_Type')
                        if well_type:
                            yield self.create_tag (feed_entry_id, well_type.lower())
                        if item.get('Unconventional') == 'Yes':
                            yield self.create_tag (feed_entry_id, 'unconventional')


    def create_tag (self, feed_entry_id, tag, comment = ''):
        l = ItemLoader (FeedEntryTag())
        l.add_value ('feed_entry_id', feed_entry_id)
        l.add_value ('tag', tag)
        l.add_value ('comment', comment)
        return l.load_item()

    def item_stored(self, item, id):
        self.item_new (id)
        pass

    def summary_template (self):
        return Template ("$Operator_s_Name reports drilling started on $SPUD_Date at site $Farm_Name in $Municipality township, $County county")

    def content_template (self):
        return Template (
"""<b>Report Details</b>
<table>
<tr><th>Operator:</th><td>$Operator_s_Name</td></tr>
<tr><th>Permit Issued:</th><td>$SPUD_Date</td></tr>
<tr><th>Site Name:</th><td>$Farm_Name</td></tr>
<tr><th>Township:</th><td>$Municipality</td></tr>
<tr><th>County:</th><td>$County</td></tr>
<tr><th>Unconventional:</th><td>$Unconventional</td></tr>
<tr><th>Horizontal:</th><td>$Horizontal_Ind_</td></tr>
<tr><th>Well API Number:</th><td>$Well_API__</td></tr>
<tr><th>OGO Number:</th><td>$OGO__</td></tr>
<tr><th>Well Number:</th><td>$Well_Number</td></tr>
<tr><th>Region:</th><td>$Region</td></tr>
</table>
""")

