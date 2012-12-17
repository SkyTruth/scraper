#GIS Test Spider

import re
from xlrd import open_workbook

from scrapy.spider import BaseSpider
from scrapy.selector import HtmlXPathSelector, XmlXPathSelector
from scrapy.http import Request, Response, TextResponse
from scrapy.contrib.loader import XPathItemLoader, ItemLoader
from scrapy.contrib.loader.processor import TakeFirst, MapCompose, Join
from scrapy.shell import inspect_response
from scrapy import log

from nrc.items import NrcAnalysis
from nrc.database import NrcDatabase
from nrc.GeoDatabase import GeoDatabase
from nrc.NrcBot import NrcBot


class GISTest(NrcBot):
    name = 'GISTest'
    allowed_domains = ['skytruth.org']
    task_conditions = {'NrcGeocoder':'DONE'}

    def __init__(self, **kwargs):
        self.geodb = GeoDatabase()
        self.geodb.connect()
        NrcBot.__init__(self)

    def process_items(self):
        yield
        return
        print self.geodb.test ();

       # TODO: fetch excel from remote site, open from string?

        wb = open_workbook('/Users/paulwoods/Skytruth/scraper/Excel Parse Test/Permits Issued by Operator 2011.xls')
        sheet = wb.sheets()[0]
        keys = sheet.row_values (0)
        values = sheet.row_values (1)
        print dict(zip (keys,values))

        # TODO: Iterate over rows, populate item, and yield

        # TODO: identify already existing records and skip? update?

        # TODO: store item in DB

        # TODO: another bot runs and associates permits with watersheds

        # TODO: another bot runs and adds new permits to feed

        yield

    def process_item(self, task_id):
        yield
        return
        print self.geodb.test ();
        yield
        pass