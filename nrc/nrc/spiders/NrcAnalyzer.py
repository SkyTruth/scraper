#NRC Analyzer Spider 

import re

from scrapy.spider import BaseSpider
from scrapy.selector import HtmlXPathSelector, XmlXPathSelector
from scrapy.http import Request, Response, TextResponse
from scrapy.contrib.loader import XPathItemLoader, ItemLoader
from scrapy.contrib.loader.processor import TakeFirst, MapCompose, Join
from scrapy.shell import inspect_response
from scrapy import log

from nrc.items import NrcAnalysis
from nrc.database import NrcDatabase
from nrc.NrcBot import NrcBot


class NrcAnalyzer(NrcBot):
    name = 'NrcAnalyzer'
    allowed_domains = ['skytruth.org']
    task_conditions = {'NrcGeocoder':'*'}
    units_map = None
    materials_map = None
    job_item_limit = 10000  # maximum total items to process in one job execution
        
    def process_item(self, task_id):
        
        parsed_report = self.db.loadParsedReport(task_id)
        if parsed_report is None:
            return 

        scraped_report = self.db.loadScrapedReport(task_id)    
        if scraped_report is None:
            return 

        geocode = self.db.loadBestGeocode (task_id)

        sheen_width = self.normalize_value (parsed_report['sheen_size_width'], 'UNKNOWN')
        sheen_length = self.normalize_value (parsed_report['sheen_size_length'], 'UNKNOWN')
        
        if sheen_width and sheen_width[1] == 'UNKNOWN' and sheen_length and sheen_length[1] != 'UNKNOWN':
            sheen_width = self.normalize_value (parsed_report['sheen_size_width'], sheen_length[1])
            
        if sheen_length and sheen_length[1] == 'UNKNOWN' and sheen_width and sheen_width[1] != 'UNKNOWN':
            sheen_length = self.normalize_value (parsed_report['sheen_size_length'], sheen_width[1])
        
        scraped_materials = self.db.loadScrapedMaterial (task_id)
        reported_volume = 0.0
        for m in scraped_materials:
            if m['amount']:
                v = self.normalize_value ((m['amount'], m['unit']))
                if v and v[1] == 'GALLON': reported_volume += v[0]
        
        l=ItemLoader (NrcAnalysis())

        l.add_value ('reportnum', task_id)
        l.add_value ('sheen_width', sheen_width and sheen_width[0])
        l.add_value ('sheen_length', sheen_length and sheen_length[0])
        l.add_value ('reported_spill_volume', reported_volume)

        min_volume = 0.0
        if sheen_width and sheen_length: 
            # assume 1 micron thick, 
            # or 1000L per km2 
            # or 264.172052 gal per 10763910.4 ft2 = 0.000024542386752 gal per ft2
            min_volume = sheen_width[0] * sheen_length[0] * 0.000024542386752
            l.add_value ('min_spill_volume', min_volume)
            
        if reported_volume > 100 or min_volume > 100:
            yield self.make_tag(task_id, 'BigSpill')

        if reported_volume and min_volume / reported_volume >= 2:
            yield self.make_tag(task_id, 'SheenSizeMismatch')
        
        calltype = scraped_report['calltype']
        
        # Check for "ATON BATTERY RELEASE" in the description - ignore these, not exactly sure what they are...       
        if re.match('.*ATON BATTERY',scraped_report['description'] or ''):
            calltype = 'ATON'
        if calltype == 'INCIDENT' and re.match('DRILL[^\w]',scraped_report['description'] or ''):
            calltype = 'DRILL'
            
        l.add_value('calltype', calltype)
        
        l.add_value('severity', self.get_release_severity(scraped_report, reported_volume, min_volume))    
        
        l.add_value('release_type', self.get_release_type(scraped_report))

        l.add_value('region', self.get_region(scraped_report, parsed_report, geocode))
        
        yield l.load_item()

        self.item_completed(task_id)
        
        
        
    # normalize the given value into appropriate standardized units
    #
    # value can be a string, in which case it should be of the form "AMOUNT UNIT"
    # value can also be a tuple (amount, unit)
    #
    # returns a tuple (amount, unit)
    # amount is a numeric
    # unit is a string signifying the standard unit that the value has been converted to
    # 
    def normalize_value (self, value, default_unit='UNKNOWN'):

        if type (value) in (str, unicode):
            value = self.parse_value (value, default_unit)

        if not value: return None
            
        if type(value) is tuple: 
            amount = value[0]
            unit = value[1]
        else:
            raise TypeError(value)
                
        # normalize unit
        normalized_unit = self.normalize_unit (unit)
        if not normalized_unit: 
            return None
            
        return (amount * normalized_unit['conversion_factor'], normalized_unit['standardized_unit'])
        
    def parse_value (self, value, default_unit='UNKNOWN'):
        m = re.match ('([\d\s/.]+)([^\d]+)', value)
        if m:
            v = m.group(1).strip()
            u = m.group(2).strip()        
        else:
            # check to see if this is a value with no unit
            m = re.match ('([\d\s/.]+)', value)
            if m:
                v = m.group(1).strip()
                u = default_unit
            else:
                #Check to see if value matches an UNIT pattern.  Should encapsuate that test...
                #unit with no value - do not send warning, just ignore
                normalized_unit = self.normalize_unit (unit=value, send_warning=0)
                if not normalized_unit:
                    self.send_alert ("WARNING: failed to parse value: '%s' " % (value,))
                return None
        
        # Check to see if the value part is in the form "1 1/2" or "1/8"
        m = re.match ('([\d]*)[\s]*([\d])/([\d])',v)
        try:
            if m:
                base = float(m.group(1) or 0)
                num = float(m.group(2) or 0)
                denom = float(m.group(3) or 0)
                v = base
                if num and denom:
                    v += num/denom
            else:
                v = float(v)
        except ValueError:
            self.send_alert ("WARNING: failed to parse amount: '%s' " % (v,))
            return None
                    
        return (v, u)
        
    def normalize_unit (self, unit, send_warning = 1):
        if not self.units_map:
            self.units_map = self.db.getNrcUnits ()
            for m in self.units_map:
                m['pattern'] = re.compile(m['pattern'], re.IGNORECASE)
    
        if not unit: return None
        
        matched = []
        for u in self.units_map:
            p = u['pattern']
            if unit and p.match(unit):
                matched.append(u)
                
        if len(matched) == 0:
            if send_warning:
                self.send_alert ('WARNING: no pattern matches for unit: %s' % (unit,))
            return None
            
        if len(matched) > 1:
            if send_warning:
                self.send_alert ('WARNING: Multiple pattern matches for unit: %s -- %s' % (unit, matched))
            return None
        
        return matched[0]     
       
    def get_release_severity (self, scraped_report, reported_volume, min_volume):

        if ((scraped_report['incidenttype'] == 'RAILROAD NON-RELEASE') or
                (scraped_report['medium_affected'] in ('NON-RELEASE (N/A)', 'RAIL REPORT (N/A)'))):
            return 'non-release'
        
        if (reported_volume < 42 and min_volume < 42 and 
            (re.match('HYDRAULIC', scraped_report['material_name'] or '') or 
                scraped_report['material_name'] in ('REFRIGERANT GASES','OIL, FUEL: NO. 1-D','OIL, FUEL: NO. 2-D'))):
            return 'minor'
            
        if (scraped_report['incidenttype'] == 'UNKNOWN SHEEN' and reported_volume < 1 and min_volume < 10):
            return 'minor'
        
        if reported_volume > 100 or min_volume > 100:
            return 'major'
            
        return 'release'
        
    def get_release_type (self, scraped_report):
        if not self.materials_map:
            self.materials_map = self.db.getNrcMaterials ()
            for m in self.materials_map:
                m['pattern'] = re.compile(m['pattern'], re.IGNORECASE)
    
        matched = []
        material_name = scraped_report['material_name']
        for item in self.materials_map:
            p = item['pattern']
            if material_name and p.match(material_name):
                matched.append(item)

        if len(matched) == 0:
            return 'other'
            
        if len(matched) > 1:
            self.send_alert ('WARNING: Multiple pattern matches for material: %s -- %s' % (material_name, matched))
            return None
        
        return matched[0]['group_label']     

        
    def get_region (self, scraped_report, parsed_report, geocode):
        region_rects = [
            {'name': 'gulf', 'lat':(23, 30.41), 'lng':(-97.36,-82.66)},
            {'name': 'gulf', 'lat':(23, 27.4), 'lng':(-82.66,-81.7)},
            {'name': 'gulf', 'lat':(23,25.92), 'lng':(-81.7,-80.72)}
            ]
            
        if parsed_report['affected_area'] == 'GULF OF MEXICO':
            return 'gulf'
            
        if geocode:
            for r in region_rects:
                if (geocode['lat'] >= min(r['lat']) and geocode['lat'] <= max(r['lat'])
                    and geocode['lng'] >= min(r['lng']) and geocode['lng'] <= max(r['lng'])):
                    return r['name']

        return 'unknown'    
        
    

                  