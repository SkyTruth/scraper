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
from nrc.NrcBot import NrcBot


class FeedPublisher (NrcBot):
    name = 'FeedPublisher'
    
    # get feeds that need to be published
    
    
    def process_item(self, feed):
        url = "%s&after=%s&sort=asc" % (feed['feed_url'], feed['last_item_updated'])
        request = Request (url, callback=self.parse_feed)
        self.log('Requesting feed from url %s' % (url), log.INFO)
        request.meta['feed'] = feed
        yield request
        

    def parse_feed (self, response):
        # Get recent feed items not yet published and send them to process_item_feed

        
        feed_params = response.meta['feed']
        feed_items = json.loads(response.body)['feed']

        self.log('Processing %s items in json feed' % len(feed_items), log.INFO)

        last_item_updated = feed_params['last_item_updated'] or datetime.now() - timedelta(days=3) # 3 days ago

        for item in feed_items:
            if self.db.isFeedItemPublished (feed_params['task_id'], item['id']):
                self.log('Skipping feed item %s - already published' % (item['id']), log.INFO)
            else:
                for request in self.process_feed_item(item, feed_params):
                    yield request

                self.log('Marking feed item %s as published' % (item['id']), log.INFO)
                if self.__class__.__name__ != "UshahidiPublisherTest":
                    self.db.setFeedItemPublished (feed_params['task_id'],
                                                  item['id'])
                item_updated = item['published']
                last_item_updated = max (last_item_updated, item_updated)
              
        if self.__class__.__name__ != "UshahidiPublisherTest":
            self.db.updateBotTaskParam (self.name, 
                                        feed_params['task_id'],
                                        'last_item_updated',
                                        last_item_updated)
        self.item_completed (feed_params['task_id'])

    # Does nothing.  Override in subclass
    def process_feed_item (self, item, feed_params):
        yield 
            
            
 
