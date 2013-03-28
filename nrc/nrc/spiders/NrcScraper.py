#NRC Report Spider

import pprint
from datetime import datetime, date, timedelta
from urlparse import urlsplit, urljoin
from urlparse import parse_qs

from scrapy.spider import BaseSpider
from scrapy.selector import HtmlXPathSelector
from scrapy.http import FormRequest
from scrapy.http import Request, Response, TextResponse
from scrapy.shell import inspect_response
from scrapy import log
from scrapy.contrib.loader import XPathItemLoader
from scrapy.contrib.loader.processor import TakeFirst, MapCompose, Join


from nrc.items import NrcScrapedReport, NrcScrapedFullReport, NrcScrapedMaterial
from nrc.database import NrcDatabase

class NrcScraper(BaseSpider):
    name = "NrcScraper"
    allowed_domains = ["nrc.uscg.mil", "maps.googleapis.com"]
    
#        old url: "http://www.nrc.uscg.mil/apex/f?p=109"
    start_urls = [
        "http://www.nrc.uscg.mil/pls/apex/f?p=109:1:0:::::"
    ]
    db = None

    def __init__(self, **kwargs):
        self.db = NrcDatabase()
        self.db.connect()
        self.enddate = date.today()
        if 'enddate' in kwargs:
            self.enddate = datetime.strptime(kwargs['enddate'],'%Y-%m-%d')
        interval = timedelta (10) # ten days
        last_report_dt = self.db.latestReportDate()
        
        if last_report_dt:
            self.startdate = (last_report_dt - timedelta(days=10))
        else:    
            self.startdate = self.enddate - interval
        if 'startdate' in kwargs:
            self.startdate = datetime.strptime(kwargs['startdate'],'%Y-%m-%d')
        if 'target' in kwargs:
            # ignore default date range and get it from the schedule table in the database instead
            t = self.db.getNextNrcScraperTarget(kwargs['target'])
            if (t):
                self.startdate = t["startdate"]
                self.enddate = t["enddate"]
        
    
    def parse(self, response):
        # get today's date.
        # TODO: make this a runtime parameter
        enddate = self.enddate
        startdate = self.startdate
        self.log('Requesting NRC Incident reports from {0} to {1}'.format(startdate, enddate), log.INFO)
        request = FormRequest.from_response(response,
            formdata={
                'p_t04': startdate.strftime("%d-%b-%y"),
                'p_t05': enddate.strftime("%d-%b-%y"),
                'p_t14': '100',
                'p_request': 'Go'
            },
            callback=self.search_results)
        return [request]
    
    def search_results(self, response):
        text = unicode (response.body, response.encoding)
        hxs = HtmlXPathSelector(text=text)
        reports = hxs.select ('//table[@class="t16Standard"]/tr')
        if (len(reports) == 0):
            self.log('Incident report data not present in response', log.ERROR)
        else:
            # Skip the first report record because this is the header row
            reports.pop (0)
            if (len(reports) == 0):
                self.log('No incident reports found in response', log.WARNING)
            else:
                self.log('Retrieved {0} incident reports'.format(len(reports)), log.INFO)
        
        for report in reports:
            l = XPathItemLoader(NrcScrapedReport(), report)
            l.context['base_url'] = response.url
            for name, params in NrcScrapedReport.fields.items():
                l.add_xpath(name, params['xpath'])
            item = l.load_item()
            if self.db.reportExists(item['reportnum']):
                self.log('Report {0} already exists.  Skipping to next report.'.format(item['reportnum']), log.INFO)
            else:
                f_request = Request(
                    item['full_report_url'],
                    callback=self.parse_full_report)
                m_request = Request(
                    item['materials_url'],
                    callback=self.parse_materials)
                yield item
                self.db.setBotTaskStatus(item['reportnum'], self.name, 'DONE')
                
#                if self.db.fullReportExists (item['reportnum']):
#                    self.log('Full report Report {0} already exists.  Skipping download.'.format(item['reportnum']), log.INFO)
#                else:
#                    yield f_request
#                    
#                if self.db.materialExists (item['reportnum']):
#                    self.log('Materials record(s) already exist for report {0}.  Skipping download.'.format(item['reportnum']), log.INFO)
#               else:
#                    yield m_request
                    
        # get next page of results
        next = hxs.select('//td[@class="pagination"][4]/a/@href')
        if len(next) > 0:
            yield Request (urljoin(response.url, next[0].extract()), callback=self.search_results)
          
        
    def parse_full_report(self, response):
        # need to work around weird bug where lxml can't handle encode=WINDOWS-1252
        # so pull out the body, convert to utf-8 and create a new TextResponse object to contain it
        # since XPathItemLoader requires a Response object
        text = unicode (response.body, response.encoding)
        t = TextResponse (url=response.url, body=text.encode('utf-8'), encoding='utf-8')
        
        l= XPathItemLoader(NrcScrapedFullReport(), response=t)
        url_parts = urlsplit(response.url)
        l.add_value('reportnum', parse_qs(url_parts.query)['standard_web inc_seq'])
        l.add_xpath('full_report_body', '//body')
        l.add_value('full_report_url', response.url)
        item = l.load_item()
        reportnum = item['reportnum']
        yield item
        self.db.setBotTaskStatus(reportnum, self.name, 'DONE')
        
    
    def parse_materials(self, response):
        text = unicode (response.body, response.encoding)
        hxs = HtmlXPathSelector(text=text)
        materials = hxs.select ('//table[@class="t16Standard"]/tr')
        if (len(materials) == 0):
            self.log('Materials data not present in response from {0}'.format(response.url), log.INFO)
        else:
            # Skip the first report record because this is the header row
            materials.pop (0)
            if (len(materials) == 0):
                self.log('No incident reports found in response', log.INFO)
            else:
                self.log('Retrieved {0} materials records'.format(len(materials)), log.INFO)

        for material in materials:
            l = XPathItemLoader(NrcScrapedMaterial(), material)
            l.add_value('reportnum', response.url, TakeFirst(), re='P3_SEQNOS:(\d+)')
            for name, params in NrcScrapedMaterial.fields.items():
                if 'xpath' in params:
                    l.add_xpath(name, params['xpath'])
            item = l.load_item()
            yield item

    def item_stored(self, item, id):
        return

