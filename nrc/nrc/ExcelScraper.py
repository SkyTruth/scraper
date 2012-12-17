import re
from datetime import datetime, timedelta
import json
import xlrd
from xlrd import XL_CELL_DATE, XL_CELL_NUMBER, xldate_as_tuple

from scrapy.spider import BaseSpider
from scrapy.contrib.loader import ItemLoader
from scrapy.http import Request, Response, TextResponse
from scrapy.contrib.loader.processor import TakeFirst, MapCompose, Join
from scrapy.shell import inspect_response
from scrapy import log
#from scrapy.stats import stats

from nrc.database import NrcDatabase
from nrc.NrcBot import NrcBot



class ExcelScraper (NrcBot):
    name = 'ExcelScraper'

    def process_item(self, task):

        request = Request (task['target_url'], callback=self.parse_excel)
        self.log('Downloading excel file from url %s' % (task['target_url']), log.INFO)
        request.meta['task'] = task
        yield request


    def parse_excel (self, response):
        task = response.meta['task']
        stats = self.crawler.stats


        wb = xlrd.open_workbook(file_contents=response.body)
        self.log('Processing excel workbook with %s sheets' % (len(wb.sheets())), log.DEBUG)
        sheet_idx = int(task['sheet'])
        header_idx = 0

        sheet = wb.sheet_by_index(sheet_idx)
        nrows = sheet.nrows
        self.log('found %s total rows in sheet %s' % (nrows, sheet.name), log.INFO)
        self.log('Extracting column names from row %s' % (header_idx), log.DEBUG)

        col_names = ['%s' % re.sub(r'[\W]','_', str(v).strip()) for v in sheet.row_values(header_idx)]

        self.log(' %s' % (col_names), log.DEBUG)

        stats.set_value('_excel_rows_read', 0, spider=self)
        stats.set_value('_items_stored', 0, spider=self)

        first_row = header_idx + 1
        last_row = nrows
        for row_idx in range(first_row, last_row):
            stats.inc_value('_excel_rows_read', spider=self)
            row = dict (zip (col_names, [self.extract_cell_value(c, wb) for c in sheet.row_slice(row_idx)] ) )
            for r in self.process_row(row, task):
                stats.inc_value('_items_stored', spider=self)
                yield r

#        self.log("\n" + "\n".join ( ["%s = %s" % (k,v) for k,v in sorted(stats.get_stats(spider=self).items())] ), log.INFO)



    # Override in subclass
    def process_row (self, row, task):
        self.log('%s' % (row), log.DEBUG)
        yield

    def extract_cell_value (self, cell, wb):
        if cell.ctype == XL_CELL_DATE:
            return datetime (*xldate_as_tuple(cell.value, wb.datemode))
        elif cell.ctype == XL_CELL_NUMBER:
            return round(cell.value,12)      # elimintate some precision so that when we store it and read it back we get the same value
        else:
            return cell.value


