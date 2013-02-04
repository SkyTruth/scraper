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

from nrc.items import NrcScrapedReport, NrcScrapedFullReport, NrcScrapedMaterial
from nrc.database import NrcDatabase
from nrc.JobBot import JobBot


class NrcMaterialsScraper(JobBot):
    name = 'NrcMaterialsScraper'
    allowed_domains = ["nrc.uscg.mil"]
#    task_conditions = {'NrcScraper':'DONE'}

#    def process_item(self, task_id):
    def process_job_item(self, task_id):

        scraped_report = self.db.loadScrapedReport(task_id)
        if scraped_report is None:
            return

        request = Request(scraped_report['materials_url'], callback=self.parse_materials)
        request.meta['reportnum'] = task_id

        yield request


    def parse_materials(self, response):
        job = self.job_params
        reportnum = response.request.meta['reportnum']
        text = unicode (response.body, response.encoding)
        hxs = HtmlXPathSelector(text=text)
        materials = hxs.select ('//table[@class="t16Standard"]/tr')
        if (len(materials) == 0):
            self.log('Materials data not present in response from {0}'.format(response.url), log.INFO)
        elif (len(materials) == 1):
            self.log('No materials reports found in response', log.INFO)
        else:
            # Skip the first report record because this is the header row
            materials.pop (0)
            self.log('Retrieved {0} materials records'.format(len(materials)), log.INFO)

        for material in materials:
            l = XPathItemLoader(NrcScrapedMaterial(), material)
            l.name_in = lambda slist: [s[:32] for s in slist]
            l.add_value('reportnum', reportnum)
            for name, params in NrcScrapedMaterial.fields.items():
                if 'xpath' in params:
                    l.add_xpath(name, params['xpath'])
            item = l.load_item()
            yield item

        self.db.setBotTaskStatus(reportnum, job['job_name'], 'DONE') # name -> job_name
