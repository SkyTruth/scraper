import re
from datetime import datetime, timedelta
import json
from xml.etree import ElementTree
from scrapy.spider import BaseSpider
from scrapy.contrib.loader import ItemLoader
from scrapy.http import Request, Response, TextResponse
from scrapy.contrib.loader.processor import TakeFirst, MapCompose, Join
from scrapy.shell import inspect_response
from scrapy import log

from nrc.database import NrcDatabase
#from nrc.NrcBot import NrcBot
from nrc.JobBot import JobBot



class AtomPubScraper (JobBot):
    name = 'AtomPubScraper'

#    def process_item(self, task):
    def process_job(self):
        job = self.job_params

        request = Request (job['target_url'], callback=self.parse_xml)
        self.log('Downloading xml from url %s' % (job['target_url']), log.INFO)
        request.meta['job'] = job
        yield request


    def parse_xml (self, response):
        job = response.meta['job']
        stats = self.crawler.stats

        self.log ('Parsing xml...', log.INFO)

        stats.set_value('_atom_entries_read', 0, spider=self)
        stats.set_value('_items_stored', 0, spider=self)

        feed = ElementTree.XML(response.body)

        for entry in feed.findall('{http://www.w3.org/2005/Atom}entry'):

            stats.inc_value('_atom_entries_read', spider=self)
            row = {}
            for field in entry:
                row.update (self.parse_atom_field (field))

            for r in self.process_row(row, job):
                stats.inc_value('_items_stored', spider=self)
                yield r
        for r in self.finalize_rows (job):
            stats.inc_value('_items_stored', spider=self)
            yield r


    def finalize_rows (self, job):
        yield

    def parse_atom_field (self, field):
        properties = {}
        tag = re.sub ('\{.*\}', '', field.tag)
        if tag == 'content' and field.get('type') == 'application/xml':
            properties.update (self.parse_xml_properties(field))
        else:
            properties [tag] = field.text
        return properties

    def parse_xml_properties (self, element):
        properties = {}
        for child in element:
            for p in child.getiterator():
                properties[re.sub ('\{.*\}', '', p.tag)] = p.text
        return properties

    def parse_date (self, atom_date_str):
        if atom_date_str:
            dt = "%s %s"%(atom_date_str[0:10], atom_date_str[11:19])
            return dt.strip()
        return None

#    stats = self.crawler.stats
#        wb = xlrd.open_workbook(file_contents=response.body)
#        self.log('Processing excel workbook with %s sheets' % (len(wb.sheets())), log.DEBUG)
#        sheet_idx = int(task['sheet'])
#        header_idx = 0
#
#        sheet = wb.sheet_by_index(sheet_idx)
#        nrows = sheet.nrows
#        self.log('found %s total rows in sheet %s' % (nrows, sheet.name), log.INFO)
#        self.log('Extracting column names from row %s' % (header_idx), log.DEBUG)
#
#        col_names = ['%s' % re.sub(r'[\W]','_', str(v).strip()) for v in sheet.row_values(header_idx)]
#
#        self.log(' %s' % (col_names), log.DEBUG)
#
#        stats.set_value('_excel_rows_read', 0, spider=self)
#
#        first_row = header_idx + 1
#        last_row = nrows
#        for row_idx in range(first_row, last_row):
#            stats.inc_value('_excel_rows_read', spider=self)
#            row = dict (zip (col_names, [self.extract_cell_value(c, wb) for c in sheet.row_slice(row_idx)] ) )
#            for r in self.process_row(row, task):
#                stats.inc_value('_items_stored', spider=self)
#                yield r
#
#        self.log("\n" + "\n".join ( ["%s = %s" % (k,v) for k,v in sorted(stats.get_stats(spider=self).items())] ), log.INFO)



    # Override in subclass
    def process_row (self, row, job):
        self.log('%s' % (row), log.DEBUG)
        yield



