#NRC Geocoder Spider

import re
import random
import urllib

from scrapy.spider import BaseSpider
from scrapy.selector import HtmlXPathSelector, XmlXPathSelector
from scrapy.http import Request, Response, TextResponse
from scrapy.contrib.loader import XPathItemLoader, ItemLoader
from scrapy.contrib.loader.processor import TakeFirst, MapCompose, Join
from scrapy.shell import inspect_response
from scrapy import log

from nrc.items import NrcGeocode, add_lat_lng_jitter
from nrc.database import NrcDatabase
from nrc.JobBot import JobBot


class NrcGeocoder(JobBot):
    name = 'NrcGeocoder'
    allowed_domains = ['skytruth.org', 'googleapis.com']
#    task_conditions = {'NrcExtractor':'DONE'}
    area_code_map = None
    geocode_cache = {}
    geocode_precision = {
        'Explicit'          : 1,
        'street_address'    : 0.95,
        'premise'           : 0.9,
        'subpremise'        : 0.9,
        'intersection'      : 0.8,
        'route'             : 0.75,
        'BlockCentroid'     : 0.6,
        'ZIP'               : 0.5,
        'CITY_STATE'        : 0.2,
        'IGNORE'            : 0
        }
    us_territories = ['AS', 'FM', 'GU', 'MH', 'MP', 'PW', 'PR', 'UM', 'VI']

#    def process_item(self, task_id):
    def process_job_item(self, task_id):

        parsed_report = self.db.loadParsedReport(task_id)
        if parsed_report is None:
            return
        scraped_report = self.db.loadScrapedReport(task_id)
        if scraped_report is None:
            return
        if scraped_report['calltype'] == 'DRILL':
            self.item_dropped(task_id)
            return

        areaid = parsed_report['areaid']
        blockid = parsed_report['blockid']
        lat = parsed_report['latitude']
        lng = parsed_report['longitude']
        zip = parsed_report['zip']
        city= scraped_report['nearestcity']
        state = scraped_report['state']
        location = scraped_report['location']
        block_geocode = None

        if areaid and blockid:
            block_geocode = self.geocode_area_id (task_id, areaid, blockid)

        if lat and lng:
            # we have an explicit lat/lng.  If we also have a block_geocode, then this is a chance to check
            # the area id mapping
            if block_geocode:
                lat_diff = abs(block_geocode['lat'] - lat)
                lng_diff = abs(block_geocode['lng'] - lng)
                if lat_diff + lng_diff > 2:
                    msg = 'Lat/Lng mismatch for report %s. Centroid: %s Report: %s' % (task_id, block_geocode, parsed_report)
                    self.send_alert (msg)
                    yield self.make_tag(task_id, 'GeocodeMismatch', msg)

            yield self.createGeocode (task_id, 'Explicit', lat, lng)
            self.item_completed(task_id)
        elif block_geocode:
            yield self.createGeocode (task_id, 'BlockCentroid', block_geocode['lat'], block_geocode['lng'])
            self.item_completed(task_id)

        elif zip or (city and state):
            # mark this item as "no data" in case none of the google geocode requests return something we can use
            #self.set_item_status(task_id, self.status_no_data)
            self.item_nodata(task_id)

            if zip:
                if len(zip) == 9:
                    zip = '%s-%s' % (zip[:5], zip[5:])
                for item in self.geocodeAddress (zip, 'ZIP', task_id, state):
                    yield item
            if city and state:
                address = "%s, %s" % (city, state)
                for item in self.geocodeAddress (address, 'CITY_STATE', task_id, state):
                    yield item

            if location and city and state:
                address = "%s %s, %s %s" % (location, city, state, zip or '')
                for item in self.geocodeAddress (address, 'ADDRESS', task_id, state):
                    yield item
        else:
            # Not enough info to find a geo code
            self.item_dropped(task_id)

    def createGeocode (self, task_id, source, lat, lng):
        precision = self.geocode_precision.get(source, 0)

        if not precision: return None

        l=ItemLoader(NrcGeocode())
        l.add_value('reportnum', task_id)
        l.add_value('source', source)
        l.add_value ('precision', precision)

        if precision >= 0.75:
            l.add_value('lat', lat)
            l.add_value('lng', lng)
        else:
            l.add_value('lat', lat, add_lat_lng_jitter)
            l.add_value('lng', lng, add_lat_lng_jitter)

        return l.load_item()


    def geocodeAddress (self, address, source, task_id, state):
        item = None
        request = Request ('http://maps.googleapis.com/maps/api/geocode/xml?%s' % urllib.urlencode({'address':address, 'sensor': 'false'}),
                callback=self.parse_google_geocode,
                errback=self.error_callback,
                dont_filter=True)

        if source in ('ZIP', 'CITY_STATE'):
            cache_entry = self.db.getGeocodeCache (address)
            if cache_entry:
                item = self.createGeocode (task_id, source, cache_entry['lat'], cache_entry['lng'])
                self.log ('Task %s - Geocode cache hit for %s >> %s' % (task_id, address, item), log.INFO)
                yield item
                self.item_completed(task_id)
            else:
                request.meta['cache_key'] = address

        if not item:
            self.log ('Task %s - sending geocode request to google for %s' % (task_id, address), log.INFO)

            request.meta['source'] = source
            request.meta['reportnum'] = task_id
            request.meta['state'] = state
            yield request


#        The following types are supported and returned by the HTTP Geocoder:
#        street_address indicates a precise street address.
#        route indicates a named route (such as "US 101").
#        intersection indicates a major intersection, usually of two major roads.
#        political indicates a political entity. Usually, this type indicates a polygon of some civil administration.
#        country indicates the national political entity, and is typically the highest order type returned by the Geocoder.
#        administrative_area_level_1 indicates a first-order civil entity below the country level. Within the United States, these administrative levels are states. Not all nations exhibit these administrative levels.
#        administrative_area_level_2 indicates a second-order civil entity below the country level. Within the United States, these administrative levels are counties. Not all nations exhibit these administrative levels.
#        administrative_area_level_3 indicates a third-order civil entity below the country level. This type indicates a minor civil division. Not all nations exhibit these administrative levels.
#        colloquial_area indicates a commonly-used alternative name for the entity.
#        locality indicates an incorporated city or town political entity.
#        sublocality indicates an first-order civil entity below a locality
#        neighborhood indicates a named neighborhood
#        premise indicates a named location, usually a building or collection of buildings with a common name
#        subpremise indicates a first-order entity below a named location, usually a singular building within a collection of buildings with a common name
#        postal_code indicates a postal code as used to address postal mail within the country.
#        natural_feature indicates a prominent natural feature.
#        airport indicates an airport.
#        park indicates a named park.
#        point_of_interest indicates a named point of interest. Typically, these "POI"s are prominent local entities that don't easily fit in another category such as "Empire State Building" or "Statue of Liberty."
#



    def parse_google_geocode (self, response):

        self.log ('Parsing response from google geocoder\n%s' % (response.body), log.DEBUG)

        xxs = XmlXPathSelector(response=response)
        reportnum = response.request.meta['reportnum']
        source = response.request.meta['source']
        state = response.request.meta['state']
        geocode_cache_key = response.request.meta.get('cache_key',None)

        status = xxs.select ('//status/text()').extract()
        if status: status = status[0]
        if status == u'OK':
            result_type = xxs.select('//result/type[1]/text()').extract()
            if result_type: result_type = result_type[0]

            location = xxs.select('//geometry/location')
            lat = location.select('lat/text()').extract()[0]
            lng = location.select('lng/text()').extract()[0]

            geocode_state = xxs.select ('//address_component[type="administrative_area_level_1"]/short_name/text()')
            if geocode_state:
                geocode_state = geocode_state.extract()[0]
            else:
                geocode_state = xxs.select ('//address_component[type="country"]/short_name/text()')
                if geocode_state:
                    geocode_state = geocode_state.extract()[0]
                    if not geocode_state in self.us_territories:
                        geocode_state = None



            if source == 'ADDRESS':
                source = result_type

            if source == 'ZIP' and result_type != 'postal_code':
                self.log ('Bad zip code %s' % (geocode_cache_key), log.WARNING)

                source = 'IGNORE'

            if geocode_state:
                if (geocode_state.lower() != state.lower()):
                    self.log ('Geocode state mismatch: expected %s, actual %s' % (state, geocode_state), log.WARNING)
                    source = 'IGNORE'
            else:
                self.log ('Geocode returned with no state code', log.WARNING)
                source = 'IGNORE'


            item = self.createGeocode (reportnum, source, lat, lng)
            if item:
                if geocode_cache_key:
                    self.db.putGeocodeCache (geocode_cache_key, lat, lng)
                yield item
                self.item_completed(reportnum)
            else:
                self.log ('Dropping geocoder response with result type: %s' % (result_type), log.INFO)

        elif status == 'OVER_QUERY_LIMIT':
            self.log ('Geocode failed for task id %s \n%s\n%s' % (reportnum, response.request, response.body), log.WARNING)

            # Do not mark the task as done, we will pick it up again on the next run
            #self.item_processing(task_id)
            self.item_processing(reportnum)

            pass
        else:
            msg = 'Google Geocode operation failed for task id %s : %s \n%s' % (reportnum, response.request, response.body)
            self.send_alert (msg, reportnum)


    # find the lat/lng for the given area id and block id
    # if no match is found, return None, else return a dict (lat,lng)

    def geocode_area_id (self, task_id, areaid, blockid):
        # load area id patterns if necessary
        if not self.area_code_map:
            self.area_code_map = self.db.getAreaCodeMap()
            for m in self.area_code_map:
                m['pattern'] = re.compile(m['pattern'], re.IGNORECASE)

        area_codes = []
        # see if there is an area id match
        for m in self.area_code_map:
            p = m['pattern']
            if p.match(areaid):
                area_codes.append(m['area_code'])

        if len(area_codes) > 1:
            self.send_alert ('WARNING: Multiple pattern matches in %s for AreaID: %s -- %s' % (task_id, areaid, area_codes))
            return None

        # clean up block ID to get rid of extraneous characters
        match = re.search ('(A?[\d]+)', blockid)
        if not match: return None
        blockid = match.group()

        # got a numeric blockid, now make sure we have an area code
        if len(area_codes) == 0:
            # send warning and bail out
            self.send_alert ('WARNING: No pattern matches in %s for AreaID: %s' % (task_id, areaid,))
            return None

        # we have a single area code and a block ID, so look them up in the table to get lat/lng
        # see if there is a match in the BlockCentroid table
        block = self.db.getBlockCentroid (area_codes[0], blockid)
        if not block:
            # try prepending 'A' - sometimes this is missing in the report
            block = self.db.getBlockCentroid (area_codes[0], 'A%s' % blockid)
        if not block:
            self.send_alert ('WARNING: No matching lease block block found. report %s for areaid=%s blockid=%s' % (task_id, area_codes[0], blockid))
            return None

        return {'lat':block['lat'], 'lng':block['lng']}


