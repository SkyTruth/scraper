from scrapy.http.cookies import CookieJar
from scrapy.contrib.downloadermiddleware.cookies import CookiesMiddleware

class CustomCookiesMiddleware(CookiesMiddleware):

    def process_request(self, request, spider):
        if 'dont_merge_cookies' in request.meta:
            return

        cookiejarkey = request.meta.get("cookiejar", spider)
#        print "CustomCookiesMiddleware.process_request  cookiejarkey=%s"%cookiejarkey
        jar = self.jars[cookiejarkey]
        cookies = self._get_request_cookies(jar, request)
        for cookie in cookies:
            jar.set_cookie_if_ok(cookie, request)

        # set Cookie header
        request.headers.pop('Cookie', None)
        jar.add_cookie_header(request)
        self._debug_cookie(request, spider)

    def process_response(self, request, response, spider):
        if 'dont_merge_cookies' in request.meta:
            return response

        cookiejarkey = request.meta.get("cookiejar", spider)

#        print "CustomCookiesMiddleware.process_response  cookiejarkey=%s"%cookiejarkey

        # extract cookies from Set-Cookie and drop invalid/expired cookies
        jar = self.jars[cookiejarkey]
        jar.extract_cookies(response, request)
        self._debug_set_cookie(response, spider)

        return response

# copied from version 0.15
#    def process_request(self, request, spider):
#        if 'dont_merge_cookies' in request.meta:
#            return
#
#        cookiejarkey = request.meta.get("cookiejar")
#        jar = self.jars[cookiejarkey]
#        cookies = self._get_request_cookies(jar, request)
#        for cookie in cookies:
#            jar.set_cookie_if_ok(cookie, request)
#
#        # set Cookie header
#        request.headers.pop('Cookie', None)
#        jar.add_cookie_header(request)
#        self._debug_cookie(request, spider)
