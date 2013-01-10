# Scrapy settings for nrc project
#
# For simplicity, this file contains only the most important settings by
# default. All the other settings are documented here:
#
#     http://doc.scrapy.org/topics/settings.html
#

BOT_NAME = 'skytruth'
#BOT_VERSION = '1.0.3'

LOG_LEVEL = 'INFO'

SPIDER_MODULES = ['nrc.spiders']
NEWSPIDER_MODULE = 'nrc.spiders'
DEFAULT_ITEM_CLASS = 'nrc.items.NrcScrapedReport'
#USER_AGENT = '%s/%s' % (BOT_NAME, BOT_VERSION)
USER_AGENT = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.75 Safari/537.1'
ITEM_PIPELINES = [
    'nrc.pipelines.NrcDatabasePipeline'
]

DOWNLOADER_MIDDLEWARES = {
    'nrc.middlewares.CustomCookiesMiddleware': 700,
    'scrapy.contrib.downloadermiddleware.cookies.CookiesMiddleware': None,
    'scrapy.contrib.downloadermiddleware.httpauth.HttpAuthMiddleware': None,
}

#CONCURRENT_REQUESTS_PER_SPIDER = 1
CONCURRENT_REQUESTS_PER_DOMAIN = 1
DOWNLOAD_DELAY = .5
RANDOMIZE_DOWNLOAD_DELAY = True

DB_HOST = 'localhost'
DB_USER = 'scraper'
DB_PASS = 'password'        ## CHANGE
DB_DATABASE = 'scraper_db'

GEO_DB_HOST = 'localhost'
GEO_DB_USER = 'scraper'
GEO_DB_PASS = 'password'    ## CHANGE
GEO_DB_DATABASE = 'scraper_db'  

GOOGLE_MAPS_API_KEY = 'NOT-SURE-WE-NEED-THIS'       ## CHANGE?

MAIL_FROM = 'skytruthalerts@gmail.com'
MAIL_HOST = 'smtp.gmail.com'
MAIL_PORT = 587
MAIL_USER = 'skytruthalerts@gmail.com'
MAIL_PASS = 'password'     ## CHANGE
MAIL_TO = 'paul@skytruth.org'

FUSION_TABLE_USER ='data@skytruth.org'
FUSION_TABLE_PASS = 'password'  ## CHANGE
