# RSS Subscrition Emailer

import re
from datetime import datetime, timedelta
import feedparser
import pickle
import uuid
import smtplib
from urlparse import urlparse, parse_qs

from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

from string import Template

from scrapy.spider import BaseSpider
from scrapy.contrib.loader import ItemLoader
from scrapy.contrib.loader.processor import TakeFirst, MapCompose, Join
from scrapy.shell import inspect_response
from scrapy import log

from nrc.items import FeedEntry, FeedEntryTag, RssFeedItem, format_datetime
from nrc.database import NrcDatabase
from nrc.JobBot import JobBot
from nrc.gpolyencode import GPolyEncoder
from nrc.GeoDatabase import GeoDatabase


class RssSubscriptionEmailer (JobBot):
    name = 'RssSubscriptionEmailer'

    def process_job(self):
        job_name = self.job_params['job_name']
        self.process_item(job_name)
        return []

#    def process_items (self):
#        # no task specified, so do both
#        self.log('No task specified. Executing confirm and update.', log.INFO)
#        for item in self.process_item ('confirm'):
#            yield item
#        for item in self.process_item ('update'):
#            yield item

    def process_item (self, job_name):
        if (job_name == 'rss_email_confirm'
            or job_name == 'rss_email_confirm_and_update'):
            self.send_confirmations ()
        elif (job_name == 'rss_email_update'
              or job_name == 'rss_email_confirm_and_update'):
            self.send_updates ()
        else:
            self.log('Unknown job_name given: %s' % (job_name), log.ERROR)

    def send_confirmations (self):
        # get subscriptions in need of confirmation
        subs = self.db.getEmailSubscriptionsForConfirmation ()
        self.log('Sending confirmations to %s subscriptions ' % (len(subs)), log.INFO)

        for sub in subs:

            msg = MIMEMultipart('alternative')
            msg['Subject'] = '[SkyTruth Alerts] Subscription Confirmation'
            msg['From'] = 'alerts@skytruth.org'
            msg['To'] = sub['email']

            map_size = 256
            params = {}
            params ['confirm_url'] = "http://alerts.skytruth.org/subscribe?sid=%s" % sub['id']
            params ['static_map_url'] = self.get_static_map_url (sub, map_size)

            params ['static_map_width'] = map_size
            params ['static_map_height'] = map_size

            msg_templates = self.get_message_templates ()

            msg.attach(MIMEText(msg_templates['text']['confirm'].substitute (params), 'plain'))
            msg.attach(MIMEText(msg_templates['html']['confirm'].substitute (params), 'html'))

            self.log('sending confirmation email to %s for subscription %s' % (msg['To'], sub['id']), log.INFO)

            self.send_email (msg['From'], msg['To'], msg)

            # update subscription status
            self.db.updateEmailSubscription (sub['id'], {'last_email_sent':format_datetime(datetime.now())})


    def get_static_map_url (self, sub, size):
        # Model Url:
        # http://maps.googleapis.com/maps/api/staticmap?size=512x512&maptype=roadmap&
        # path=color:0xf33f00ff|weight:5|fillcolor:0xFF000033|
        # 34.3888,-79.3872|40.0697,-79.3872|40.0697,-71.6968|34.3888,-71.6968|34.3888,-79.3872&sensor=false

        feed_params = self.parse_rss_url(sub['rss_url'])
        bounds = feed_params.get('bounds')
        region = feed_params.get('region')
        poly = None


        if region:
            # fetch the region boundary
            poly = self.geodb.getRegionBoundary(region)
            if poly:
                points = [ [float(p[0]), float(p[1])] for p in [p.split(' ') for p in poly['poly'][9:-2].split(',')] ]

                # encode the region for Google Static Image API
                encoder = GPolyEncoder ()
                enc = encoder.encode (points)
                poly = "enc:%s" % enc['points']

        elif bounds:
            poly = "%s,%s|%s,%s|%s,%s|%s,%s|%s,%s" % (bounds[0][0], bounds[0][1], bounds[1][0], bounds[0][1], bounds[1][0], bounds[1][1], bounds[0][0], bounds[1][1], bounds[0][0], bounds[0][1])

        t_params = sub
        t_params['size'] = size

        if not poly:
            t = Template ("$lat1,$lng1|$lat2,$lng1|$lat2,$lng2|$lat1,$lng2|$lat1,$lng1")
            poly = t.substitute (t_params)

        t_params['poly'] = poly
        t = Template ("http://maps.googleapis.com/maps/api/staticmap?size=${size}x${size}&sensor=false&maptype=roadmap&path=color:0xf33f00ff|weight:5|fillcolor:0xFF000033|$poly")

        return t.substitute (t_params)

    def parse_rss_url (self, url):
        p = urlparse(url)
        q = parse_qs(p.query)

        for k in q.keys():
            q[k] = q[k][0]

        bounds = None

        # convert "l" to "bounds"
        l = q.get('l')
        if l:
            coords = re.split('[:,]', l)
            if len(coords) == 4:
                bounds = [
                    [min(coords[0], coords[2]), min(coords[1], coords[3])],
                    [max(coords[0], coords[2]), max(coords[1], coords[3])]
                    ]
        # convert "BBOX" to "bounds"
        bbox = q.get('BBOX')
        if bbox:
            coords = re.split('[:,]', bbox)
            if len(coords) == 4:
                bounds = [
                    [min(coords[1], coords[3]), min(coords[0], coords[2])],
                    [max(coords[1], coords[3]), max(coords[0], coords[2])]
                    ]

        if bounds:
            q['bounds'] = bounds

        return q


    def send_updates (self):

        # get subscriptions in need of update
        subs = self.db.getEmailSubscriptionsForUpdate ()
        self.log('Sending updates to %s subscriptions ' % (len(subs)), log.INFO)

        for sub in subs:
            # get RSS feed
            self.log('reading rss feed: %s' % (sub['rss_url']), log.INFO)

            feed_data = feedparser.parse(sub['rss_url'])

            # construct message
            msg_parts = self.compose_message (sub, feed_data)

            # send email
            if msg_parts:
                # used the last example here:
                #http://docs.python.org/library/email-examples.html#email-examples
                msg = MIMEMultipart('alternative')
                msg['Subject'] = msg_parts['subject']
                msg['From'] = 'alerts@skytruth.org'
                msg['To'] = sub['email']
                msg.attach(MIMEText(msg_parts['text'], 'plain'))
                msg.attach(MIMEText(msg_parts['html'], 'html'))

                self.log('sending email to %s with %s new items' % (msg['To'], msg_parts['item_count']), log.INFO)

                self.send_email (msg['From'], msg['To'], msg)

                # update subscription status
                self.db.updateEmailSubscription (sub['id'],
                    {'last_email_sent': format_datetime(datetime.now()), 'last_item_updated': msg_parts['last_item_updated']})



    def compose_message (self, sub, feed_data):

        html_message_items = []
        text_message_items = []
        last_item_updated = sub['last_item_updated'] or datetime.now() - timedelta(days=3) # 3 days ago
        new_last_item_updated = last_item_updated

        msg_templates = self.get_message_templates ()

        # iterate over items in rss feed
        for item in  feed_data['items']:
            item_updated = datetime(*item['updated_parsed'][:6])

            # check to see if this is a new item
            if item_updated > last_item_updated:
                new_last_item_updated = max (new_last_item_updated, item_updated)
                msg = self.compose_item_message(item, msg_templates)
                html_message_items.append (msg['html'])
                text_message_items.append (msg['text'])

        new_item_count = len(text_message_items)
        self.log('found %s new items since %s' % (new_item_count, last_item_updated), log.INFO)

        # if there are no new items, then there is no message to send
        if not new_item_count:
            self.log('No new items found - finished processing feed %s' % (sub['rss_url']), log.INFO)
            return None

        params = {}
        map_size = 100
        params ['static_map_url'] = self.get_static_map_url (sub, map_size)
        params ['static_map_width'] = map_size
        params ['static_map_height'] = map_size
        params ['new_item_count'] = new_item_count

        notifications = []
        if len(text_message_items) == len (feed_data['items']) and len(text_message_items) == 50:
            notifications.append ('notice_overflow')

        params['unsubscribe_url'] = "http://alerts.skytruth.org/subscribe?sid=%s" % (sub['id'])
        subject = "[SkyTruth Alerts] %s New Incidents in Your Custom Feed" % len(text_message_items)


        text_body = self.compose_message_template (msg_templates['text'], notifications, text_message_items, params, '\r\n---\r\n\r\n')

        html_body = self.compose_message_template (msg_templates['html'], notifications, html_message_items, params, '<p></p>')

# TODO Encapsulate this!
#        template = msg_templates['text']
#        params['header'] = template['header'].substitute (params)
#        if len(text_message_items) == len (feed_data['items'])
#            params['message'] = template['message'].substitute (params)
#        else
#            params['mesasge'] = ''
#        params['footer'] = template['footer'].substitute (params)
#        params['items'] = '\r\n---\r\n\r\n'.join (text_message_items)
#        text_body = template['body'].substitute (params)
#
#
#        template = msg_templates['html']
#        params['header'] = template['header'].substitute (params)
#        if len(text_message_items) == len (feed_data['items'])
#            params['message'] = template['message'].substitute (params)
#        else
#            params['mesasge'] = ''
#        params['footer'] = template['footer'].substitute (params)
#        params['items'] = '<p></p>'.join (html_message_items)
#        html_body = template['body'].substitute (params)

        return {'subject': subject, 'html': html_body, 'text': text_body, 'last_item_updated': new_last_item_updated, 'item_count': len(text_message_items)}

    def compose_message_template (self, template, notifications, items, params, item_join_str):
        params['header'] = template['header'].substitute (params)

        params['notices'] = ''
        for notification in notifications:
            params['notices'] += template[notification].substitute(params)
        params['footer'] = template['footer'].substitute (params)
        params['items'] = item_join_str.join (items)

        return template['body'].substitute (params)


    def compose_item_message (self, item, msg_templates):
        params = {}
        params['link'] = item['links'][0]['href']
        params['title'] = item['title']
        params['summary'] = item['summary']
        tags = []
        if 'tags' in item:
            for t in item['tags']:
                tags.append (t['term'])
        params['tags'] = ', '.join (tags)

        html_msg = msg_templates['html']['item'].substitute(params)
        text_msg = msg_templates['text']['item'].substitute(params)
        return {'text': text_msg, 'html': html_msg}



    def get_message_templates (self):
        return {'html': self.get_html_templates(), 'text': self.get_text_templates()}



    def get_html_templates (self):
        templates = {

        'header' :  Template ("""

<table><tr valign="top">
<td width="400" align="center">
<a href='http://www.skytruth.org'><img width='83' height='32' src='http://www.skytruth.org/images/logo-standard.jpg'/></a><h1>SkyTruth Custom Alert Feed</h1>
The following <a href='http://alerts.skytruth.org'>SkyTruth Alerts</a> incidents have been reported in your selected geographical area since the last update was sent.</td>
<td><img width="$static_map_width" height="$static_map_height" src="$static_map_url" border="1"/></td>
</tr></table>
<hr/>
"""),

        'message' : Template("""
<p>$message_text</p>
"""),

        'footer' : Template("""
<hr/>
<p><b><a href='http://www.skytruth.org'>SkyTruth</a> Custom Alert Feed</b></p>
<p>You have received this email because you are subscribed to a custom feed from <b><a href='http://alerts.skytruth.org'>SkyTruth Alerts<a></b>
at <a href='http://alerts.skytruth.org'>alerts.skytruth.org</a></p><p>Click here to <a href='$unsubscribe_url'>Unsubscribe</a> from this feed</p>
"""),

        'body' : Template("$header $notices $items $footer"),

        'item' : Template('<h2><a href="$link">$title</a></h2><p>$summary</p><p>Tags: <b>$tags</b></p>'),

        'confirm' : Template("""
<h1><a href='http://www.skytruth.org'><img width='166' height='64' src='http://www.skytruth.org/images/logo-standard.jpg'/></a><br/>SkyTruth Custom Alert Feed</h1>
<h2>Confirmation Needed</h2>
<table><tr><td valign="top">
    <p>
    You are receiving this email beacuse you requested to be notified by email whenever new <a href="http;//alerts.skytruth.org">SkyTruth Alerts</a> are published in this geographical area.</p>
    <p>To confirm your subscription email address and begin receiving email updates, please click the link below</p>
    <h2><a href="$confirm_url">Confirm</a></h2>
    <p>If you do not wish to receive any more emails, then simply ignore this message and no further emails will be sent.</p>
</td>
<td>
    <img src="$static_map_url" width = "$static_map_width" height="$static_map_height"></img>
</td>
</tr></table>

"""),
        'notice_overflow': Template ("""
<h2><b>NOTE:</b> This subscription has more than $new_item_count new issues in the last 24 hours.  The email notification system is limited to a maximum of $new_item_count incidents per notification, which means that you are not getting all the incidents that occurred in your area since the last email.  In order to get the best use from the SkyTruth Alerts system, you may want to create a new subscription with a smaller geographic focus. </h2>
""")
        }

        return templates



    def get_text_templates (self):
        templates = {

        'header' : Template("""
The following SkyTruth Alerts incidents have been reported in your selected geographical area since the last update was sent.
"""),

        'message' : Template("""
$message_text
"""),

        'footer' : Template("""
-----------------------------------------------------
SkyTruth Custom Alert Feed - alerts.skytruth.org
You have received this email because you are subscribed to a custom feed from SkyTruth Alerts
To Unsubscribe from this feed, copy this url and paste it into your web browser:
$unsubscribe_url
"""),

        'body' : Template("""
$header
$notices
$items

$footer
"""),

        'item' : Template("""
$title

$summary

Tags: $tags
"""),

        'confirm' : Template("""
Confirmation Needed

You are receiving this email beacuse you requested to be notified by email whenever new SkyTruth Alerts are published in your selected geographical area.

To confirm your subscription email address and begin receiving email updates, please copy the link below and paste it into your web browser:

$confirm_url

If you do not wish to receive any more emails, then simply ignore this message and no further emails will be sent.

"""),

        'notice_overflow': Template ("""
NOTE: This subscription has more than $new_item_count new issues in the last 24 hours.  The email notification system is limited to a maximum of $new_item_count incidents per notification, which means that you are not getting all the incidents that occurred in your area since the last email.  In order to get the best use from the SkyTruth Alerts system, you may want to create a new subscription with a smaller geographic focus.
""")
        }

        return templates


