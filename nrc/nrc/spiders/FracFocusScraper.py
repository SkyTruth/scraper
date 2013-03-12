# -*- coding: utf-8 -*-
#FracFocus Scraper

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
from scrapy.contrib.loader import XPathItemLoader
from scrapy.contrib.loader.processor import TakeFirst, MapCompose, Join

from BeautifulSoup import BeautifulSoup

from nrc.NrcBot import NrcBot
from nrc.items import FracFocusScrape
from nrc.database import NrcDatabase


#nextpage:
#'ctl00$MainContent$DocumentList1$GridView1$ctl01$ButtonNext': 'Next Page',

#Sort by Job Date:
    #ctl00$MainContent$ScriptManager1:ctl00$MainContent$UpdatePanel2|ctl00$MainContent$DocumentList1$GridView1
    #__EVENTTARGET:ctl00$MainContent$DocumentList1$GridView1
    #__EVENTARGUMENT:Sort$JobDate


class FracFocusScraper(NrcBot):
    name = "FracFocusScraper"
    allowed_domains = None
#    allowed_domains = ["hydraulicfracturingdisclosure.org"]
#    base_url = "http://www.hydraulicfracturingdisclosure.org/fracfocusfind/Default.aspx"
    base_url = "http://www.fracfocusdata.org/fracfocusfind/Default.aspx"
    job_item_limit = 7  # maximum total items to process in one job execution

    get_counties_form_data = {
                'ctl00$MainContent$ScriptManager1': 'ctl00$MainContent$DocumentFilter1$UpdatePanel1|ctl00$MainContent$DocumentFilter1$cboStateList',
                '__EVENTTARGET': 'ctl00$MainContent$DocumentFilter1$cboStateList',
                '__ASYNCPOST': 'true',
                'ctl00$MainContent$DocumentFilter1$tbAPINo' : '__-___-_____',
                '__EVENTARGUMENT': '',
                '__LASTFOCUS': '',
                'ctl00$MainContent$DocumentFilter1$cboCountyList': 'Choose a State First'
            }

    def __init__ (self, **kwargs):
        self.api = kwargs.get('api',None)
        if kwargs.has_key('state'):
            FracFocusScraper.job_item_limit = 1
        NrcBot.__init__(self, **kwargs)

    def process_items (self):
        if self.api:
            request = Request(self.base_url, callback=self.search_by_api, dont_filter=True, errback=self.error_callback)
            request.meta['api'] = self.api
            request.meta['cookiejar'] = 'FracFocusScraper:%s' % self.api
            self.log('** Scraping API %s' % self.api, log.INFO)
            yield request
        else:
            for item in NrcBot.process_items (self):
                yield item

    def process_item (self, task):
        request = Request(self.base_url, callback=self.search_by_state, dont_filter=True, errback=self.error_callback)
        request.meta['state'] = task['state']
        request.meta['cookiejar'] = 'FracFocusScraper:%s' % task['state']
        request.meta['task_id'] = task['task_id']
        self.log('** Scraping State %s' % task['state'], log.INFO)
        yield request
        self.item_completed (task['task_id'])

    def search_by_state (self, response):
        search_params = {
                'ctl00$MainContent$DocumentFilter1$cboStateList': response.meta['state'],
            }

        yield self.create_search_request(response, search_params=search_params, callback=self.sort_by_job_date)

    def search_by_api (self, response):
        search_params = {
                'ctl00$MainContent$DocumentFilter1$tbAPINo':response.meta['api'],
            }

        yield self.create_search_request(response, search_params=search_params, callback=self.scrape_and_next)


    def create_search_request (self, response, search_params, callback):
        formdata={
            'ctl00$MainContent$ScriptManager1': 'ctl00$MainContent$DocumentFilter1$UpdatePanel1|ctl00$MainContent$DocumentFilter1$btnSearch',
            'ctl00$MainContent$DocumentFilter1$btnSearch' : 'SEARCH',
            '__ASYNCPOST': 'true',
            'ctl00$MainContent$NoBot1$NoBot1_NoBotExtender_ClientState': self.extract_NoBot_ClientState (response)
        }
        formdata.update(search_params)
        request = FormRequest.from_response(response,
            formdata=formdata,
            dont_click=True,
            callback=callback,
            errback=self.error_callback)
        request.meta['full_response'] = response
        request.meta['num_pages'] = 2       # not used
        request.meta['cookiejar'] = response.meta['cookiejar']
        self.log('%s Getting intial page' % response.meta['cookiejar'], log.INFO)
#        self._print_form_request(request)
        return request


    def sort_by_job_date(self, response):
        meta = response.meta
        response_parts = self.response2dict (response)
        response = self.update_response(response.meta['full_response'], response_parts)
        formdata = {
            'ctl00$MainContent$ScriptManager1':'ctl00$MainContent$UpdatePanel2|ctl00$MainContent$DocumentList1$GridView1',
            '__EVENTTARGET':'ctl00$MainContent$DocumentList1$GridView1',
            '__EVENTARGUMENT':'Sort$JobDate',
        }
        request = self.create_request(response,response_parts, formdata, self.scrape_and_next)
        request.meta['num_pages'] = meta['num_pages']
        request.meta['cookiejar'] = response.meta['cookiejar']
        self.log('%s Sorting by Job Date' % response.meta['cookiejar'], log.INFO)
        yield request



    def scrape_and_next(self, response):
        response_parts = self.response2dict (response)
        num_pages = response.meta['num_pages']
        response = self.update_response(response.meta['full_response'], response_parts)
        
        # scrape page and goto next
        for item in self.scrape_content_items(response):
            yield item

        # Check to see if there is a next page button present
        if response.body.find ('ctl00$MainContent$DocumentList1$GridView1$ctl01$ButtonNext') >= 0 and num_pages > 1:
            # navigate to next page
            formdata = {
                'ctl00$MainContent$ScriptManager1': 'ctl00$MainContent$UpdatePanel2|ctl00$MainContent$DocumentList1$GridView1$ctl01$ButtonNext',
                'ctl00$MainContent$DocumentList1$GridView1$ctl01$ButtonNext': 'Next Page',
            }
            request  = self.create_request(response,response_parts, formdata, self.scrape_and_next)

#            if num_pages > 1:
#                request.meta['num_pages'] = num_pages - 1
#                yield request

            request.meta['num_pages'] = num_pages
            request.meta['cookiejar'] = response.meta['cookiejar']
            yield request

#        print response_parts['updatePanel.MainContent_UpdatePanel1']


    def response2dict (self, response):
        parsed = {}
        params = izip_longest(*[iter(response.body.split ('|'))]*4, fillvalue=None)
        for p in params:
            if p[3]:
                parsed ['%s|%s'%(p[1].strip(),p[2].strip())] = p[3].strip()
        return parsed

    # integreate new div content from the response into the original page
    def update_response (self, response, response_parts):
        soup = BeautifulSoup(response.body)
#        print response.body
        update_divs = []
        for key,content in response_parts.items():
#            print "_%s_" % key
            action,div_id = key.split('|')
            if 'updatePanel' == action:
                div=soup.find(id=div_id)
                if div:
                    update_divs.append ((div, content))
        for update in update_divs:
            update[0].clear ()
            update[0].append(BeautifulSoup(update[1]))
            
        return response.replace (body=str(soup))

    # create a new form request
    def create_request (self, response, response_parts, formdata, callback):
        fd = formdata
        fd['__VIEWSTATE'] = response_parts.get('hiddenField|__VIEWSTATE')
        fd['__EVENTVALIDATION'] = response_parts.get('hiddenField|__EVENTVALIDATION')
        fd['__ASYNCPOST'] = 'true'

        # create new form request
        request = FormRequest.from_response(
            response=response,
            formdata=formdata,
            dont_click=True,
            callback=callback,
            errback=self.error_callback)
        request.meta['full_response'] = response
#        self._print_form_request(request)
        return request


    # generator that will parse items from a content page and yield items
    def scrape_content_items (self, response):
        hxs = HtmlXPathSelector(response)
        stats = self.crawler.stats
        page_num = hxs.select ('//*[@id="MainContent_DocumentList1_GridView1_PageCurrent"]/@value').extract()
        if page_num:
            page_num = page_num[0]
            self.log('%s Scraping page %s' % (response.meta['cookiejar'], page_num), log.INFO)
        else:
            self.log('%s No page number found' % (response.meta['cookiejar']), log.WARNING)

        stats.inc_value ('_pages', spider=self)
        reports = hxs.select ('//table[@id="MainContent_DocumentList1_GridView1"]//tr')
        
        for report in reports:
            l = XPathItemLoader(FracFocusScrape(), report)
            for name, params in FracFocusScrape.fields.items():
                l.add_xpath(name, params['xpath'])
            item = l.load_item()
            if item.get('api'):
                if self.db.itemExists(item):
                    stats.inc_value ('_existing_count', spider=self)
                else:
                    stats.inc_value ('_new_count', spider=self)
#                print item['operator']
                    yield item
        if not stats.get_value('_existing_count') and not stats.get_value('_new_count'):
            self.log('%s No records found' % (response.meta['cookiejar']), log.WARNING)
        
        
        
    def extract_NoBot_ClientState (self, response):
        match = re.search(u'<div id="MainContent_NoBot1_NoBotSamplePanel" style="height:(\d+)px;width:(\d+)px;visibility:hidden;position:absolute;">', response.body)
        if match:
            return str(int(match.group(1)) * int(match.group(2)))
        return None

    def _print_form_data (self, response):
        forms = ParseFile(StringIO(response.body), response.url,
                          encoding=getattr(response, 'encoding', 'utf-8'), backwards_compat=False)
        for f in forms:
            for c in f.controls:
                print "%s:  %s" % (c.name, c.value[:100])

    def _print_response_parts (self, response_parts):
        print "########"
        for key, content in response_parts.items():
            print ("%s: %s") % (key, content[:100])

    def _print_form_request (self, form_request):

        print "********"
        headers = dict(re.findall('Content-Disposition: form-data; name="([^"]*)"\r\n\r\n(.*)', form_request.body))
        for key, content in headers.items():
            print ("%s: %s") % (key, content[:100])

    def item_stored(self, item, id):
        self.db.setBotTaskStatus(id, 'FracFocusReport', self.status_new)
        pass
