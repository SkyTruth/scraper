# Mail sender that use TLS

from cStringIO import StringIO
from twisted.internet import defer, reactor
from twisted.mail.smtp import ESMTPSenderFactory


from scrapy.mail import MailSender    

class TLSMailSender(MailSender):
    
    def _sendmail(self, to_addrs, msg):
        msg = StringIO(msg)
        d = defer.Deferred()
        factory = ESMTPSenderFactory(self.smtpuser, self.smtppass, self.mailfrom, \
            to_addrs, msg, d, heloFallback=True, requireAuthentication=False, \
            requireTransportSecurity=True)
        factory.noisy = False
        reactor.connectTCP(self.smtphost, self.smtpport, factory)
        return d
