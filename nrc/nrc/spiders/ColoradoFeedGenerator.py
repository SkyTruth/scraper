import re
from datetime import datetime, timedelta
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



class ColoradoFeedGenerator (NrcBot):
    name = 'ColoradoFeedGenerator'
    batch_size = 10
    base_url = 'http://cogcc.state.co.us/COGIS/DrillingPermits.asp'
    source_id = 11
    task_conditions = {'ColoradoPermitScraper':'DONE'}
    permit_types = {
        'DE': 'Drill Deeper',
        'DR': 'Drill',
        'RC': 'Recomplete',
        'RE': 'Reenter',
        'ST': 'Drill Side Track'
    }

    def process_items (self):
        self.schedule_tasks ()
        for item in NrcBot.process_items (self):
            yield item

    # check to see if there are new tasks waiting to be processed
    # put new tasks into the task queue
    def schedule_tasks (self):
        params = self.bot_task_params(0)

        last_seqid = params['last_seqid']

        # get any new FracFocus records to be processed
        new_tasks = self.db.getColoradoPermitBatch (last_seqid, self.batch_size)
        for task in new_tasks:
            self.db.setBotTaskStatus(task['ft_id'], 'ColoradoPermitScraper', self.status_done)
            last_seqid = task['seqid']

        self.update_task_param(0, 'last_seqid', last_seqid)


    def process_item (self, task_id):
        params = self.db.loadColoradoPermitReport (task_id)

        params['county_name'] = params['county_name'].title()
        params['permit_type'] = self.permit_types.get (params['type_of_permit'], '')
        if params['permit_type']:
            params['permit_action'] = ' to %s' % params['permit_type']
        else:
            params['permit_action'] = ''

        html_params = {}
        for key,value in params.items():
            html_params[key] = escape("%s" % value)

        l=ItemLoader (FeedEntry())


        # TODO: Translate code in type_of_permit

        url = "%s/%s/%s" % (self.base_url, params['api'], params['approved_date'])
        #feed_entry_id = uuid.uuid3(uuid.NAMESPACE_URL, url.encode('ASCII'))
        feed_entry_id = self.db.uuid3_str(name=url.encode('ASCII'))
        l.add_value ('id', feed_entry_id)
        l.add_value ('title', "%(operator_name)s Issued Permit%(permit_action)s in %(county_name)s County, CO" % params)
        l.add_value ('incident_datetime', params['approved_date'])
        l.add_value ('link', params['record_url'])

        l.add_value ('summary', self.summary_template().substitute(html_params))
        l.add_value ('content', self.content_template().substitute(html_params))

        l.add_value ('lat', params['latitude'])
        l.add_value ('lng', params['longitude'])
        l.add_value ('source_id', self.source_id)

        feed_item = l.load_item()

        if feed_item.get('lat') and feed_item.get('lng'):
            yield feed_item

            yield self.create_tag (feed_entry_id, 'colorado')
            yield self.create_tag (feed_entry_id, 'cogcc')
            yield self.create_tag (feed_entry_id, 'permit')
            yield self.create_tag (feed_entry_id, 'drilling')

            self.item_completed (task_id)

        else:
            self.item_dropped (task_id)

    #TODO: Move this to nrcBot

    def create_tag (self, feed_entry_id,  tag, comment = ''):
        # TODO: create tags
        l = ItemLoader (FeedEntryTag())
        l.add_value ('feed_entry_id', feed_entry_id)
        l.add_value ('tag', tag)
        l.add_value ('comment', comment)
        return l.load_item()

    def summary_template (self):
        return Template ("$operator_name issued drilling permit on $approved_date in $county_name County, Colorado")

    def content_template (self):
        return Template (
"""<b>Report Details</b>
<table>
<tr><th>Operator</th><td>$operator_name</td></tr>
<tr><th>Operator Number</th><td>$operator_number</td></tr>
<tr><th>Approval Date Type</th><td> $approved_date</td></tr>
<tr><th>API</th><td> $api</td></tr>
<tr><th>Permit Type</th><td>$type_of_permit $permit_type</td></tr>
<tr><th>Well Name</th><td>$well_name</td></tr>
<tr><th>Well Number</th><td>$well_number</td></tr>
<tr><th>Well Location</th><td>$well_location</td></tr>
<tr><th>Field</th><td> $field</td></tr>
<tr><th>Proposed Total Depth</th><td>$proposed_td</td></tr>
<tr><th>Elevation</th><td>$elevation</td></tr>
<tr><th>County</th><td>$county_name</td></tr>
<tr><th>State</th><td>Colorado</td></tr>
</table>

""")


