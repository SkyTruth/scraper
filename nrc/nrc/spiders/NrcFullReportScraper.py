#NRC Full Report Spider

import re
from urlparse import urlsplit, urljoin
from urlparse import parse_qs

from scrapy.spider import BaseSpider
from scrapy.selector import HtmlXPathSelector, XmlXPathSelector
from scrapy.http import Request, Response, TextResponse
from scrapy.contrib.loader import XPathItemLoader, ItemLoader
from scrapy.contrib.loader.processor import TakeFirst, MapCompose, Join
from scrapy.shell import inspect_response
from scrapy import log

from nrc.database import NrcDatabase
from nrc.JobBot import JobBot
from nrc.items import NrcScrapedReport, NrcScrapedFullReport, NrcScrapedMaterial


class NrcFullReportScraper(JobBot):
    name = 'NrcFullReportScraper'
    allowed_domains = ["nrc.uscg.mil"]
#    task_conditions = {'NrcScraper':'DONE'}

#    def process_item(self, task_id):
    def process_job_item(self, task_id):

        scraped_report = self.db.loadScrapedReport(task_id)
        if scraped_report is None:
            return

        request = Request(scraped_report['full_report_url'], callback=self.parse_full_report)
        request.meta['reportnum'] = task_id

        yield request


    def parse_full_report(self, response):
        job = self.job_params
        reportnum = response.request.meta['reportnum']

        # need to work around weird bug where lxml can't handle encode=WINDOWS-1252
        # so pull out the body, convert to utf-8 and create a new TextResponse object to contain it
        # since XPathItemLoader requires a Response object
        text = unicode (response.body, response.encoding)
        if len(text) < 1000:    # check for an empty response- if so then bail out - we'll try again next time around
            return

        t = TextResponse (url=response.url, body=text.encode('utf-8'), encoding='utf-8')

        l= XPathItemLoader(NrcScrapedFullReport(), response=t)
        url_parts = urlsplit(response.url)
        l.add_value('reportnum', reportnum)
        l.add_xpath('full_report_body', '//body')
        l.add_value('full_report_url', response.url)
        item = l.load_item()
        yield item
        self.db.setBotTaskStatus(reportnum, job['job_name'], 'DONE') # name -> job_name

