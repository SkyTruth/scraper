# -*- coding: utf-8 -*-
#NRC Analyzer Spider

import re
import pprint
from datetime import date

from StringIO import StringIO
#from pdfminer.pdfparser import PDFParser, PDFDocument
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

from nrc.items import FracFocusParse, FracFocusParseChemical, normalize_api
from nrc.database import NrcDatabase
from nrc.NrcBot import NrcBot

from fracfocustools import FracFocusPDFParser as Parser
from fracfocustools import Report, Logger


class FracFocusPDFParser(NrcBot):
    name = 'FracFocusPDFParser'
    allowed_domains = ['skytruth.org']
    task_conditions = {'FracFocusPDFDownloader':'DONE'}
    job_item_limit = 1000  # maximum total items to process in one job execution

    def process_item(self, task_id):

        logger = Logger()

        # Load the PDF
        pdf = self.db.loadFracFocusPDF(task_id)
        scrape = self.db.loadFracFocusScrape (task_id)

        parser = Parser (str(pdf['pdf']), logger)

        report = parser.parse_pdf()
        if report is None:
            # Here we modify the pdf text by an imperically determined replacement.
            # I seems that some older pdfs stored in the database don't parse
            # unless we make this change.
            pdftext = str(pdf['pdf']).replace("''","'")
            logger = Logger()
            parser = Parser (pdftext, logger)
            report = parser.parse_pdf()

        if report:
            rptdata = report.report_data
            try:
                l = ItemLoader (FracFocusParse ())
                l.county_in = lambda slist: [s[:20] for s in slist]
                l.state_in = lambda slist: [s[:20] for s in slist]
                l.operator_in = lambda slist: [s[:50] for s in slist]
                l.well_name_in = lambda slist: [s[:50] for s in slist]
                l.production_type_in = lambda slist: [s[:10] for s in slist]
                # Delete fields of the new format report that are not in the DB table
                for field in ('end_date', 'federal', 'base_nonwater_volume'):
                    try:
                        del rptdata[field]
                    except KeyError:
                        pass
                # normalize the apo to 2-3-5 format
                rptdata['api'] = normalize_api(rptdata['api'], gmax=3)
                l.add_value (None, report.report_data)
                l.add_value('seqid', task_id)
                item = l.load_item()

                if (item['api'] != scrape['api']) or (item['fracture_date'][:10]!=str(scrape['job_date'])):
                    yield self.make_bot_task_error (task_id, 'API_MISMATCH', 'API/Job Date mismatch scraped api: %s, date: %s  parsed api: %s date: %s' %(item['api'],item['fracture_date'],scrape['api'],scrape['job_date']))

                yield(item)

                for chem in report.chemicals:
                    l = ItemLoader (FracFocusParseChemical())
                    l.supplier_in = lambda slist: [s[:50] for s in slist]
                    l.cas_number_in = lambda slist: [s[:50] for s in slist]
                    l.trade_name_in = lambda slist: [s[:200] for s in slist]
                    l.purpose_in = lambda slist: [s[:200] for s in slist]
                    l.ingredients_in = lambda slist: [s[:200] for s in slist]
                    l.add_value (None, chem)
                    l.add_value ('report_seqid', task_id)
                    l.add_value ('api', report.report_data['api'])
                    l.add_value ('fracture_date', report.report_data['fracture_date'])
                    yield l.load_item()

            except ValueError as e:
                logger.error('%s'%e)
                logger.error(report.report_data)

        msg = logger.get_messages()
        if logger.has_error():
            self.log (msg, log.ERROR)
            yield self.make_bot_task_error(task_id, 'PARSE_ERROR', msg)
#            self.send_alert(msg, context='task_id: %s' %(task_id,) )
            self.item_dropped(task_id)
        else:
            if logger.has_warning():
                yield self.make_bot_task_error(task_id, 'PARSE_WARNING', msg)
                self.log (msg, log.WARNING)
            #self.item_completed(task_id)

    def item_stored(self, item, id):
        if isinstance(item, FracFocusParse):
            task_id = item.get('seqid')
            if task_id:
                self.item_completed(task_id)

