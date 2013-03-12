# UshahidiPublisher bot

import re
from datetime import datetime, timedelta
import json

from w3lib.http import basic_auth_header

from scrapy.spider import BaseSpider
from scrapy.contrib.loader import ItemLoader
from scrapy.http import FormRequest, Response, TextResponse
from scrapy.contrib.loader.processor import TakeFirst, MapCompose, Join
from scrapy.shell import inspect_response
from scrapy import log

from nrc.database import NrcDatabase
from nrc.NrcBot import NrcBot
from nrc.FeedPublisher import FeedPublisher


class UshahidiPublisher (FeedPublisher):
    name = 'UshahidiPublisher'
    allowed_domains = None
    
    def process_feed_item(self, item, feed_params):
        
        # extract location name from the title
        re_match = re.search(r"[\s]near[\s](.*)$", item['title']) or re.search(r"[\s]in[\s](.*)$", item['title'])
        if re_match:
            location_name = re_match.group(1)
        else: 
            location_name = 'Unspecified'
                        
        dt = datetime.strptime (item['incident_datetime'], "%Y-%m-%d %H:%M:%S") # YYYY-MM-DD HH:MM:SS
        report = {
            'incident_title': item['title'],
            'incident_description': item['description'],
            'incident_date' :  dt.strftime('%m/%d/%Y'),  #  'MM/DD/YYYY'
            'incident_hour' :  dt.strftime('%I'),        # 01-12
            'incident_minute' :  dt.strftime('%M'),      # 00-59   
            'incident_ampm' :  dt.strftime('%p').lower(),  # am | pm
            'incident_category' : self.get_category(item, feed_params),
            'latitude' : item['lat'],
            'longitude' : item['lng'],
            'location_name' : location_name,
            'person_first' : 'SkyTruth Alerts',
            'person_last' : '',
            'person_email' : 'alerts@skytruth.org',
            }            
        params = {}
        
        api_version = feed_params.get('api_version', 'default')
        if api_version in ('default', 'oilspill'):
            params['auth_token'] = 'JDxEF83bd'
            params['task'] = 'report'
            params['incident_active'] = '1' 
            params['incident_alert_status'] = '1' 
        elif api_version in ('LABB'):
            params['task'] = 'reports'
#            params['task'] = 'report'
            params['action'] = 'edit'
            params['incident_active'] = '1' 
        else:
            self.log('Unknown API version specified: %s' % (api_version), log.ERROR)
            
    
        params = dict(params.items() + report.items())
        
        # retrieve task
        
        self.log('publishing item %s to Ushahidi API %s' % (item['id'], feed_params['api_url']), log.DEBUG)
    
        request = FormRequest (feed_params['api_url'], formdata=params,
        callback=self.submit_report_success,
        errback=self.error_callback,
        dont_filter=True)

        request.meta['report'] = report
        request.meta['item'] = item
        request.meta['feed_params'] = feed_params
        request.meta['dont_retry'] = True
        
        if feed_params.get ('http_user'):
            self.log('Authenticating with user: %s' % (feed_params.get ('http_user')), log.INFO)
            request.headers['Authorization'] = basic_auth_header(feed_params.get ('http_user'), feed_params.get ('http_password'))
        
        #yield request
        yield self.filter_request(request)

    def filter_request(self, request):
        # This filter allows UshahidiPublisherTest class 
        # to override this method and skip publication.
        if self.__class__.__name__ == "UshahidiPublisherTest":
            self.log('UshahidiPublisherTest should not be here!'), log.ERROR
            return None
        return request

    def submit_report_success(self, response):
        print response.body
        print response.meta['report']
        result = json.loads(response.body)
        if result['payload']['success'] == 'true':
            self.log('published feed item %s to Ushahidi API %s' % (response.meta['item']['id'], response.meta['feed_params']['api_url']), log.INFO)
        else:
            self.send_alert('feed item %s failed to publish\nUshahidi API: %s\n%s: %s\n%s' % (response.meta['item']['id'], response.meta['feed_params']['api_url'], result['error']['code'], result['error']['message'], response.meta['report']))
            
    def get_category (self, item, feed_params):
        cat = feed_params['ushahidi_category']
        if (cat=='LABB'):
            cat_map = {
                'FIXED' : '45',
                'PLATFORM' : '46',
                'PIPELINE' : '47',
                'VESSEL' : '48',
                'STORAGE TANK' : '49',
                'UNKNOWN SHEEN' : '50'
                 }
            cat = '50'
            m = re.search('Incident Type:([^<]+)', item['description'])
            if m:
                incident_type = m.group(1).strip()
                cat = cat_map.get(incident_type, cat)
                self.log(' parsed IncidentType = "%s", matched cat id %s' % (incident_type, cat), log.DEBUG)
        return cat

class UshahidiPublisherTest (UshahidiPublisher):
    name = 'UshahidiPublisherTest'
    #job_item_limit = 1  # limit to the first feed source
    def __init__(self, **kwargs):
        # After scrapy finds the spider by name, change the name
        # so we interact with the database as 'UshahidiPublisher'.
        UshahidiPublisherTest.name =  'UshahidiPublisher'
        UshahidiPublisher.__init__(self, **kwargs)

    def filter_request(self, request):
        # Report what would be done, but don't do it.
        task_id = request.meta['item']['id']
        url = request.meta['feed_params']['api_url']
        date = request.meta['report']['incident_date']
        title = request.meta['report']['incident_title']
        self.log('Would publish feed item %s to Ushahidi API %s\n\tOn %s: %s'
                 % (task_id, url, date, title),
                 log.INFO)
        return None

