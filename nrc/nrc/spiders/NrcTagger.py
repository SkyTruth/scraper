#NRC Tagger Spider 

import re

from scrapy.spider import BaseSpider
from scrapy import log

from nrc.database import NrcDatabase
from nrc.NrcBot import NrcBot


class NrcTagger(NrcBot):
    name = 'NrcTagger'
    task_conditions = {'NrcAnalyzer':'DONE'}
    job_item_limit = 10000  # maximum total items to process in one job execution
        
    def process_item(self, task_id):
        
        report = {}
        
        parsed_report = self.db.loadParsedReport(task_id)
        if parsed_report is None:
            return 
        report.update (parsed_report)
        
        scraped_report = self.db.loadScrapedReport(task_id)    
        if scraped_report is None:
            return 
        report.update (scraped_report)

        report_analysis = self.db.loadAnalysis(task_id)    
        if report_analysis is None:
            return 
        report.update (report_analysis)

        geocode = self.db.loadBestGeocode (task_id)
        if geocode:
            report.update (geocode)
        
        tag = self.make_LABB_tag (task_id, report)
        if tag: 
            yield tag

        release_type = report_analysis['release_type']
        if release_type and release_type != 'other':
            yield self.make_tag(task_id, release_type)

        release_severity = report_analysis['severity']
        if release_severity and release_severity != 'non-release':
            yield self.make_tag(task_id, 'release')
        
        self.item_completed(task_id)
        
    def make_LABB_tag (self, task_id, report):
        if report['state'] == 'LA' \
            and report['severity'] != 'minor' \
            and report['severity'] != 'non-release':
            return self.make_tag(task_id, 'LABB')
        else:
            return None
        
