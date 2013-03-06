# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: http://doc.scrapy.org/topics/item-pipeline.html

import json

import MySQLdb

from scrapy import log
from scrapy import exceptions

from nrc import settings
from items import FusionTableItem, FeedEntry, FeedEntryTag


class NrcDatabasePipeline(object):
    def __init__(self):
         pass

    def process_item(self, item, spider):
        if isinstance (item, FusionTableItem):
            spider.ft.storeItem (item)
        else:
            if isinstance (item, FeedEntry) or isinstance(item, FeedEntryTag):
                spider.geodb.storeItem (item)
            id = spider.db.storeItem (item)
            spider.log("pipeline id=%s for item %s" % (id, item), log.INFO) 
            if id:
                spider.item_stored (item, id)
        
        spider.log ('Stored Item: %s' % item, log.INFO) 
               
        return item
