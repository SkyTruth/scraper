# -*- coding: utf-8 -*-
#NRC Analyzer Spider 

import re
import pprint

from StringIO import StringIO
from pdfminer.pdfparser import PDFParser, PDFDocument
from pdfminer.pdfinterp import PDFResourceManager, PDFPageInterpreter
from pdfminer.pdfdevice import PDFDevice
from pdfminer.layout import LTContainer, LTComponent, LTRect, LTLine, LAParams, LTTextLine
from pdfminer.utils import Plane
from pdfminer.converter import PDFPageAggregator

from scrapy.spider import BaseSpider
from scrapy.selector import HtmlXPathSelector, XmlXPathSelector
from scrapy.http import Request, Response, TextResponse
from scrapy.contrib.loader import XPathItemLoader, ItemLoader
from scrapy.contrib.loader.processor import TakeFirst, MapCompose, Join
from scrapy.shell import inspect_response
from scrapy import log

from nrc.items import FracFocusParse, FracFocusParseChemical, FracFocusReport, FracFocusReportChemical
from nrc.database import NrcDatabase
from nrc.NrcBot import NrcBot

         
class FracFocusAnalyzer(NrcBot):
    name = 'FracFocusAnalyzer'
    allowed_domains = ['skytruth.org']
    task_conditions = {'FracFocusPDFParser':'DONE'}
    job_item_limit = 1000  # maximum total items to process in one job execution

        
    def process_item(self, task_id):
        
        # Load the Report
        scrape = self.db.loadFracFocusScrape (task_id)
        parse = self.db.loadFracFocusParse (task_id)
#        report = self.db.loadFracFocusReport (scrape['api'], scrape['job_date'])
        chemicals = self.db.loadFracFocusParseChemicals (task_id)

        analysis = {}
        # copy scraped and parsed values
        analysis['pdf_seqid'] = task_id
        analysis['api'] = scrape['api']
        analysis['fracture_date'] = scrape['job_date']
        analysis['state'] = scrape['state']
        analysis['county'] = scrape['county']
        analysis['operator'] = scrape['operator']
        analysis['well_name'] = scrape['well_name']
        analysis['production_type'] = scrape['well_type'].title()
        analysis['true_vertical_depth'] = parse['true_vertical_depth']
        analysis['total_water_volume'] = parse['total_water_volume']
        analysis['latitude'] = scrape['latitude']
        analysis['longitude'] = scrape['longitude']
        analysis['datum'] = scrape['datum']
        
        # add derived values
        if analysis['total_water_volume']:
            analysis['total_water_weight'] = round(analysis['total_water_volume'] * 8.35,0)
            analysis['total_pct_in_fluid'] = 0
            analysis['water_pct_in_fluid'] = 0
            
            for c in chemicals:
                if c['hf_fluid_concentration']:
                    analysis['total_pct_in_fluid'] += c['hf_fluid_concentration']
                    if self.is_water ( c ):
                        analysis['water_pct_in_fluid'] += c['hf_fluid_concentration']
     
            if analysis['water_pct_in_fluid']:
                analysis['total_hf_weight'] = round(analysis['total_water_weight'] / analysis['water_pct_in_fluid'] * 100,0)
            else:
                analysis['total_hf_weight'] = 0
                
            for c in chemicals:
                if c['hf_fluid_concentration']:
                    c['weight'] = round(analysis['total_hf_weight'] * c['hf_fluid_concentration'] / 100,0)

        for c in chemicals:
            del c['ft_id']
            del c['report_seqid']
            self.normalize_cas(c)
            c['pdf_seqid'] = task_id
            
        # Check for range errors
        for t in self.test_range (analysis, 
                {
                'longitude': (-180, 180),
                'latitude': (-90, 90),
                'water_pct_in_fluid': (80,100),
                'total_pct_in_fluid': (97,103),
                }):
            yield t    
        
        l=ItemLoader (FracFocusReport())
        l.add_value (None, analysis)
        yield l.load_item()
    
        for c in chemicals:
            l=ItemLoader (FracFocusReportChemical())
            l.add_value (None, c)
            yield l.load_item()
        
        self.item_completed(task_id)    
    
    def test_range (self, analysis, tests):
        for k, r in tests.items():
            if analysis.get(k) is not None and (analysis[k] < r[0] or analysis[k] > r[1]):
                analysis['err_code'] = 'OUT_OF_RANGE'
                analysis['err_field'] = k
                analysis['err_comment'] = '%s value %s is not in the range of [%s , %s]. Derived values are not reliable.' % (k, analysis[k], r[0], r[1])
                yield self.make_bot_task_error(analysis['pdf_seqid'], analysis['err_code'], analysis['err_comment'])
                
                
                
          
    def is_water (self, chemical):
        return re.search('water', chemical['trade_name'] or '', re.IGNORECASE) or \
            re.search('water', chemical['ingredients'] or '', re.IGNORECASE)
    

     
    def normalize_cas (self, chemical):
        # need to deal with embedded spaces, misplaced dashes and extra 0s
        # eg. misplaced dash: '1009-7-0', '100-97-0',
        # e.g. '014808-60-7', '14808-60-7','14808 - 60- 7
        
        cas = chemical['cas_number']
        chemical ['cas_type'] = 'other'
        
        if not cas:
            return
            
            
        # see if it matches a defined pattern
        cas_patterns = {
            'proprietary': 'proprietary',
            'trade': 'proprietary',
            'confidential': 'proprietary',
            'cbi': 'proprietary',
            'xxxx-xx-x': 'proprietary',
            'undisclosed': 'proprietary',
            }
        for p, t in cas_patterns.items():
            if re.match(p, cas, re.IGNORECASE):
                chemical['cas_type'] = t
                return
        
        # strip out everything but the digits
        digits = list(re.sub('[^\d]','',cas))
                        
        # strip off leading zeros
        while (digits and digits[0] == '0'):
            digits.pop (0)

        if len(digits) < 4:
            return 
                            
        #compute checksum
        l = len(digits)
        checksum = sum([int(d)*(l-i-1) for i,d in enumerate(digits)]) % 10

        if checksum == int(digits[-1]):
            digits = ''.join(digits)
            chemical['cas_number'] = '%s-%s-%s'% (digits[:-3],digits[-3:-1],digits[-1])    
            chemical['cas_type'] = 'valid'
        
        


                                
        
