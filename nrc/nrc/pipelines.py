# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: http://doc.scrapy.org/topics/item-pipeline.html

import json


from scrapy import log
from scrapy import exceptions

from nrc import settings
from items import FusionTableItem, FeedEntry, FeedEntryTag
from nrc.extensions.failLogger import FailLogger


class NrcDatabasePipeline(object):
    def __init__(self):
         pass

    def process_item(self, item, spider):
        try:
            if isinstance (item, FusionTableItem):
                spider.ft.storeItem (item)
            else:
                if isinstance (item, FeedEntry) or isinstance(item, FeedEntryTag):
                    spider.geodb.storeItem (item)
                    id = None
                else:
                    id = spider.db.storeItem (item)
                if id:
                    spider.item_stored (item, id)
                spider.log("pipeline id=%s for item %s" % (id, item), log.INFO) 
        
        except Exception as e:
            FailLogger.report_exception(spider, 
                                        e,
                                        "Error in NrcDatabasePipeline")
            raise
        spider.log ('Stored Item: %s' % item, log.INFO) 
               
        return item
