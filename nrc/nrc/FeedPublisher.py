# FeedPublisher Base Class

import re
from datetime import datetime, timedelta
import json

from scrapy.spider import BaseSpider
from scrapy.contrib.loader import ItemLoader
from scrapy.http import Request, Response, TextResponse
from scrapy.contrib.loader.processor import TakeFirst, MapCompose, Join
from scrapy.shell import inspect_response
from scrapy import log

from nrc.database import NrcDatabase
from nrc.JobBot import JobBot


class FeedPublisher (JobBot):
    name = 'FeedPublisher'

    # get feeds that need to be published

    def process_job(self):
        feed_params = self.job_params
        for item in self.process_item(feed_params):
            yield item

    def process_item(self, feed_params):
        self.http_user = feed_params.get('http_user')
        self.http_pass = feed_params.get('http_password')


        url = "%s&after=%s&sort=asc" % (feed_params['feed_url'], feed_params['last_item_updated'])
        request = Request (url, callback=self.parse_feed)
        self.log('Requesting feed from url %s' % (url), log.INFO)
        request.meta['feed'] = feed_params
        yield request


    def parse_feed (self, response):
        # Get recent feed items not yet published and send them to process_item_feed


        feed_params = response.meta['feed']
        feed_items = json.loads(response.body)['feed']

        self.log('Processing %s items in json feed' % len(feed_items), log.INFO)

        last_item_updated = feed_params['last_item_updated'] or datetime.now() - timedelta(days=3) # 3 days ago

        for item in feed_items:
            if self.db.isFeedItemPublished (feed_params['job_id'], item['id']):
                self.log('Skipping feed item %s - already published' % (item['id']), log.INFO)
            else:
                for request in self.process_feed_item(item, feed_params):
                    yield request

                self.log('Marking feed item %s as published' % (item['id']), log.INFO)
                self.db.setFeedItemPublished (feed_params['job_id'], item['id'])
                item_updated = item['published']
                last_item_updated = max (last_item_updated, item_updated)

        self.db.updateBotJobParam (feed_params['job_id'], 'last_item_updated', last_item_updated)
        self.item_completed (feed_params['job_id'])

    # Does nothing.  Override in subclass
    def process_feed_item (self, item, feed_params):
        yield



