# -*- coding: utf-8 -*-
"""
Created on Sun Dec 16 16:08:24 2012

@author: Craig
"""

# standard modules
import re
from datetime import datetime, timedelta
import xlrd
import uuid
from string import Template
from xml.sax.saxutils import escape
from urlparse import urlsplit, urljoin
from random import shuffle

# site modules
from scrapy.spider import BaseSpider
from scrapy.contrib.loader import ItemLoader, XPathItemLoader
from scrapy.contrib.loader.processor import TakeFirst, MapCompose, Join
from scrapy.contrib.loader.processor import Identity, Compose
from scrapy.http import Request, Response, TextResponse, FormRequest
from scrapy.shell import inspect_response
from scrapy import log
from scrapy.selector import HtmlXPathSelector
from scrapy.item import Field

# local modules
from nrc.items import FeedEntry, FeedEntryTag
from nrc.items import convert_fuzzy_date
from nrc.database import NrcDatabase
from nrc.NrcBot import NrcBot
from nrc.ExcelScraper import ExcelScraper
from nrc.items import convert_fuzzy_date
from nrc.items import NrcItem, FeedEntry, FeedEntryTag


# CONSTANTS

# Information on data is available at
# www.ngdc.noaa.gov/dmsp/data/viirs_fire/viirs_html/download_viirs_fire.html


class NightfireScraper (NrcBot):
    name = 'NightfireScraper'
    allowed_domains = None

    def process_item(self, task):
        Nightfire_file.task = task
        Nightfire_file.last = None
        Nightfire_record.task = task
        Nightfire_record.last = None
        url = task['target_url']
        request = Request (url,
                           callback=self.parse_nightfire_dir,
                           dont_filter=True,
                           errback=self.error_callback)
        self.log('retrieving nightfire dir listing %s' % (url), log.INFO)
        request.meta['task'] = task
        yield request

    def error_callback (self, err):
        self.log ('HTTP Nightfire request failed %s'
                  % (err.getErrorMessage()), log.WARNING)

    def parse_nightfire_dir(self, response):
        task = response.meta['task']
        stats = self.crawler.stats
        hxs = HtmlXPathSelector(response)

        filenms = [href.extract().strip()
                   for href in hxs.select('//td//@href')]
        file_count = int(task['file_count'])
        count = 0
        for filenm in filenms:
            if len(filenm) < 5 or filenm[-4:] != ".csv": continue
            item = Nightfire_file()
            item['filename'] = filenm
            existing_item = self.db.loadItem(item,
                                            {'filename':item['filename']})
            if existing_item:
                print "processed file", filenm
                stats.inc_value('_existing_nightfile_file_count', spider=self)
            else:
                print "new file", filenm
                stats.inc_value('_new_nightfile_file_count', spider=self)
                if count == file_count or filenm is filenms[-1]:
                    Nightfire_file.last = item
                yield item
                url = "/".join([task['target_url'], filenm])
                request = Request (url,
                                   callback=self.parse_nightfire_file,
                                   dont_filter=True,
                                   errback=self.error_callback)
                request.meta['task'] = task
                request.meta['filenm'] = filenm
                request.meta['lastfile'] = item is Nightfire_file.last
                yield request
                count += 1
                if count > file_count:
                    return

    def item_stored(self, item, id):
        if isinstance(item, Nightfire_file):
            pass
        else:
            #Nightfire_record
            if item is Nightfire_record.last:
                self.item_completed_new (item.task['task_id'], '')


    def parse_nightfire_file(self, response):
        task = response.meta['task']
        filenm = response.meta['filenm']
        file_num = self.lookup_filenum(filenm)
        if file_num is None:
            self.log("Nightfire file record '%' not available for contents."
                     %(filenm,), log.ERROR)
            return

        hxs = HtmlXPathSelector(response)
        data=hxs.select('//body//text()').extract()[0]
        header = None
        records = data.split('\n')
        if task['record_count']:
            records = records[:int(task['record_count'])]
        for record in records:
            record = record.strip()
            if header is None:
                header = record.split(',')
                continue
            values = record.split(',')
            # put values and headers together into Nightfire_record item
            item = Nightfire_record()
            item['file_num'] = file_num
            for field_nm, value in zip(header, values):
                if field_nm not in Nightfire_record.fields:
                    continue
                if 'parser' in Nightfire_record.fields[field_nm]:
                    try:
                        value = Nightfire_record.fields[field_nm]['parser'](value)
                    except Exception, e:
                        e.args += (field_nm,)
                        raise e
                item[field_nm] = value
            if response.meta['lastfile'] and record is records[-1]:
                Nightfire_record.last = item
            yield item

    def lookup_filenum(self, filenm):
        item = Nightfire_file()
        file_rec = self.db.loadItem(item, {'filename':filenm})
        try:
            return file_rec['id']
        except KeyError:
            return None

class Nightfire_file(NrcItem):
    insert_mode = 'replace'
    id = Field()
    filename = Field()

class Nightfire_record(NrcItem):
    insert_mode = 'replace'
    file_num = Field(parser=int)
    ID = Field(parser=int)
    Lat_GMTCO = Field(parser=float)
    Lon_GMTCO = Field(parser=float)
    CM_IICMO = Field(parser=int)
    COT_IVCOP = Field(parser=float)
    EPS_IVCOP = Field(parser=float)
    QF1_IVCOP = Field(parser=int)
    QF2_IVCOP = Field(parser=int)
    QF3_IVCOP = Field(parser=int)
    Total_Rad = Field(parser=float)
    BB_Temp = Field(parser=int)
    M07_Rad = Field(parser=float)
    M08_Rad = Field(parser=float)
    M10_Rad = Field(parser=float)
    M12_Rad = Field(parser=float)
    M13_Rad = Field(parser=float)
    M14_Rad = Field(parser=float)
    M15_Rad = Field(parser=float)
    M16_Rad = Field(parser=float)
    SOLZ_GMTCO = Field(parser=float)
    SOLA_GMTCO = Field(parser=float)
    SATZ_GMTCO = Field(parser=float)
    SATA_GMTCO = Field(parser=float)
    SCVX_GMTCO = Field(parser=float)
    SCVY_GMTCO = Field(parser=float)
    SCVZ_GMTCO = Field(parser=float)
    SCPX_GMTCO = Field(parser=float)
    SCPY_GMTCO = Field(parser=float)
    SCPZ_GMTCO = Field(parser=float)
    SCAX_GMTCO = Field(parser=float)
    SCAY_GMTCO = Field(parser=float)
    SCAZ_GMTCO = Field(parser=float)
    QF1_GMTCO = Field(parser=int)
    QF2_GMTCO = Field(parser=int)
    QF1_IICMO = Field(parser=int)
    QF2_IICMO = Field(parser=int)
    QF3_IICMO = Field(parser=int)
    QF4_IICMO = Field(parser=int)
    QF5_IICMO = Field(parser=int)
    QF6_IICMO = Field(parser=int)
    Date_Mscan = Field(parser=convert_fuzzy_date)
    M10_Center = Field(parser=int)
    M10_Avg = Field(parser=float)
    M10_Std = Field(parser=float)
    M10_Nsigma = Field(parser=int)
    M10_DN = Field(parser=int)
    M10_Sample = Field(parser=int)
    M10_Line = Field(parser=int)
    M10_File = Field()
    Proc_Date = Field(parser=convert_fuzzy_date)
    DNB_Sample = Field(parser=float)
    DNB_Line = Field(parser=float)
    DNB_Lat = Field(parser=float)
    DNB_Lon = Field(parser=float)
    DNB_Rad = Field(parser=float)
    DNB_Dist = Field(parser=float)
