#BotMonitor

import re

from scrapy.spider import BaseSpider
from scrapy import log

from nrc.database import NrcDatabase
from nrc.NrcBot import NrcBot
from nrc import settings

from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText


class BotMonitorReport():
    def __init__(self):
        self.report = {}
        
    def insert_stat (self, bot, status, interval, value):
        if not self.report.get(bot):
            self.report[bot] = {}
        if not self.report[bot].get(status):
            self.report[bot][status] = {}
        self.report[bot][status][interval] = value
        

class BotMonitor(NrcBot):
    name = 'BotMonitor'
        
    def process_item(self, task_id):

        report = BotMonitorReport ()
        if 0 == self.get_summary_stats (report, 1):
            # detect 0 bot activity in the last day
            self.send_alert ('WARNING: No Bot Activity for any bots in the last 24 hours')
        self.get_summary_stats (report, 7)
        self.get_summary_stats (report, 30)
        
        header = 'Bot Name\tStatus\t1d\t7d\t30d'
        text_lines = [header]
        html_lines = ["<tr><th>%s</th></tr>" % header.replace('\t', '</th><th>')]
        
        for bot in sorted(report.report.keys()):
            for status, status_stats in report.report[bot].items():
                day = status_stats.get(1,0)
                week = status_stats.get(7,0)
                month = status_stats.get(30,0)
                
                if 0 == week and month > 0 and status in ('DONE','NEW'):    
                    # detect 0 for any bot in the last week
                    self.send_alert ('WARNING: No %s activity for bot %s in the last week' % (status, bot))
                
                line = '%s\t%s\t%s\t%s\t%s' % (bot, status, day, round(week/7.0,2), round(month/30.0,2))
                
                text_lines.append(line)
                html_lines.append("<tr><td>%s</td></tr>" % line.replace('\t','</td><td>'))

        html_message = "<table>%s</table>" % "".join(html_lines)
        text_message = "\n".join(text_lines)

        msg = MIMEMultipart('alternative')
        msg['Subject'] = '[BotMonitor] Daily Bot Status Update'
        msg['From'] = settings.MAIL_FROM
        msg['To'] = settings.MAIL_TO
        
        msg.attach(MIMEText(text_message, 'plain'))
        msg.attach(MIMEText(html_message, 'html'))

        self.log('sending bot status email to %s' % (msg['To']), log.INFO)

        self.log(text_message, log.INFO)
            
        self.send_email (msg['From'], msg['To'], msg)
        
        
        yield

    def get_summary_stats (self, report, interval):
        items = self.db.getBotTaskStatusSummary (interval)
        for item in items:
            report.insert_stat(item['bot'], item['status'], interval, item['count'])
        return len(items)
        