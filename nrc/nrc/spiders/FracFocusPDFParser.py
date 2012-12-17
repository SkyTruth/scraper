#NRC Analyzer Spider 

import re
import pprint
from datetime import date

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

from nrc.items import FracFocusParse, FracFocusParseChemical
from nrc.database import NrcDatabase
from nrc.NrcBot import NrcBot


class Logger (object):

    def __init__(self):
        self.messages = []

    def log(self, severity, message):
        self.messages.append({'severity':severity, 'message': message})
        
    def warning (self, message):
        self.log('warning', message)

    def error (self, message):
        self.log('error', message)
        
    def has_error (self):
        for m in self.messages:
            if m['severity'] == 'error': return True
        return False

    def get_messages (self):
        return '\n'.join(['%(severity)s: %(message)s' % (m) for m in self.messages])
                 
            
class CellText (LTComponent):
    text = ''
    
    def __init__(self, bbox, text):
        LTComponent.__init__ (self, bbox)    
        self.text = text
                
class Cell (LTComponent):
    text_lines = None
    
    def __init__(self, bbox):
        LTComponent.__init__ (self, bbox)    
        self.text_lines = []

    def get_text (self):
        return ' '.join ([t.text for t in self.text_lines])
        
class Sheet (object):
    cells = None
    text_layout = None
    column_edges = None
    row_edges = None
    
    
    def __init__(self):
        self.cells = Plane()
        self.text_layout = Plane()
        self.row_edges = {}
        self.column_edges = {}
        
    def add_cell (self, cell):
        self.cells.add(cell)
        

    def add_text (self, cell_text):
        self.text_layout.add(cell_text)
#        if cell_text.text[:3] == 'Oil': print cell_text.text, cell_text.bbox
        
    def add_column_edge (self, x_value):
        x = round(x_value,2)
        self.column_edges[x] = 1+ self.column_edges.get(x,0) 
    
    def add_row_edge (self, y_value):
        y = round(y_value,2)
        self.row_edges[y] = 1+ self.row_edges.get(y,0) 
        
    def add_line (self, bbox):
        if bbox[0]==bbox[2]:
            # vertical line
            self.add_column_edge(bbox[0])
        elif bbox[1]==bbox[3]:
            #horizontal line
            self.add_row_edge(bbox[1])
        else:
            print ('WARNING: non-orthogonal line found: %s'%bbox)
    
    def add_rect (self, bbox):
        self.add_column_edge(bbox[0])
        self.add_column_edge(bbox[2])
        self.add_row_edge(bbox[1])
        self.add_row_edge(bbox[3])
                            
    def add_ltcontainer (self, obj, page_y_offset):
        #NB: row indexes (y axis) are negative! 
        
        bbox = (
            round(obj.x0,2), 
            round(-(obj.y1+page_y_offset),2), 
            round(obj.x1,2), 
            round(-(obj.y0+page_y_offset),2)
            )
        
        if isinstance (obj, LTTextLine):
            self.add_text (CellText(bbox, obj.get_text()))
        elif isinstance (obj, LTLine):
            self.add_line(bbox)
        elif isinstance (obj, LTRect):
            self.add_rect(bbox)
        elif isinstance (obj, LTContainer):
            for child in obj:
                self.add_ltcontainer (child, page_y_offset)
        else:
            pass 
            
    def extract_rows (self):
#        for obj in self.text_layout.find((690, -1200, 800, -1000)):
#            print obj.bbox,obj.text

        row_bounds = sorted(self.row_edges)
        col_bounds = sorted(self.column_edges)

#        pprint.pprint(col_bounds)
        
        rows = []
        
        r0 = row_bounds[0] - 1 if row_bounds else 0
            
        #NB: row indexes (y axis) are negative!
        for r1 in row_bounds:
            if r1 - r0 < 1: continue    
            
#            print r1-r0,r0,r1
            
            row=[]
            c0 = 0
            for c1 in col_bounds:
                if c1 - c0 < 1: continue
                
#                print c0,r0,c1,r1
                # get all text lines that intersect the bounds of this cell
                lines = [l for l in self.text_layout.find((c0,r0,c1,r1))]
                #sort from top to bottom
                lines = sorted(lines, key=lambda line: line.y0)
                
#                text = ' '.join([t.text.strip() for t in lines if t.x0 >= c0 and t.x0 <= c1])
#                if text[:10] == 'Production': print text,c0,r0,c1,r1
#                if text[:3] == 'Oil': print text,c0,r0,c1,r1

                # remove anything where the left edge is not inside the cell and concatenate the rest
                row.append(' '.join([t.text.strip() for t in lines if t.x0 >= c0 and t.x0 <= c1]))
                c0 = c1
            rows.append(row)    
            r0 = r1
        return rows
                                
            
#    def get_rows (self):
#        rows = []
#        row = []
#        last_y0 = -1
#        
##        print len(self.cells)
#        
#        for cell in self.cells:
##            print len(cell.text_lines)
##            print cell.get_text()
#            
#            if row and (cell.y0 != last_y0):
#                rows.append(row)
#                row = []
#            last_y0 = cell.y0    
#            row.append (cell.get_text())
#        return rows

class Report (object):
    field_defs = None
    report_data = None
    col_indexes = None
    messages = None
    chemicals = None
    
    def __init__ (self, logger):
        self.field_defs = [
            {'label':'fracture_date', 'regex': 'fracturedate:?$', 'type': 'report'},
            {'label':'fracture_date', 'regex': 'lastfracturedate:?$', 'type': 'report'},
            {'label':'state', 'regex': 'state:?$', 'type': 'report'},
            {'label':'county', 'regex': 'county:?$', 'type': 'report'},
            {'label':'county', 'regex': 'county/parish:?$', 'type': 'report'},
            {'label':'api', 'regex': 'apinumber:?$', 'type': 'report'},
            {'label':'operator', 'regex': 'operatorname:?$', 'type': 'report'},
            {'label':'well_name', 'regex': 'wellnameandnumber:?$', 'type': 'report'},
            {'label':'longitude', 'regex': 'longitude:?$', 'type': 'report'},
            {'label':'latitude', 'regex': 'latitude:?$', 'type': 'report'},
            {'label':'datum', 'regex': 'long/latprojection:?$', 'type': 'report'},
            {'label':'production_type', 'regex': 'productiontype:?$', 'type': 'report'},
            {'label':'true_vertical_depth', 'regex': 'trueverticaldepth.*$', 'type': 'report'},
            {'label':'total_water_volume', 'regex': 'totalwatervolume.*$', 'type': 'report'},
            {'label':'trade_name', 'regex': 'tradename$', 'type': 'column'},
            {'label':'supplier', 'regex': 'supplier$', 'type': 'column'},
            {'label':'purpose', 'regex': 'purpose$', 'type': 'column'},
            {'label':'ingredients', 'regex': 'ingredients$', 'type': 'column'},
            {'label':'cas_number', 'regex': 'chemicalabstractservicenumber', 'type': 'column'},
            {'label':'additive_concentration', 'regex': 'maximumingredientconcentrationinadditive', 'type': 'column'},
            {'label':'hf_fluid_concentration', 'regex': 'maximumingredientconcentrationinhffluid', 'type': 'column'},
            {'label':'comments', 'regex': 'comments$', 'type': 'column'},
            {'label':'footer', 'regex': '\*totalwatervolumesourcesmayinclude', 'type': 'footer'},
         
        ]
        self.report_data = {}
        self.col_indexes = {}
        self.messages = []
        self.chemicals = []
        self.logger = logger
    
    def warning (self, msg):
        self.logger.warning(msg)

    def error (self, msg):
        self.logger.error(msg)
        
    def match_field_def (self, text, field_def):
        t = re.sub('[\s]','',text)
        return re.match(field_def['regex'], t, re.IGNORECASE)
    
    def find_field_def (self, text):
        t = re.sub('[\s]','',text)
        for d in self.field_defs:
            if re.match(d['regex'], t, re.IGNORECASE):
                return d
        return None
    
    def row_contains_label (self, row):
        for col in row:
            field_def = self.find_field_def (col)
            if field_def: return field_def
        return None

    def extract_report_field (self, field_def, row):
        text= []
        
        for col in row:
#            print field_def['label'],col
            # skip data that matches the field label
            if col and not self.match_field_def(col,field_def):
                #take only the first non-blank column that does not match the field label
                if col:
                    text.append (col)
                    break
            
        self.report_data [field_def['label']] = ' '.join(text)
        
    def extract_column_headings (self, row):
        for i,text in enumerate(row):
            if text:
                field_def = self.find_field_def(text)
                if field_def and field_def['type'] == 'column':
                    self.col_indexes[field_def['label']] = i
                else:
                    self.warning('Unknown column heading: %s'%text)
        
        # check to see that we got all the coluumn headings
        expected_count = 0
        for d in self.field_defs:
            if d['type'] == 'column': 
                expected_count += 1
                if d['label'] not in self.col_indexes:
                    self.error('Missing column header: %s' %d['label'])
            
                
        if len(self.col_indexes) != expected_count:
            self.error('Wrong columnn heading count - expected: %s, found: %s'%(expected_count, len(self.col_indexes)))
            
    def extract_chemical_record (self, row, chem_row_number):
        record = {'row': chem_row_number}
        for label,i in self.col_indexes.items():
            record[label] = row[i]
            
        self.chemicals.append(record)
    
    def extract_data (self, sheet):
        rows = sheet.extract_rows()
        
        found_col_header = False
        chem_row_number = 1
        
        for row in rows:
            field_def = self.row_contains_label (row)

            if found_col_header:
                # if we have already seen the column header row, extract a chemical record and add to the list of chemicals

                if field_def and field_def['type'] == 'footer':
                    # found the footer - no more data after this
                    break
                if ''.join(row):
                    # don't extract empty rows
                    self.extract_chemical_record (row, chem_row_number)
                chem_row_number += 1
            elif field_def:
                # see if this row contains a defined label
                # if this is a report row, extract and add to the report 
                if field_def['type'] == 'report':
                    self.extract_report_field (field_def, row)
                elif field_def['type'] == 'column':
                    # if this is the column header row, extract and set column indexes
                    self.extract_column_headings(row)    
                    found_col_header = True  
            else:
#                print row 
                pass
                                    
        for d in self.field_defs:
            if d['type'] == 'report': 
                if d['label'] not in self.report_data:
                    self.error('Missing report field: %s' %d['label'])


class Parser (object):

    def __init__ (self, raw_pdf, logger):
        self.raw_pdf = raw_pdf
        self.logger = logger
        self.report = None
                    
    def parse_pdf (self):
        self.report = Report (self.logger)
        fp = StringIO(self.raw_pdf)
        parser = PDFParser(fp)
        doc = PDFDocument()
        parser.set_document(doc)
        try:
            doc.set_parser(parser)
            doc.initialize('')
            if not doc.is_extractable:
                raise PDFTextExtractionNotAllowed
        except Exception as e:
            self.logger.error('%s'%e)
            return False
                            
        rsrcmgr = PDFResourceManager()
        laparams = LAParams()
        device = PDFPageAggregator(rsrcmgr, laparams=laparams)
        interpreter = PDFPageInterpreter(rsrcmgr, device)
        sheet = Sheet()
        page_y_offset = 0

        pages = []
        for page in doc.get_pages():
            pages.append(page)
        pages.reverse()
                    
        for i,page in enumerate(pages):
            interpreter.process_page(page)
            layout = device.get_result()
            sheet.add_ltcontainer (layout, page_y_offset)
            page_y_offset += layout.y1
            
        self.report.extract_data (sheet)
        
        if self.logger.has_error():
            return None
        else:
            return self.report
    
        
                
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
        
        parser = Parser (pdf['pdf'], logger)
        
        report = parser.parse_pdf()
        
        if report:
            
            try:
                l = ItemLoader (FracFocusParse ())
                l.add_value (None, report.report_data)
                l.add_value('seqid', task_id)
                item = l.load_item()
                
                if (item['api'] != scrape['api']) or (item['fracture_date'][:10]!=str(scrape['job_date'])):
                    yield self.make_bot_task_error (task_id, 'API_MISMATCH', 'API/Job Date mismatch scraped api: %s, date: %s  parsed api: %s date: %s' %(item['api'],item['fracture_date'],scrape['api'],scrape['job_date']))
                    
                yield(item)
                
                for chem in report.chemicals:
                    l = ItemLoader (FracFocusParseChemical())
                    l.add_value (None, chem)
                    l.add_value ('report_seqid', task_id)
                    l.add_value ('api', report.report_data['api'])
                    l.add_value ('fracture_date', report.report_data['fracture_date'])
                    yield l.load_item()
    
            except ValueError as e:
                logger.error('%s'%e)
                logger.error(report.report_data)
                
        if logger.has_error():
            msg = logger.get_messages()
            self.log (msg, log.ERROR)
            yield self.make_bot_task_error(task_id, 'PARSE_ERROR', msg)
#            self.send_alert(msg, context='task_id: %s' %(task_id,) ) 
            self.item_dropped(task_id)
        else:
            self.item_completed(task_id)

        
