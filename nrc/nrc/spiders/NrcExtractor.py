#NRC Extractor Spider 

import re

from scrapy.spider import BaseSpider
from scrapy.selector import HtmlXPathSelector, XmlXPathSelector
from scrapy.http import Request, Response, TextResponse
from scrapy.contrib.loader import XPathItemLoader
from scrapy.contrib.loader.processor import TakeFirst, MapCompose, Join
from scrapy.shell import inspect_response
from scrapy import log

from nrc.items import NrcParsedReport
from nrc.database import NrcDatabase
from nrc.NrcBot import NrcBot


class NrcExtractor(NrcBot):
    name = 'NrcExtractor'
    allowed_domains = ['skytruth.org']
    task_conditions = {'NrcFullReportScraper':'DONE'}
    patterns = [
        ('areaid','>Location[\s]+Area[\s]+ID:([^<]+)'),
        ('blockid', '>Location[\s]+Block[\s]+ID:([^<]+)'),
        ('platform_letter', '>Platform[\s]+Letter:([^<]+)'),

        ('latitude','>LAT:([^<]+)'),
        ('latitude','>Latitude:([^<]+)'),
        ('latitude','([-]?[\s]*[\d]{2}[\s]+[\d]{2}[\s]+[\d]+[.]?[\d]*[\s]*[NS])'),
        ('latitude','LAT[\s]+([-]?[\d]{2}[\s]+[\d]{1,2}[\s]+[\d]+[.]?[\d]*[\s]*[NS]?)'),

        ('latitude', '([NS][\s]*[\d]{2}[\s]+[\d]{2}[\s]+[\d]{1,2}[.]?[\d]*)'),
        ('latitude','([NS][\s]*[\d]{2}[\s]+[\d]{1,2}[.][\d]+)'),
        ('latitude','([\d]{2,3}[\s]+[\d]{1,2}[.][\d]+[\s]*[NS])'),

        ('longitude','>LONG:([^<]+)'),
        ('longitude','>Longitude:([^<]+)'),
        ('longitude','([-]?[\s]*[\d]{2,3}[\s]+[\d]{2}[\s]+[\d]+[.]?[\d]*[\s]*[EW])'),
        ('longitude','LONG[\s]+([-]?[\d]{2,3}[\s]+[\d]{1,2}[\s]+[\d]+[.]?[\d]*[\s]*[EW]?)'),

        ('longitude','([EW][\s]*[\d]{2,3}[\s]+[\d]{2}[\s]+[\d]{1,2}[.]?[\d]*)'),
        ('longitude','([EW][\s]*[\d]{2,3}[\s]+[\d]{1,2}[.][\d]+)'),
        ('longitude','([\d]{2,3}[\s]+[\d]{1,2}[.][\d]+[\s]*[EW])'),


        ('zip','>City:.+State:.+Zip:([^<]+)<'),
        ('county','County:([^<]+)'),
        ('sheen_size_length','Sheen[\s]+Size[\s]+Length:([^<]+)'),
        ('sheen_size_width','Sheen[\s]+Size[\s]+Width:([^<]+)'),
        ('affected_area','Affected[\s]+Area:([^<]+)')
        ]
    compiled_patterns = []
    area_code_map = None
        
    def process_item(self, task_id):
        report = self.db.loadScrapedFullReport(task_id)
        if report is None:
            return
            
        text = report['full_report_body']
        text = "".join(chr(min(ord(c),127)) for c in text)
        t = TextResponse (url=report['full_report_url'], body=text.encode('utf-8')) #must have utf-8 here
        l = XPathItemLoader(NrcParsedReport(), response=t)
        l.add_value('reportnum', task_id)
        
        patterns = self.compile_patterns ()
        
        for p in patterns:
            l.add_value(p[0], text, TakeFirst(), unicode.strip, re=p[1])
                
        county = l.get_output_value('county')
        pattern = self.get_area_code_pattern(county)
        if pattern:
            l.add_value ('areaid', county)
            l.add_value('blockid', text, TakeFirst(), unicode.strip, re="%s[\s]+(?:BLOCK[\s]+)?([\d]+)" % pattern)
            l.add_value('blockid', text, TakeFirst(), unicode.strip, re="BLOCK[\s]+([\d]+)")
            
                        
        item = l.load_item()
        
        yield item
        self.item_completed(task_id)

    def compile_patterns (self):
        if not self.compiled_patterns:
            for p in self.patterns:
                self.compiled_patterns.append( (p[0], re.compile(p[1])) )
        return self.compiled_patterns

    def get_area_code_pattern (self, value):
        if not value: return None
        
        # load area id patterns if necessary
        if not self.area_code_map: 
            self.area_code_map = self.db.getAreaCodeMap()
            for m in self.area_code_map:
                m['compiled_pattern'] = re.compile(m['pattern'], re.IGNORECASE)
        
        # see if there is an area id match
        for m in self.area_code_map:
            p = m['compiled_pattern']
            if p.match(value):
                return m['pattern']
                
        return None

