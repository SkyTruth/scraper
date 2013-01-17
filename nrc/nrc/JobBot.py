# -*- coding: utf-8 -*-
"""
Created on Tue Jan 15 11:23:50 2013

@author: Craig
"""

# standard modules

# site modules
from scrapy.spider import BaseSpider
from scrapy import log
from scrapy.http import Request, Response, TextResponse
from scrapy.selector import HtmlXPathSelector, XmlXPathSelector
from scrapy.xlib.pydispatch import dispatcher
from scrapy import signals

# local modules
from nrc.database import NrcDatabase
from nrc import settings
from nrc.GeoDatabase import GeoDatabase

# CONSTANTS


class JobBot(BaseSpider):
    name = 'JobBot'
    allowed_domains = ['skytruth.org']
    db = None
    geodb = None
    task_id = None
    status_processing = 'PROCESSING'
    status_done = 'DONE'
    status_dropped = 'SKIPPED'
    status_new = 'NEW'
    status_no_data = 'NODATA'

    #TODO: get this from config
#    botmaster_url_template = 'http://ewn2.skytruth.org/nrc/botmaster.php?bot={0}'
    task_conditions = {}

    # Default values - override in subclass
#    batch_size = 10  # number of items to process in one batch
#    job_item_limit = 1000  # maximum total items to process in one job execution

    alert_context = None

    def __init__(self, **kwargs):
        self.db = NrcDatabase()
        self.db.connect()
        self.geodb = GeoDatabase()
        self.geodb.connect()
        dispatcher.connect(self.spider_closed, signal=signals.spider_closed)

        self.job_params = self.get_job_params(kwargs)

    def bot_job_params (self, kwargs):
        # Verify that the job is identified
        if 'job' not in kwargs:
            self.log ('Bot %s envoked without specifying a job'
                      % (self.name,), log.ERROR)
            #TODO what is the graceful way to abort a job?
            assert False

        # Determin the job identity
        # The 'job' command line argument can be either job_id or job_name
        job_id, job_name, job_bot = self.db.getBotJob(kwargs['job'])

        # Verify this job is called with the correct scraper class
        if job_bot != self.name:
            self.log ("Job '%s' called with bot '%s'; should be bot '%s'"
                      %(job_name, self.name, job_bot), log.ERROR)
            assert False

        # get global and job params
        global_params = self.db.getBotJobParams (0)
        global_params = dict (zip ([p['key'] for p in global_params],
                                   [p['value'] for p in global_params]))
        job_params = self.db.getBotParams (job_rec['job_id'])
        job_params = dict (zip ([p['key'] for p in job_params],
                                [p['value'] for p in job_params]))

        # combine params and kwargs
        result = dict(global_params.items()     # lowest precedence
                      + job_params.items()
                      + kwargs.items())         # highest precedence
        # add the job identity to the params
        result['job_id'] = job_rec['job_id']
        result['job_name'] = job_rec['job_name']

        return result

    def start_requests(self):
        #url = self.botmaster_url_template.format(self.name)
        url = self.job_params['botmaster_url_template'].format(self.name)
        return [Request (url, callback=self.parse)]

    # Parse execution params from botmaster
    def parse(self, response):

        hxs = XmlXPathSelector(response)
        name = hxs.select('//name').extract()

        if self.task_id is not None:
            self.log('Processing item %s' % self.task_id, log.INFO)
            self.alert_context = 'task_id=%s' % self.task_id
            for item in self.process_item(self.bot_task_params(self.task_id)):
                yield item
        else:
            for item in self.process_items():
                yield  item

