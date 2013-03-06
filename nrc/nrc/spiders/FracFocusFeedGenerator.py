import re
from datetime import datetime, timedelta, time
import json
import uuid
from string import Template
from xml.sax.saxutils import escape

from xml.etree import ElementTree
from scrapy.spider import BaseSpider
from scrapy.contrib.loader import ItemLoader
from scrapy.http import Request, Response, TextResponse
from scrapy.contrib.loader.processor import TakeFirst, MapCompose, Join
from scrapy.shell import inspect_response
from scrapy import log
#from scrapy.stats import stats

from nrc.database import NrcDatabase
from nrc.NrcBot import NrcBot
from nrc.items import FeedEntry, FeedEntryTag



class FracFocusFeedGenerator (NrcBot):
    name = 'FracFocusFeedGenerator'
    batch_size = 10
    base_url = 'http://www.fracfocusdata.org/fracfocusfind'
    source_id = 10
    task_conditions = {'FracFocusAnalyzer':'DONE'}


#    def process_items (self):
#        self.schedule_tasks ()
#        for item in NrcBot.process_items (self):
#            yield item
#
#    # check to see if there are new tasks waiting to be processed
#    # put new tasks into the task queue
#    def schedule_tasks (self):
#        params = self.bot_task_params(0)
#
#        last_seqid = params['last_seqid']
#
#        # get any new FracFocus records to be processed
#        new_tasks = self.db.getFracFocusBatch (last_seqid, self.batch_size)
#        for task in new_tasks:
#            self.db.setBotTaskStatus(task['ft_id'], 'FracFocusScraper', self.status_done)
#            last_seqid = task['seqid']
#
#        self.update_task_param(0, 'last_seqid', last_seqid)


    def process_item (self, task_id):
#        scrape = self.db.loadFracFocusScrape (task_id)
#        report = self.db.loadFracFocusReport (scrape['api'], scrape['job_date'])
        report = self.db.loadFracFocusReport (task_id)
        if not report:
#            self.log('No FracFocusReport found for task_id=%s  api=%s job_date=%s '%(task_id,scrape['api'], scrape['job_date']), log.ERROR)
            self.log('No FracFocusReport found for task_id=%s'%(task_id,), log.ERROR)
            yield self.make_bot_task_error(task_id, 'NOT_FOUND','')
            self.item_dropped (task_id)
            return

        chemicals = self.db.loadFracFocusReportChemicals (report['pdf_seqid'])
        if not chemicals:
            yield self.make_bot_task_error(task_id, 'NOT_FOUND','FracFocusReportChemicals')
            self.log('No FracFocusReportChemicals found for pdf_seqid=%s'%report['pdf_seqid'], log.ERROR)

        params = report
        html_params = {}
        for key,value in params.items():
            html_params[key] = escape("%s" % value)

        html_params['chemicals_html'] = self.create_chemicals_html(chemicals)

        l=ItemLoader (FeedEntry())

        url = "%s/%s/%s" % (self.base_url, params['api'], params['fracture_date'])
        #feed_entry_id = uuid.uuid3(uuid.NAMESPACE_URL, url.encode('ASCII'))
        feed_entry_id = self.db.uuid3_str(name=url.encode('ASCII'))
        l.add_value ('id', feed_entry_id)
        l.add_value ('title', "%(operator)s Reports %(production_type)s Well Frack at %(well_name)s Site in %(county)s County, %(state)s" % params)
        l.add_value ('incident_datetime', params['fracture_date'])
        l.add_value ('link', self.base_url)

        l.add_value ('summary', self.summary_template().substitute(html_params))
        l.add_value ('content', self.content_template().substitute(html_params))

        l.add_value ('lat', params['latitude'])
        l.add_value ('lng', params['longitude'])
        l.add_value ('source_id', self.source_id)

        feed_item = l.load_item()

        if feed_item.get('lat') and feed_item.get('lng') and (datetime.now() - datetime.combine(feed_item.get('incident_datetime'),time()) < timedelta(days=30)):
            yield feed_item

            yield self.create_tag (feed_entry_id, 'FracFocus')
            yield self.create_tag (feed_entry_id, 'frack')
            if params['production_type']:
                yield self.create_tag (feed_entry_id, params['production_type'])
            yield self.create_tag (feed_entry_id, 'drilling')

            self.item_completed (task_id)

        else:
            self.item_dropped (task_id)

    def create_chemicals_html (self, chemicals):
        chemicals_html = []
        if not chemicals:
            return ""

        for c in chemicals:
            params = c
            html_params = {}
            for key,value in params.items():
                html_params[key] = escape("%s" % value)
            chemicals_html.append(self.chemical_template().substitute(html_params))
        return ''.join(chemicals_html)



    def create_tag (self, feed_entry_id,  tag, comment = ''):
        # TODO: create tags
        l = ItemLoader (FeedEntryTag())
        l.add_value ('feed_entry_id', feed_entry_id)
        l.add_value ('tag', tag)
        l.add_value ('comment', comment)
        return l.load_item()

    def summary_template (self):
        return Template ("FracFocus disclosure published: $operator reports chemicals used in a $production_type frack on $fracture_date at $well_name site in $county County, $state")

    def content_template (self):
        return Template (
"""
<p><b>FracFocus Report</b><br/>
SkyTruth published this alert because a new public disclosure was detected at <a href="http://www.fracfocus.org">FracFocus.org</a>.</p>
<b>Report Details</b>
<table class='report_details'>
<tr><th>Operator:</th><td>$operator</td></tr>
<tr><th>Fracture Date:</th><td> $fracture_date</td></tr>
<tr><th>API:</th><td> $api</td></tr>
<tr><th>Well Type:</th><td> $production_type</td></tr>
<tr><th>Well Name:</th><td> $well_name</td></tr>
<tr><th>True Vertical Depth:</th><td> $true_vertical_depth</td></tr>
<tr><th>Total Water Volume (gal):</th><td> $total_water_volume</td></tr>
<tr><th>County:</th><td>$county</td></tr>
<tr><th>State:</th><td>$state</td></tr>
</table>
<p><b>Chemicals Injected</b><br/>
The full public disclosure includes certain chemicals that were used in the frack job.<br/>
Unfortunately, the FracFocus website does not permit direct links to frack disclosure documents.  To view the complete disclosure report, go to <a href="http://www.fracfocusdata.org/fracfocusfind/Default.aspx">www.fracfocus.org</a> and search for this report using the API Number: <b>$api</b>
<p>

""")

    def chemical_template (self):
        return Template (
"""
<tr><td>$ingredients</td><td>$cas_number</td></tr>
""")

