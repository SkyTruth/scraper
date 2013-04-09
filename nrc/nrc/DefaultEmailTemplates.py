# -*- coding: utf-8 -*-
"""
Created on Mon Apr 08 16:51:51 2013

@author: Craig
"""

# standard modules
from string import Template

# site modules

# local modules

# CONSTANTS


class DefaultEmailTemplates(object):

    def get_html_templates (self):

        templates = {
        'header' :  Template (
                "\n\n"
                '<table><tr valign="top">'
                '<td width="400" align="center">'
                "<a href='http://www.skytruth.org'>"
                "<img width='83' height='32' "
                "src='http://www.skytruth.org/images/logo-standard.jpg'/>"
                "</a><h1>SkyTruth Custom Alert Feed</h1>"
                "The following <a href='http://alerts.skytruth.org'>"
                "SkyTruth Alerts</a> incidents have been reported in your "
                "selected geographical area since the last update was sent."
                "</td>"
                '<td><img width="$static_map_width" '
                'height="$static_map_height" src="$static_map_url" '
                'border="1"/></td>'
                "</tr></table>"
                "<hr/>"),
        'message' : Template(
                "\n"
                "<p>$message_text</p>"),
        'footer' : Template(
                "\n"
                "<hr/>"
                "<p><b><a href='http://www.skytruth.org'>SkyTruth</a> "
                "Custom Alert Feed</b></p>"
                "<p>You have received this email because you are subscribed to "
                "a custom feed from <b><a href='http://alerts.skytruth.org'>"
                "SkyTruth Alerts<a></b>"
                "at <a href='http://alerts.skytruth.org'>alerts.skytruth.org"
                "</a></p><p>Click here to <a href='$unsubscribe_url'>"
                "Unsubscribe</a> from this feed</p>"),
        'body' : Template("$header $notices $items $footer"),
        'item' : Template(
                '<h2><a href="$link">$title</a></h2><p>$summary</p><p>Tags: '
                '<b>$tags</b></p>'),
        'confirm' : Template(
                "<h1><a href='http://www.skytruth.org'><img width='166' "
                "height='64' "
                "src='http://www.skytruth.org/images/logo-standard.jpg'/>"
                "</a><br/>SkyTruth Custom Alert Feed</h1>"
                "<h2>Confirmation Needed</h2>"
                '<table><tr><td valign="top">'
                "<p>"
                "You are receiving this email beacuse you requested to be "
                'notified by email whenever new '
                '<a href="http;//alerts.skytruth.org">SkyTruth Alerts</a> '
                "are published in this geographical area.</p>"
                "<p>To confirm your subscription email address and begin "
                "receiving email updates, please click the link below</p>"
                '<h2><a href="$confirm_url">Confirm</a></h2>'
                "<p>If you do not wish to receive any more emails, then "
                "simply ignore this message and no further emails will "
                "be sent.</p>"
                "</td>"
                "<td>"
                '<img src="$static_map_url" width = "$static_map_width" '
                'height="$static_map_height"></img>'
                "</td>"
                "</tr></table>"),
        'notice_overflow': Template (
                "<h2><b>NOTE:</b> This subscription has more than "
                "$new_item_count new issues in the last 24 hours.  The email "
                "notification system is limited to a maximum of "
                "$new_item_count incidents per notification, which means "
                "that you are not getting all the incidents that occurred in "
                "your area since the last email.  In order to get the best "
                "use from the SkyTruth Alerts system, you may want to create "
                "a new subscription with a smaller geographic focus. </h2>"),
        }
        return templates


    def get_text_templates (self):

        templates = {
        'header' : Template(
                "\n"
                "The following SkyTruth Alerts incidents have been reported "
                "in your selected geographical area since the last update was "
                "sent."
                "\n"),
        'message' : Template(
                "\n"
                "$message_text"
                "\n"),
        'footer' : Template(
                "\n"
                "\n"
                "-----------------------------------------------------"
                "\n"
                "SkyTruth Custom Alert Feed - alerts.skytruth.org"
                "\n"
                "You have received this email because you are subscribed to "
                "a custom feed from SkyTruth Alerts"
                "\n"
                "To Unsubscribe from this feed, copy this url and paste it "
                "into your web browser:"
                "\n"
                "$unsubscribe_url"),
        'body' : Template(
                "\n"
                "$header"
                "\n"
                "$notices"
                "\n"
                "$items"
                "\n\n"
                "$footer"
                "\n"),
        'item' : Template(
                "\n"
                "$title"
                "\n\n"
                "$summary"
                "\n\n"
                "Tags: $tags"
                "\n"),
        'confirm' : Template(
                "\n"
                "Confirmation Needed"
                "\n\n"
                "You are receiving this email beacuse you requested to be "
                "notified by email whenever new SkyTruth Alerts are published "
                "in your selected geographical area."
                "\n\n"
                "To confirm your subscription email address and begin "
                "receiving email updates, please copy the link below and "
                "paste it into your web browser:"
                "\n\n"
                "$confirm_url"
                "\n\n"
                "If you do not wish to receive any more emails, then "
                "simply ignore this message and no further emails will be "
                "sent."
                "\n"),
        'notice_overflow': Template (
                "\n"
                "NOTE: This subscription has more than "
                "$new_item_count new "
                "issues in the last 24 hours.  The email notification system "
                "is limited to a maximum of "
                "$new_item_count incidents per "
                "notification, which means that you are not getting all the "
                "incidents that occurred in your area since the last email.  "
                "In order to get the best use from the SkyTruth Alerts "
                "system, you may want to create a new subscription with a "
                "smaller geographic focus."
                "\n"),
        }
        return templates

