
import StringIO
from datetime import datetime

from scrapy import signals

from nrc import settings


class FailLogger(object):

    @classmethod
    def from_crawler(cls, crawler):
        ext = cls()
        crawler.signals.connect(ext.spider_error, signal=signals.spider_error)
        crawler.signals.connect(ext.spider_close, signal=signals.spider_closed)
        return ext

    def spider_error(self, failure, response, spider):
        spider.exception_count += 1
        if spider.exception_count == 1:
            # email on first exception
            temp = StringIO.StringIO()
            temp.write("Uncaught exception from {0}:\n\t{1}\n\n"
                       .format(spider.name, failure.getErrorMessage()))
            failure.printTraceback(file=temp)

            message = temp.getvalue()
            self.send_error_email (spider, message, failure)
            temp.close()

    def spider_close(self, spider, reason):
        if spider.exception_count > 1:
            message = ("Total of %s uncaught exceptions in %s execution."
                       % (spider.exception_count, spider.name))
            self.send_alert (spider, message)


    @staticmethod
    def send_error_email (spider, message, failure=None):
        if failure:
            subject = '%s Exception: %s' % spider.name, failure.getErrorMessage
        else:
            subject = '%s: %s Exceptions' % spider.name, spider.exception_count
        spider.log ('Sending alert:\n\t%s'  % (subject,), log.ERROR)

        senddate = datetime.strftime(datetime.now(), '%Y-%m-%d')
        header = ("Date: %s\r\nFrom: %s\r\nTo: %s\r\nSubject: %s\r\n\r\n"
                  % (senddate, settings.MAIL_FROM, settings.MAIL_TO, subject)

        server = smtplib.SMTP('%s:%s'
                              % (settings.MAIL_HOST, settings.MAIL_PORT))
        server.starttls()
        server.login(settings.MAIL_USER, settings.MAIL_PASS)
        server.sendmail(settings.MAIL_FROM, settings.MAIL_TO, header+message)
        server.quit()

