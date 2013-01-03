#NRC Bot

import re
import smtplib
from smtplib import SMTPException
from datetime import datetime

from scrapy.spider import BaseSpider
from scrapy.selector import HtmlXPathSelector, XmlXPathSelector
from scrapy.http import Request, Response, TextResponse
from scrapy.contrib.loader import XPathItemLoader, ItemLoader
from scrapy.contrib.loader.processor import TakeFirst, MapCompose, Join
from scrapy.shell import inspect_response
from scrapy import log
#from scrapy.stats import stats
from scrapy.xlib.pydispatch import dispatcher
from scrapy import signals

from nrc.items import NrcParsedReport, NrcTag, BotTaskError
from nrc.database import NrcDatabase
from nrc import settings
from nrc.GeoDatabase import GeoDatabase


class NrcBot(BaseSpider):
    name = 'NrcBot'
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
    botmaster_url_template = 'http://ewn2.skytruth.org/nrc/botmaster.php?bot={0}'
    task_conditions = {}

    # Default values - override in subclass
#    batch_size = 10  # number of items to process in one batch
    job_item_limit = 1000  # maximum total items to process in one job execution

    alert_context = None

    def __init__(self, **kwargs):
        self.db = NrcDatabase()
        self.db.connect()
        self.geodb = GeoDatabase()
        self.geodb.connect()
        dispatcher.connect(self.spider_closed, signal=signals.spider_closed)
        if 'task_id' in kwargs:
            self.task_id = kwargs['task_id']
        self.task_params = kwargs            


    def start_requests(self):
        url = self.botmaster_url_template.format(self.name)
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


    # iterate over records that have not yet been processed
    def process_items (self):
        items_processed = 0
        c = self.db.getBotTaskCount (self.name, self.status_processing)
        c = c[0]['count']
        if (c  > 0):
            self.send_alert ('ERROR: %s tasks found for bot = %s with status = %s' % (c, self.name, self.status_processing))

        tasks = []
        tasks.extend(self.db.getBotTasks (self.name))

        if self.task_conditions:
            tasks.extend(self.db.getBotTaskBatch(self.name, self.job_item_limit, self.status_processing, self.task_conditions))
        if len(tasks) == 0:
            self.log('Found no more tasks available.  Terminating job.', log.INFO)
            return
        else:
            self.log('processsing a batch of %s items' % len(tasks), log.INFO)

        for task in tasks[:self.job_item_limit]:
            task_id = task['task_id']

            self.log('processing item %s' % task_id, log.INFO)

            self.alert_context = "task_id=%s" % task_id


            # actually process the report
            items = self.process_item(self.bot_task_params(task_id))
            for item in items:
                yield item

            items_processed += 1

        self.log('Terminating after processing %s items' % (items_processed), log.INFO)

    def bot_task_params (self, task_id):
        params = self.db.getBotTaskParams (self.name, task_id)
        if (params):
            params = dict (zip ([p['key'] for p in params],[p['value'] for p in params]))
            params ['task_id'] = task_id
            params.update (self.task_params)
            return params
        else:
            return task_id

    def update_task_param (self, task_id, key, value):
        self.db.updateBotTaskParam (self.name, task_id, key, value)


    # override this in the subclass.  Remember to call self.item_completed() when you are done to
    # mark the item as completed in the db
    def process_item(self, task_id):
        self.item_completed (task_id)
        pass

    # does nothing - override in subclass
    def item_stored(self, item, id):
        pass


    def set_item_status (self, task_id, status):
        self.db.setBotTaskStatus(task_id, self.name, status)

    def item_new (self, task_id):
        self.db.setBotTaskStatus(task_id, self.name, self.status_new)

    def item_completed (self, task_id):
        self.db.setBotTaskStatus(task_id, self.name, self.status_done)

    def item_dropped (self, task_id):
        self.db.setBotTaskStatus(task_id, self.name, self.status_dropped)

    def item_processing (self, task_id):
        self.db.setBotTaskStatus(task_id, self.name, self.status_processing)

    def send_email (self, from_address, to_address, mime_msg):
        try:
            server = smtplib.SMTP('%s:%s' % (settings.MAIL_HOST, settings.MAIL_PORT))
            server.starttls()
            server.login(settings.MAIL_USER,settings.MAIL_PASS)
            server.sendmail(from_address, to_address, mime_msg.as_string())
            server.quit()
        except SMTPException as e:
            self.log ('Eror sending email to %s: %s'  % (to_address, e), log.ERROR)

    def send_alert (self, message, context=None):
        subject = 'Bot Alert: %s' % self.name
        if not context:
            context = self.alert_context
        if context:
            message = "%s\nCONTEXT: %s" % (message, context)
        self.log ('Sending alert: %s -- %s'  % (subject, message), log.WARNING)

        senddate=datetime.strftime(datetime.now(), '%Y-%m-%d')

        header="Date: %s\r\nFrom: %s\r\nTo: %s\r\nSubject: %s\r\n\r\n" % (senddate, settings.MAIL_FROM, settings.MAIL_TO, subject)

        server = smtplib.SMTP('%s:%s' % (settings.MAIL_HOST, settings.MAIL_PORT))
        server.starttls()
        server.login(settings.MAIL_USER,settings.MAIL_PASS)
        server.sendmail(settings.MAIL_FROM, settings.MAIL_TO, header+message)
        server.quit()

    def make_tag (self, task_id, tag, comment=None):
        t = ItemLoader (NrcTag())
        t.add_value ('reportnum', task_id)
        t.add_value ('tag', tag)
        t.add_value ('comment', comment)
        return t.load_item()

    def make_bot_task_error (self, task_id, code, message=''):
        t = ItemLoader (BotTaskError())
        t.add_value ('task_id', task_id)
        t.add_value ('bot', self.name)
        t.add_value ('code', code)
        t.add_value ('message', message)
        return t.load_item()


    # Use this as the errback in a request if you want to log request failures
    def error_callback (self, err):
        self.log ('HTTP request failed %s'  % (err.getErrorMessage()), log.WARNING)

    def spider_closed(self, spider):
#        self.log("\n" + "\n".join ( ["%s = %s" % (k,v) for k,v in sorted(self.crawler.stats.get_stats(spider=self).items())] ), log.INFO)
        pass


