# PA Permit Violation Scraper

import re
from datetime import datetime, timedelta
import xlrd
import uuid
from string import Template
from xml.sax.saxutils import escape
from dateutil.parser import parse as parse_date

from scrapy.spider import BaseSpider
from scrapy.contrib.loader import ItemLoader
from scrapy.http import Request, Response, TextResponse
from scrapy.contrib.loader.processor import TakeFirst, MapCompose, Join
from scrapy.shell import inspect_response
from scrapy import log

from nrc.items import PA_Violation, FeedEntry, FeedEntryTag, PA_DrillingPermit
from nrc.database import NrcDatabase
from nrc.NrcBot import NrcBot
from nrc.AtomPubScraper import AtomPubScraper


class PAViolationScraper (AtomPubScraper):
    name = 'PAViolationScraper'
    allowed_domains = None
    current_inspection = []

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
        target_url = ("%s&P_DATE_INSPECTED_FROM=%s&P_DATE_INSPECTED_TO=%s"
                      % (task['target_url'],
                         from_date.strftime(date_fmt),
                         to_date.strftime(date_fmt)))

        request = Request (target_url, callback=self.parse_xml)
        self.log('Downloading xml from url %s' % (target_url), log.INFO)
        request.meta['task'] = task
        yield request

    def process_row (self, row, task):

        l=ItemLoader (PA_Violation())
        l.County_in = lambda slist: [s[:20] for s in slist]
        l.Municipality_in = lambda slist: [s[:20] for s in slist]

        l.add_value ('InspectionID', row['INSPECTION_ID'])
        l.add_value ('ViolationID', row['VIOLATION_ID'])
        l.add_value ('EnforcementID', row['ENFORCEMENT_ID'])
        l.add_value ('Operator', row['OPERATOR'])
        l.add_value ('Region', row['REGION'])
        l.add_value ('InspectionDate',  self.parse_date(row['INSPECTION_DATE']))
        l.add_value ('InspectionType', row['INSPECTION_TYPE'])
        l.add_value ('Permit_API', row['PERMIT_NUM'])
#        l.add_value ('IsMarcellus', row['MARCELLUS_IND1'])
        l.add_value ('InspectionCategory', row['INSPECTION_CATEGORY'])
        l.add_value ('County', row['COUNTY'])
        l.add_value ('Municipality', row['MUNICIPALITY'])
        l.add_value ('InspectionResult', row['INSPECTION_RESULT_DESCRIPTION'])
        l.add_value ('InspectionComment', row['INSPECTION_COMMENT'])
        l.add_value ('ViolationDate', self.parse_date(row['VIOLATION_DATE']))
        l.add_value ('ViolationCode', row['VIOLATION_CODE'])
        l.add_value ('ViolationType', row['VIOLATION_TYPE'])
        l.add_value ('ViolationComment', row['VIOLATION_COMMENT'])
        l.add_value ('ResolvedDate', self.parse_date(row['RESOLVED_DATE']))
        l.add_value ('EnforcementCode', row['ENFORCEMENT_CODE_DESCRIPTION'])
        l.add_value ('PenaltyFinalStatus', row['PENALTY_FINAL_STATUS_CODE_DESCRIPTION'])
        l.add_value ('PenaltyDateFinal', self.parse_date(row['COMPLETED_DATE']))
        l.add_value ('EnforcementDateFinal', self.parse_date(row['FINAL_ENFORCEMENT_DATE']))
        l.add_value ('PenaltyAmount', row['PENALTY_AMOUNT'])
        l.add_value ('TotalAmountCollected', row['TOTAL_AMOUNT_COLLECTED'])

        l.add_value ('Unconventional', row['UNCONVENTIONAL'])

        item = l.load_item()

#        print item['ViolationID']

        if item['ViolationID']:
            stats = self.crawler.stats
            existing_item = self.db.loadItem (item, {'ViolationID': item['ViolationID']})

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

                if self.current_inspection and params['InspectionID'] != self.current_inspection[0]['InspectionID']:
                    for entry in self.create_feed_entry (self.current_inspection, task):
                        yield entry
                    self.current_inspection = [params]
                else:
                    self.current_inspection.append (params)

    def finalize_rows (self, task):
        if self.current_inspection:
            for entry in self.create_feed_entry (self.current_inspection, task):
                yield entry


    def create_feed_entry (self, inspection, task):

        # create a new feed item
        l=ItemLoader (FeedEntry())

        params = inspection[0]
        params['Operator'] = params['Operator'].title()

        url = "%s/%s" % (task['target_url'], params['InspectionID'])
        #feed_entry_id = uuid.uuid3(uuid.NAMESPACE_URL, url.encode('ASCII'))
        feed_entry_id = self.db.uuid3_str(name=url.encode('ASCII'))
        l.add_value ('id', feed_entry_id)
        l.add_value ('title', "PA Permit Violation Issued to %(Operator)s in %(Municipality)s, %(County)s County" % params)
        l.add_value ('incident_datetime', params['InspectionDate'])
        l.add_value ('link', task['about_url'])

        params['InspectionDate'] = params['InspectionDate'][0:10]
        params['ViolationDate'] = params['ViolationDate'][0:10]

        l.add_value ('summary', self.summary_template().substitute(params))
        l.add_value ('content', self.create_feed_entry_content(inspection))

        location = self.find_location (params)
        if location:
            l.add_value ('lat', location['lat'])
            l.add_value ('lng', location['lng'])
        l.add_value ('source_id', 9)

        feed_item = l.load_item()

        if feed_item.get('lat') and feed_item.get('lng'):
            yield feed_item

            yield self.create_tag (feed_entry_id, 'PADEP')
            yield self.create_tag (feed_entry_id, 'frack')
            yield self.create_tag (feed_entry_id, 'violation')
            yield self.create_tag (feed_entry_id, 'drilling')
            if params.get('IsMarcellus') == 'Y':
                yield self.create_tag (feed_entry_id, 'marcellus')


    def create_tag (self, feed_entry_id, tag, comment = ''):
        l = ItemLoader (FeedEntryTag())
        l.add_value ('feed_entry_id', feed_entry_id)
        l.add_value ('tag', tag)
        l.add_value ('comment', comment)
        return l.load_item()

    def create_feed_entry_content (self, inspection):
        violations = ''.join([self.violation_template().substitute(v) for v in inspection])
        enforcements = {}
        for e in inspection:
            if e.get('EnforcementID'):
                enforcements[e['EnforcementID']] = e
        enforcements = ''.join([self.enforcement_template().substitute(v) for k,v in enforcements.items()])
        inspection =  self.inspection_template().substitute(inspection[0])
        params = {'inspection': inspection, 'violations': violations, 'enforcements': enforcements}
        return self.content_template().substitute(params)

    def find_location(self, params):
        print params
        if params['Permit_API']:
            item = self.db.loadItem(PA_DrillingPermit(), {'Other_Id': params['Permit_API']})
            if item:
                return {'lat': item.get('Latitude_Decimal'), 'lng': item.get('Longitude_Decimal')}

        self.log('No location info found for violation id: %s' % (params['ViolationID']), log.WARNING)
        return None

    def item_stored(self, item, id):
        self.item_new (id)
        pass

    def summary_template (self):
        return Template ("$ViolationType violation issued on $InspectionDate to $Operator in $Municipality, $County county. $ViolationCode")

    def content_template (self):
        return Template (
"""$inspection<br/>
<b>Violation(s)</b>
<table>
$violations
</table>
<b>Enforcement Action(s)</b>
<table>
<tr><th>ID</th><th>Code</th></tr>
$enforcements
</table>
""")

    def inspection_template (self):
        return Template (
"""<b>Report Details</b>
<table width="100%">
<tr><th>Operator</th><td> $Operator</td></tr>
<tr><th>Violation Type</th><td> $ViolationType</td></tr>
<tr><th>Violation Date</th><td> $ViolationDate</td></tr>
<tr><th>Violation Code</th><td> $ViolationCode</td></tr>
<tr><th>Violation ID</th><td> $ViolationID</td></tr>
<tr><th>Permit API</th><td> $Permit_API</td></tr>
<tr><th>Unconventional</th><td> $Unconventional</td></tr>
<tr><th>County</th><td> $County</td></tr>
<tr><th>Municipality</th><td> $Municipality</td></tr>
<tr><th>Inspection Type</th><td> $InspectionType</td></tr>
<tr><th>Inspection Date</th><td> $InspectionDate</td></tr>
<tr><th>Comments</th><td> $InspectionComment $ViolationComment</td></tr>
</table>
""")

    def violation_template (self):
        return Template (
"""<tr><td>
<strong>ID:</strong> $ViolationID
<strong>Date:</strong> $ViolationDate
<strong>Type:</strong> $ViolationType
</td></tr>
<tr><td>$ViolationCode $ViolationComment</td></tr>
<tr><td></td></tr>
""")

    def enforcement_template (self):
        return Template (
"""<tr><td>$EnforcementID</td><td>$EnforcementCode</td></tr>
""")


