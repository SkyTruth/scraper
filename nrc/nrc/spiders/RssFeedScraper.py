# RSS Feed Scraper

import re
from datetime import datetime, timedelta
import feedparser
import pickle
import uuid

from scrapy.spider import BaseSpider
from scrapy.contrib.loader import ItemLoader
from scrapy.contrib.loader.processor import TakeFirst, MapCompose, Join
from scrapy.shell import inspect_response
from scrapy import log

from nrc.items import FeedEntry, FeedEntryTag, RssFeedItem, format_datetime
from nrc.database import NrcDatabase
from nrc.NrcBot import NrcBot


class RssFeedScaper (NrcBot):
    name = 'RssFeedScraper'

    def process_items (self):
        # Get list of feeds
        feeds = self.db.getRssFeeds()
        for feed in feeds:
            # Check last_read against update interval
            self.log('Checking rss feed id: %s interval: %s last_read: %s' % (feed['id'], feed['update_interval_secs'], feed['last_read']), log.INFO)
            # call process_item() if it's time to update
            items = self.process_item(feed['id'])
            if items:
                for item in items:
                    yield item
            
            
    def process_item(self, task_id):
        feed = self.db.getRssFeeds(task_id)
        self.log('processsing rss feed %s (%s)' % (feed['id'], feed['url']), log.INFO)
        # parse feed
        feed_data = feedparser.parse( feed['url'] )

        self.log('reading %s feed items' % (len(feed_data['items'])), log.INFO)
        
        # update last read time
        self.db.updateRssFeedLastRead (task_id)

        # For each item in feed
        for item in  feed_data['items']:
            # if this item has not already been processed
            if self.db.rssFeedItemExists(item['id']):
                self.log('%s - feed item already exists - skipping' % (item['id']), log.INFO)
                continue

            # store the full item
            l=ItemLoader (RssFeedItem())
            l.add_value ('item_id', item['id'])
            l.add_value ('content', pickle.dumps(item))
            l.add_value ('feed_id', task_id)
            yield l.load_item()

            feed_entry_id = uuid.uuid5(uuid.NAMESPACE_URL, str(item ['id']))

            l=ItemLoader (FeedEntry())
            l.add_value ('id', feed_entry_id)
            l.add_value ('title', item['title'])
#            l.add_value ('updated', format_datetime(item['updated_parsed']))
            l.add_value ('incident_datetime', format_datetime(item['updated_parsed']))
            if 'content' in item:
                for c in  item['content']:
                    l.add_value ('content', c['value'])
            elif 'summary' in item:
                l.add_value ('content', item['summary'])
            
            embedded_fields = self.extractContentFields (l.get_output_value('content'))

            pt = embedded_fields.get('location') or item.get('georss_point')
#            print "em: '%s'  geo: '%s'" % (embedded_fields.get('location'), item.get('georss_point'))
            if not pt:
                self.log('%s - No georeference found' % (item['id']), log.WARNING)
                continue
                
            pt = re.split ("[, ]+", pt)
            l.add_value ('lat', pt[0])
            l.add_value ('lng', pt[1])
            
            l.add_value ('kml_url', embedded_fields.get('kml') or '')
            
            for link in item['links']:
                if link['rel'] == 'alternate':
                    l.add_value ('link', link['href'])
            l.add_value ('source_id', feed['source_id'])
            yield l.load_item()
            
            if 'tags' in item:
                for t in item['tags']:
                    l=ItemLoader (FeedEntryTag())
                    l.add_value ('feed_entry_id', feed_entry_id)
                    l.add_value ('tag', t['term'])
                    l.add_value ('comment', t['label'])
                    yield l.load_item()

            l=ItemLoader (FeedEntryTag())
            l.add_value ('feed_entry_id', feed_entry_id)
            l.add_value ('tag', feed['tag'])
            yield l.load_item()
            
        # update task status    
        self.item_completed (task_id)
                
    # extract fields from the given content that are in the form
    #  [[KEY: VALUE]]
    # KEY must be alphanumeric only with no whitespace between the "[[" and the ":"
    # VAlUE may be anything except it may not contain a "]"        
    def extractContentFields (self, content):
        result = {}
        for m in re.finditer("\[\[([\w]+):([^\]]*)\]\]",content):
            result[m.group(1).lower()] = m.group(2).strip()
        return result
