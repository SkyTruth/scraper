#NRC Feed Generator

import re
import uuid
import locale
from datetime import datetime

from scrapy.spider import BaseSpider
from scrapy.selector import HtmlXPathSelector, XmlXPathSelector
from scrapy.http import Request, Response, TextResponse
from scrapy.contrib.loader import XPathItemLoader, ItemLoader
from scrapy.contrib.loader.processor import TakeFirst, MapCompose, Join
from scrapy.shell import inspect_response
from scrapy import log

from nrc.items import FeedEntry, FeedEntryTag
from nrc.database import NrcDatabase
from nrc.JobBot import JobBot


def untitle_entity(matchobj):
    return unicode.lower(matchobj.group(0))


class NrcFeedGenerator (JobBot):
    name = 'NrcFeedGenerator'
    allowed_domains = ['skytruth.org']
#    task_conditions = {'NrcGeocoder':'DONE','NrcAnalyzer':'DONE', 'NrcTagger':'DONE'}
#    job_item_limit = 10000  # maximum total items to process in one job execution

    def __init__(self, **kwargs):
        JobBot.__init__(self, **kwargs)
        locale.setlocale (locale.LC_ALL, 'en_US.UTF-8')

#    def process_item(self, task_id):
    def process_job_item(self, task_id):
        parsed_report = self.db.loadParsedReport(task_id)
        if parsed_report is None:
            return
        scraped_report = self.db.loadScrapedReport(task_id)
        if scraped_report is None:
            return
        report_analysis = self.db.loadAnalysis(task_id)
        if report_analysis is None:
            return

#        geocodes = self.db.loadGeocodes (task_id)
#        best_score = 0
#        geocode = None
#        for g in geocodes:
#            if g['source'] == 'Explicit':
#                score = 100
#            elif g['source'] == 'BlockCentroid':
#                score = 60
#            elif g['source'] == 'Zip':
#                score = 50
#            else:
#                score  = 10
#            if (score > best_score):
#                best_score = score
#                geocode = g

        geocode = self.db.loadBestGeocode (task_id)

        if geocode and report_analysis['calltype'] == 'INCIDENT' and report_analysis['severity'] != 'non-release':
            item = self.create_item (task_id, scraped_report, parsed_report, geocode)
            if item:
                item_id = item['id']
                yield item
                tags = self.create_tag_items (task_id, item_id)
                for t in tags: yield t

            self.item_completed(task_id)
        else:
            self.item_dropped(task_id)


    def create_item(self, task_id, scraped_report, parsed_report, geocode):
        l=ItemLoader (FeedEntry())

        # construct article title
        what = unicode.title(unicode(scraped_report['material_name'] or ''))
        city = unicode.title(unicode(scraped_report['nearestcity'] or ''))
        state = scraped_report['state']
        affected_area = unicode.title(unicode(parsed_report['affected_area'] or ''))
        if (city and state): where = '%s, %s' % (city, state)
        else: where = '%s%s' % (city or '', state or '')
        title = 'NRC Report: %s' % (what or 'Unknown',)
        if (affected_area): title = title + ' in %s' % affected_area
        if (city): title = title + ' near %s' % where

        # Fix up any html entities that got munged by title case conversion
        # e.g. unicode.title('foo &amp; bar') == 'Foo &Amp; Bar'
        title = re.sub('&[a-zA-Z]+;', untitle_entity, title)

        feed_entry_id = uuid.uuid3(uuid.NAMESPACE_URL, scraped_report['full_report_url'].encode('ASCII'))
        l.add_value ('id', feed_entry_id)
        l.add_value ('title', title)
        l.add_value ('link', scraped_report['full_report_url'])
#        l.add_value ('updated', scraped_report['incident_datetime'])  # Updated field is deprecated - ok to delete this after making the transition to using published and incident_datetime instead
        l.add_value ('incident_datetime', scraped_report['incident_datetime'])

        l.add_value ('summary', u'Incident Type: %s' % (scraped_report['incidenttype'] or u'',))
        l.add_value ('summary', u'NRC Report ID: %s' % (task_id,))
        l.add_value ('summary', u'Medium Affected: %s' % (scraped_report['medium_affected'] or u'',))
        l.add_value ('summary', u'Suspected Responsible Party: %s' % (scraped_report['suspected_responsible_company'] or u'',))

        l.add_value ('content', u'<b>Report Details</b>')
        l.add_value ('content', u'NRC Report ID: <a href="%s">%s</a>' % (scraped_report['full_report_url'],task_id,))
        l.add_value ('content', u'Incident Time: %s' % (scraped_report['incident_datetime'],))
        l.add_value ('content', u'Nearest City: %s' % (where))
        l.add_value ('content', u'Location: %s' % (scraped_report['location'] or u''))
        l.add_value ('content', u'Incident Type: %s' % (scraped_report['incidenttype'] or u'',))
        l.add_value ('content', u'Material: %s' % (scraped_report['material_name'] or u'',))
        l.add_value ('content', u'Medium Affected: %s' % (scraped_report['medium_affected'] or u'',))
        l.add_value ('content', u'Suspected Responsible Party: %s' % (scraped_report['suspected_responsible_company'] or u'',))


        l.add_value ('content', u'<b>SkyTruth Analysis</b>')

        if geocode['source'] == 'Explicit':
            geocode_note = geocode['source']
        else:
            geocode_note = 'Approximated from %s' % geocode['source']
        l.add_value ('content', u'Lat/Long: %f, %f (%s)' % (geocode['lat'], geocode['lng'], geocode_note))

        report_analysis = self.db.loadAnalysis(task_id)
        if report_analysis:
            if report_analysis['sheen_length'] and report_analysis['sheen_width']:
                l.add_value ('content', u'Reported Sheen Size: %s by %s (area %s)' %
                    (self.format_value_extent(report_analysis['sheen_width']),
                    self.format_value_extent(report_analysis['sheen_length']),
                    self.format_value_area(report_analysis['sheen_width'] * report_analysis['sheen_length'])))
            if report_analysis['reported_spill_volume']:
                l.add_value ('content', u'Reported Spill Volume: %s' %
                    (self.format_value_volume(report_analysis['reported_spill_volume'])))
            if report_analysis['min_spill_volume']:
                l.add_value ('content', u'SkyTruth Minimum Estimate: %s'%
                    (self.format_value_volume(report_analysis['min_spill_volume'])))
        l.add_value ('content', u'<b>Report Description</b>')

        l.add_value ('content', scraped_report['description'])

        l.add_value ('lat', geocode['lat'])
        l.add_value ('lng', geocode['lng'])
        l.add_value ('source_id', 1)
        l.add_value ('source_item_id', task_id)

        return l.load_item()

    def create_tag_items (self, task_id, item_id):
        tag_items = []

        l = ItemLoader (FeedEntryTag())
        l.add_value ('feed_entry_id', item_id)
        l.add_value ('tag', 'NRC')
        tag_items.append(l.load_item())

        nrc_tags = self.db.loadNrcTags(task_id)
        for t in nrc_tags:
            l = ItemLoader (FeedEntryTag())
            l.add_value ('feed_entry_id', item_id)
            l.add_value ('tag', t['tag'])
            l.add_value ('comment', t['comment'])
            tag_items.append(l.load_item())
        return tag_items


    # assumes value is in feet
    def format_value_extent (self, value):
        if not value: return ''
        units = 'feet'
        if (value >= 1000):
            value = value / 5280
            units = 'miles'
        return '%s %s' % (locale.format("%.12g", round(value,2), False), units)

    # assumes value is in sq. feet
    def format_value_area (self, value):
        if not value: return ''
        units = 'sq. ft.'
        if (value >= 10000):
            value = value / 43560
            units = 'acres'
            if value >= 640:
                value = value / 640
                units = 'sq. miles'
        return '%s %s' % (locale.format("%.12g", round(value,2), False), units)

    # assumes value in gallons
    def format_value_volume (self, value):
        if not value: return ''
        units = 'gallons'
        return '%s %s' % (locale.format("%.12g", round(value,2), False), units)
