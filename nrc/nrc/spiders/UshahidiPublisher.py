# UshahidiPublisher bot

import re
from datetime import datetime, timedelta
import json

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
            'auth_token' : 'JDxEF83bd',
            'incident_active' : '1',
            'incident_alert_status' : '1',

            }
        params = {}
        params['task'] = 'report'
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

        if feed_params.get('test_mode'):
            self.log('Testing %s to %s:\n%s\n%s\n%s'
                     % ( self.name,
                         feed_params['api_url'],
                         report['incident_date'],
                         report['incident_title'],
                         report['incident_description']), log.INFO)
        else:
            yield request

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


