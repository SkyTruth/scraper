# -*- coding: utf-8 -*-
"""
Created on Tue Jan 15 11:23:50 2013

@author: Craig
"""

# standard modules
import smtplib
from smtplib import SMTPException, SMTPAuthenticationError
from datetime import datetime

# site modules
from scrapy.spider import BaseSpider
from scrapy import log
from scrapy.http import Request, Response, TextResponse
from scrapy.selector import HtmlXPathSelector, XmlXPathSelector
from scrapy.xlib.pydispatch import dispatcher
from scrapy import signals
from scrapy.contrib.loader import XPathItemLoader, ItemLoader

# local modules
from nrc.database import NrcDatabase
from nrc import settings
from nrc.GeoDatabase import GeoDatabase
from nrc.items import BotTaskError, FeedEntryTag, NrcTag

# CONSTANTS


class JobBot(BaseSpider):
    name = 'JobBot'
    allowed_domains = ['skytruth.org']
#    db = None
#    geodb = None
#    task_id = None
    status_processing = 'PROCESSING'
    status_done = 'DONE'
    status_dropped = 'SKIPPED'
    status_new = 'NEW'
    status_no_data = 'NODATA'

    #TODO: get this from config
#    botmaster_url_template = 'http://ewn2.skytruth.org/nrc/botmaster.php?bot={0}'
#    task_conditions = {}

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
        #print "Job Params:", self.job_params

    def get_job_params (self, kwargs):
        # Verify that the job is identified
        if 'job' not in kwargs:
            self.log ('Bot %s envoked without specifying a job'
                      % (self.name,), log.ERROR)
            #TODO what is the graceful way to abort a job?
            assert False

        # Determin the job identity
        # The 'job' command line argument can be either job_id or job_name
        job_id, job_name, job_bot = self.db.getBotJob(kwargs['job'])
        if job_id is None:
            self.log ("Bot '%s' called with unknown job '%s'"
                      %(self.name, kwargs['job']), log.ERROR)
            assert False
        # Verify this job is called with the correct scraper class
        if job_bot != self.name:
            self.log ("Job '%s' called with bot '%s'; should be bot '%s'"
                      %(job_name, self.name, job_bot), log.ERROR)
            assert False

        # Verify we are not using Bot default params as a job specification
        # Bot default params are structured like a job in the BotJob and
        # BotJobParams tables, but are distinguishd because the job_name is
        # identical with the job_bot.  This is forbidden for actual jobs.
        if job_name == job_bot:
            self.log ("Bot name '%s' used as a job_name"
                      %(self.name,), log.ERROR)
            assert False

        botjob_id, botjob_name, bot_name = self.db.getBotJob(job_bot)
        if botjob_id:
            assert  job_bot == botjob_name == bot_name
            bot_params = self.db.getBotJobParams(botjob_id)
            bot_params = dict (zip ([p['key'] for p in bot_params],
                                    [p['value'] for p in bot_params]))
        else:
            bot_params = {}

        # get global and job params
        global_params = self.db.getBotJobParams ('0')
        global_params = dict (zip ([p['key'] for p in global_params],
                                   [p['value'] for p in global_params]))
        job_params = self.db.getBotJobParams (job_id)
        job_params = dict (zip ([p['key'] for p in job_params],
                                [p['value'] for p in job_params]))

        # combine params and kwargs
        result = dict(global_params.items()     # lowest precedence
                      + bot_params.items()
                      + job_params.items()
                      + kwargs.items())         # highest precedence
        # add the job identity to the params
        result['job_id'] = job_id
        result['job_name'] = job_name

        return result

    def start_requests(self):
        #url = self.botmaster_url_template.format(self.name)
        url = self.job_params['botmaster_url_template'].format(self.name)
        return [Request (url, callback=self.parse)]

    # Parse execution params from botmaster
    def parse(self, response):
        #hxs = XmlXPathSelector(response)
        #name = hxs.select('//name').extract()
        for item in self.process_job():
            yield  item

    # Use this as the errback in a request if you want to log request failures
    def error_callback (self, err):
        self.log ('HTTP request failed %s'  % (err.getErrorMessage()),
                  log.WARNING)

    def spider_closed(self, spider):
#        self.log("\n" + "\n".join ( ["%s = %s" % (k,v) for k,v in
#                 sorted(self.crawler.stats.get_stats(spider=self).items())]),
#                 log.INFO)
        pass


    ########
    ### Common job operations

    # This is a simple secondary job version of process_job.
    # It works for many secondary jobs but is often overridden.
    # See CogisScraper for a simple primary job version
    # See FracFocusScraper for a more complicated primary job verions.
    def process_job(self):
        job = self.job_params
        task_ids = job.get('task_ids')
        job_conditions = job['job_conditions']
        for item in self.process_job_items(job_conditions, task_ids):
            yield item

    # iterate over records that have not yet been processed
    def process_job_items (self, job_conditions, task_ids):
        items_processed = 0
        job_item_limit = int(self.job_params['job_item_limit'])
        c = self.db.getBotTaskCount (self.name, self.status_processing)
        c = c[0]['count']
        if (c  > 0):
            self.send_alert (
                    'ERROR: %s tasks found for bot = %s with status = %s'
                    % (c, self.name, self.status_processing))

        tasks = []

        # XXX I don't understand this line
        # (later) I think this picks up all FracFocus state tasks
        # if no specific task (ie state) is named.  FracFocus is handled
        # differently now because every invocation requires a job
        # specification and the job determines what states are processed.
        #
        # tasks.extend(self.db.getBotTasks (self.name))

        if task_ids:
            # task_ids is a comma separated list of BotTaskStatus key values
            # (ie task_id values).  This allows one or more specific tasks
            # to be named on the command line as '-atask_ids=#####,#####,#####'
            for task_id in [t.strip() for t in task_ids.split(',')]:
                tasks.append({'task_id':task_id})
        elif job_conditions:
            match_conditions = self.prep_match_conditions(job_conditions)
            task_matches = self.db.getBotTaskBatch(self.job_params['job_name'],
                                                   job_item_limit,
                                                   self.status_processing,
                                                   match_conditions)
            tasks.extend(task_matches)

        if len(tasks) == 0:
            self.log('Found no more tasks available.  Terminating job.',
                     log.INFO)
            return
        else:
            self.log('processsing a batch of %s items' % len(tasks), log.INFO)

        for task in tasks[:job_item_limit]:
            task_id = task['task_id']
            self.alert_context = "task_id=%s" % task_id

            self.log('processing item %s' % task_id, log.INFO)

            # process the task and yield the resulting items
            items = self.process_job_item(task_id)
            for item in items:
                yield item

            items_processed += 1

        self.log('Terminating after processing %s items' % (items_processed),
                 log.INFO)

    def update_job_param (self, key, value):
        job_id = self.job_params['job_id']
        self.db.updateBotJobParam (job_id, key, value)

    def prep_match_conditions(self, job_conditions):
        conditions = [p.strip() for p in job_conditions.split(',')]
        match_conditions = {}
        for condition in conditions:
            job_name, status = [x.strip() for x in condition.split(':')]
            match_conditions[job_name] = status
        return match_conditions

    # does nothing - override in subclass
    def item_stored(self, item, id):
        pass

    def item_new (self, task_id):
        self.db.setBotTaskStatus(task_id,
                                 self.job_params['job_name'],
                                 self.status_new)

    def item_completed (self, task_id):
        self.db.setBotTaskStatus(task_id,
                                 self.job_params['job_name'],
                                 self.status_done)

    def item_dropped (self, task_id):
        self.db.setBotTaskStatus(task_id,
                                 self.job_params['job_name'],
                                 self.status_dropped)

    def item_processing (self, task_id):
        self.db.setBotTaskStatus(task_id,
                                 self.job_params['job_name'],
                                 self.status_processing)

    def item_nodata(self, task_id):
        self.db.setBotTaskStatus(task_id,
                                 self.job_params['job_name'],
                                 self.status_no_data)


    # used for NRC reports only
    def make_tag (self, task_id, tag, comment=None):
        t = ItemLoader (NrcTag())
        t.add_value ('reportnum', task_id)
        t.add_value ('tag', tag)
        t.add_value ('comment', comment)
        return t.load_item()

    # used for FeedEntry Tags
    def create_tag (self, feed_entry_id, tag, comment = ''):
        l = ItemLoader (FeedEntryTag())
        l.add_value ('feed_entry_id', feed_entry_id)
        l.add_value ('tag', tag)
        l.add_value ('comment', comment)
        return l.load_item()

    def send_email (self, from_address, to_address, mime_msg):
        try:
            server = smtplib.SMTP('%s:%s' % (settings.MAIL_HOST,
                                             settings.MAIL_PORT))
            server.starttls()
            server.login(settings.MAIL_USER,settings.MAIL_PASS)
            server.sendmail(from_address, to_address, mime_msg.as_string())
            server.quit()
        except SMTPException as e:
            self.log ('Eror sending email to %s: %s'  % (to_address, e),
                      log.ERROR)

    def send_alert (self, message, context=None):
        subject = 'Bot Alert: %s' % self.name
        if not context:
            context = self.alert_context
        if context:
            message = "%s\nCONTEXT: %s" % (message, context)
        self.log ('Sending alert: %s -- %s'  % (subject, message), log.WARNING)

        senddate = datetime.strftime(datetime.now(), '%Y-%m-%d')

        header = ("Date: %s\r\nFrom: %s\r\nTo: %s\r\nSubject: %s\r\n\r\n"
                  % (senddate, settings.MAIL_FROM, settings.MAIL_TO, subject))

        server = smtplib.SMTP('%s:%s'
                              % (settings.MAIL_HOST, settings.MAIL_PORT))
        server.starttls()
        try:
            server.login(settings.MAIL_USER,settings.MAIL_PASS)
            server.sendmail(settings.MAIL_FROM,
                            settings.MAIL_TO,
                            header+message)
        except SMTPException as e:
            self.log ('AuthenticationError sending email from %s: %s'
                      % (settings.MAIL_FROM, e), log.ERROR)
        server.quit()

    def make_bot_task_error (self, task_id, code, message=''):
        t = ItemLoader (BotTaskError())
        t.add_value ('task_id', task_id)
        t.add_value ('bot', self.name)
        t.add_value ('code', code)
        t.add_value ('message', message)
        return t.load_item()

