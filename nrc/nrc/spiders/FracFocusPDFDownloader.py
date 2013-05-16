# -*- coding: utf-8 -*-
#FracFocus PDF Downloader

import pprint
from datetime import datetime, date, timedelta
from urlparse import urlsplit, urljoin
from urlparse import parse_qs
from cStringIO import StringIO
from itertools import izip_longest
import re

from scrapy.spider import BaseSpider
from scrapy.selector import HtmlXPathSelector
from scrapy.http import FormRequest
from scrapy.http import Request, Response, TextResponse
from scrapy.shell import inspect_response
from scrapy import log
from scrapy.contrib.loader import XPathItemLoader, ItemLoader
from scrapy.contrib.loader.processor import TakeFirst, MapCompose, Join


#from scrapy.xlib.ClientForm import ParseFile
from BeautifulSoup import BeautifulSoup
#from scrapy.stats import stats

import psycopg2
psycopg2.extensions.register_type(psycopg2.extensions.UNICODE)
psycopg2.extensions.register_type(psycopg2.extensions.UNICODEARRAY)

from nrc.NrcBot import NrcBot
from nrc.items import FracFocusScrape, FracFocusPDF
from nrc.database import NrcDatabase
from nrc.spiders.FracFocusScraper import FracFocusScraper


class FracFocusPDFDownloader(FracFocusScraper):
    name = "FracFocusPDFDownloader"
    task_conditions = {'FracFocusReport':'NEW'}
#    download_url = 'http://www.hydraulicfracturingdisclosure.org/fracfocusfind/Download.aspx'
    download_url = 'http://www.fracfocusdata.org/fracfocusfind/Download.aspx'
    job_item_limit = 1000
    max_download_attempts = 3

    def process_item (self, task_id):
        scrape = self.db.loadFracFocusScrape(task_id)

        if scrape['pdf_download_attempts'] >= self.max_download_attempts:
            self.log('Task_id %s max download attempts (%s) exceeded for %s %s' % (task_id, self.max_download_attempts, scrape['api'], scrape['job_date']), log.WARNING)
            self.item_dropped(task_id)
        else:
            request = Request(self.base_url, callback=self.search_by_api, dont_filter=True, errback=self.error_callback)
            request.meta['scrape'] = scrape
            request.meta['cookiejar'] = "%s:%s" % (scrape['api'], scrape['job_date'])
            request.meta['task_id'] = task_id
            self.log('Task_id %s Downloading PDF for API %s %s' % (task_id, scrape['api'], scrape['job_date']), log.INFO)
            yield request
        self.db.increment_FFS_PDF_Download_Attempts (task_id)

    def search_by_api (self, response):
        #TODO: Merge this with search_by_state in the parent class

        #get Google recaptcha here

        scrape = response.meta['scrape']
        request = FormRequest.from_response(response,
            formdata={
                'ctl00$MainContent$ScriptManager1':'ctl00$MainContent$DocumentFilter1$UpdatePanel1|ctl00$MainContent$DocumentFilter1$btnSearch',
                'ctl00$MainContent$DocumentFilter1$tbAPINo':scrape['api'],
                'ctl00$MainContent$DocumentFilter1$btnSearch' : 'SEARCH',
                '__ASYNCPOST': 'true',
                'ctl00$MainContent$NoBot1$NoBot1_NoBotExtender_ClientState': self.extract_NoBot_ClientState (response)
            },
            dont_click=True,
            callback=self.request_pdf_download,
            errback=self.error_callback)
        request.meta['scrape'] = scrape
        request.meta['cookiejar'] = response.meta['cookiejar']
        request.meta['task_id'] = response.meta['task_id']
        request.meta['full_response'] = response
        self.log('Task_id %s Search by API: %s' % (request.meta['task_id'], scrape['api']), log.DEBUG)

#        self._print_form_request(request)
        yield request


    def request_pdf_download (self, response):
#        print response.body
        meta = response.meta
        response_parts = self.response2dict (response)

#        self._print_response_parts(response_parts)

        response = self.update_response(response.meta['full_response'], response_parts)

        pdf_index = self.find_pdf_index (response)

        if pdf_index is not None:
            stats = self.crawler.stats
            formdata = {
                'ctl00$MainContent$ScriptManager1':'ctl00$MainContent$UpdatePanel2|ctl00$MainContent$DocumentList1$GridView1',
                '__EVENTTARGET':'ctl00$MainContent$DocumentList1$GridView1',
                '__EVENTARGUMENT':'OpenFile$%s' %pdf_index,
                'ctl00$MainContent$NoBot1$NoBot1_NoBotExtender_ClientState': self.extract_NoBot_ClientState (response)
            }
            request = self.create_request(response,response_parts, formdata, self.download_pdf)
            request.meta['cookiejar'] = meta['cookiejar']
            request.meta['scrape'] = response.meta['scrape']
            request.meta['task_id'] = response.meta['task_id']
            self.log('Task_id %s Requesting download PDF index: %s' % (request.meta['task_id'], pdf_index), log.DEBUG)
            stats.inc_value ('_pdf_download_request', spider=self)
#            self._print_form_request(request)
            yield request
        else:
            stats.inc_value ('_pdf_not_found', spider=self)
            self.log('Task_id %s Did not find record in response for API: %(api)s JobDate: %(job_date)s '% (request.meta['task_id'], meta['scrape']), log.WARNING)
            yield


    def download_pdf (self, response):
#        print response.body
        params = response.meta['scrape']
        params['task_id'] = response.meta['task_id']

        request = Request(self.download_url, callback=self.store_pdf, dont_filter=True, errback=self.error_callback)
        request.meta['cookiejar'] = response.meta['cookiejar']
        request.meta['scrape'] = response.meta['scrape']
        request.meta['task_id'] = response.meta['task_id']

        self.log('Task_id %(task_id)s Starting PDF download for API: %(api)s JobDate: %(job_date)s ' % (params), log.DEBUG)
        self.crawler.stats.inc_value ('_pdf_download', spider=self)
        yield request
        pass

    def store_pdf (self, response):
        # print response.body
#        with open('result.pdf','w') as f:
#            f.write(response.body)
        stats = self.crawler.stats
        params = response.meta['scrape']
        params['Content-Type'] = response.headers.get('Content-Type','')
        params['Content-Disposition'] = response.headers.get('Content-Disposition','')
        params['task_id'] = response.meta['task_id']

        if 'application/pdf' != params['Content-Type'][:15]:
            self.log('Task_id %(task_id)s Unexpected content type.  Expected "application/pdf", got "%(Content-Type)s" for PDF download API: %(api)s JobDate: %(job_date)s '% (params), log.WARNING)
            stats.inc_value ('_pdf_store_fail', spider=self)
            self.item_dropped(response.meta['task_id'])
        elif 'attachment; filename=' != params['Content-Disposition'][:21]:
            self.log('Task_id %(task_id)s Unexpected content disposition header.  Expected "attachment; filename=*", got "%(Content-Disposition)s" for PDF download API: %(api)s JobDate: %(job_date)s '% (params), log.WARNING)
            stats.inc_value ('_pdf_store_fail', spider=self)
            self.item_dropped(response.meta['task_id'])
        else:
            l = ItemLoader(FracFocusPDF())
            l.add_value ('seqid', response.meta['scrape']['seqid'])
            l.add_value ('pdf', psycopg2.Binary(response.body))
            l.add_value ('filename', params['Content-Disposition'][21:])
            item = l.load_item()
            self.log('Task_id %(task_id)s Storing PDF download for API: %(api)s JobDate: %(job_date)s '% (params), log.INFO)
            stats.inc_value ('_pdf_store', spider=self)
            yield item
            self.item_completed(response.meta['task_id'])



    def find_pdf_index (self, response):
        scrape = response.meta['scrape']
        job_date = str(scrape['job_date'])[:10]
        hxs = HtmlXPathSelector(response)
        reports = hxs.select ('//table[@id="MainContent_DocumentList1_GridView1"]//tr')

        pdf_index = 0
        for report in reports:
#            print '********'
#            print report.select('td')
            l = XPathItemLoader(FracFocusScrape(), report)
            for name, params in FracFocusScrape.fields.items():
                l.add_xpath(name, params['xpath'])
            item = l.load_item()
#            print scrape
#            print item
            if item.get('api'):
                if job_date == item.get('job_date','')[:10] and scrape['api'] == item.get('api'):
                    return pdf_index
                pdf_index += 1

        return None



    def item_stored(self, item, id):
        pass
