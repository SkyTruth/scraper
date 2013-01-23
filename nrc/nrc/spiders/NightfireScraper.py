# -*- coding: utf-8 -*-
"""
Created on Sun Dec 16 16:08:24 2012

@author: Craig
"""

# standard modules
import re
from datetime import datetime, timedelta
from string import Template

# site modules
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
from nrc.JobBot import JobBot
from nrc.items import convert_fuzzy_date
from nrc.items import NrcItem, FeedEntry, FeedEntryTag


# CONSTANTS

# Information on data is available at
# www.ngdc.noaa.gov/dmsp/data/viirs_fire/viirs_html/download_viirs_fire.html


class NightfireScraper (JobBot):
    name = 'NightfireScraper'
    allowed_domains = None

    def process_job(self):
        job = self.job_params
        for item in self.process_item(job):
            yield item

    def process_item(self, job):
#        Nightfire_file.task = task
        Nightfire_file.last = None
#        Nightfire_record.task = task
        Nightfire_record.last = None
        url = job['target_url']
        request = Request (url,
                           callback=self.parse_nightfire_dir,
                           dont_filter=True,
                           errback=self.error_callback)
        self.log('retrieving nightfire dir listing %s' % (url), log.INFO)
        request.meta['job'] = job
        yield request

    def error_callback (self, err):
        self.log ('HTTP Nightfire request failed %s'
                  % (err.getErrorMessage()), log.WARNING)

    def parse_nightfire_dir(self, response):
        job = response.meta['job']
        stats = self.crawler.stats
        hxs = HtmlXPathSelector(response)

        filenms = [href.extract().strip()
                   for href in hxs.select('//td//@href')]
        file_count = int(job['file_count'])
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
                url = "/".join([job['target_url'], filenm])
                request = Request (url,
                                   callback=self.parse_nightfire_file,
                                   dont_filter=True,
                                   errback=self.error_callback)
                request.meta['job'] = job
                request.meta['filenm'] = filenm
                request.meta['lastfile'] = item is Nightfire_file.last
                yield request
                count += 1
                if count > file_count:
                    return

    def item_stored(self, item, id):
        if isinstance(item, Nightfire_file):
            pass
        else:  #Nightfire_record
            if item is Nightfire_record.last:
                self.item_completed (self.job_params['job_id'], '')

    def parse_nightfire_file(self, response):
        job = response.meta['job']
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
        if job['record_count']:
            records = records[:int(job['record_count'])]
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
                if field_nm.find('Date') >= 0:
                    value = convert_fuzzy_date(value)
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
    file_num = Field()
    ID = Field()
    Lat_GMTCO = Field()
    Lon_GMTCO = Field()
    CM_IICMO = Field()
    COT_IVCOP = Field()
    EPS_IVCOP = Field()
    QF1_IVCOP = Field()
    QF2_IVCOP = Field()
    QF3_IVCOP = Field()
    Total_Rad = Field()
    BB_Temp = Field()
    M07_Rad = Field()
    M08_Rad = Field()
    M10_Rad = Field()
    M12_Rad = Field()
    M13_Rad = Field()
    M14_Rad = Field()
    M15_Rad = Field()
    M16_Rad = Field()
    SOLZ_GMTCO = Field()
    SOLA_GMTCO = Field()
    SATZ_GMTCO = Field()
    SATA_GMTCO = Field()
    SCVX_GMTCO = Field()
    SCVY_GMTCO = Field()
    SCVZ_GMTCO = Field()
    SCPX_GMTCO = Field()
    SCPY_GMTCO = Field()
    SCPZ_GMTCO = Field()
    SCAX_GMTCO = Field()
    SCAY_GMTCO = Field()
    SCAZ_GMTCO = Field()
    QF1_GMTCO = Field()
    QF2_GMTCO = Field()
    QF1_IICMO = Field()
    QF2_IICMO = Field()
    QF3_IICMO = Field()
    QF4_IICMO = Field()
    QF5_IICMO = Field()
    QF6_IICMO = Field()
    Date_Mscan = Field()
    M10_Center = Field()
    M10_Avg = Field()
    M10_Std = Field()
    M10_Nsigma = Field()
    M10_DN = Field()
    M10_Sample = Field()
    M10_Line = Field()
    M10_File = Field()
    Proc_Date = Field()
    DNB_Sample = Field()
    DNB_Line = Field()
    DNB_Lat = Field()
    DNB_Lon = Field()
    DNB_Rad = Field()
    DNB_Dist = Field()
