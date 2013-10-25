# class GeoDatabase
# encapsulates the database connection

import psycopg2
psycopg2.extensions.register_type(psycopg2.extensions.UNICODE)
psycopg2.extensions.register_type(psycopg2.extensions.UNICODEARRAY)
from psycopg2.extras import RealDictCursor, register_uuid

from scrapy import log, exceptions

from nrc import settings


class GeoDatabase(object):
    def __init__(self):
        self.host = settings.GEO_DB_HOST
        self.user = settings.GEO_DB_USER
        self.passwd = settings.GEO_DB_PASS
        self.dbname = settings.GEO_DB_DATABASE
        self.db = None
        psycopg2.extras.register_uuid()

    def connect (self):
        try:
            self.db = psycopg2.connect (
                host = self.host,
                user = self.user,
                password = self.passwd,
                database = self.dbname
                )
            self.db.autocommit = True
#	    self.db.set_client_encoding ('UTF8')
            log.msg ("Connected to database %s as %s using database %s" %
                (self.host, self.user, self.dbname), level=log.INFO)
        except psycopg2.Error, e:
            self.db = None
            log.msg ("Unable to connect to database: Error %d: %s" %
                (e.args[0], e.args[1]), level=log.ERROR)
            raise

    def test (self):
        cur = self.db.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
        cur.execute ("SELECT 123 as ABC, 456 as DEF")
        rec = cur.fetchone ()
        return rec

    def getRegions(self, lat, lng):
        # TODO: implement me!

        cur = self.db.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
        cur.execute ("SELECT 123 as ABC, 456 as DEF")
        rec = cur.fetchone ()
        return rec

    def getRegionBoundary(self, region_code):
        sql = "select ST_AsText(simple_geom) as poly from region where code = '%s'" % region_code;
        cur = self.db.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
        cur.execute (sql)
        rec = cur.fetchone ()
        return rec

    def feedentryExists(self, feedentry_id):
        sql = "SELECT id FROM feedentry WHERE id='%s'"%(feedentry_id,)
        cur = self.db.cursor()
        cur.execute (sql)
        return cur.rowcount > 0

    def storeItem (self, item):
        table_name = item.__class__.__name__

        if table_name == 'FeedEntryTag':
            tag = item['tag']
            sql = "UPDATE feedentry set tags = array_append(tags, %s) where id = %s and (tags is null or %s != ALL(tags))"
            values = (item['tag'], str(item['feed_entry_id']), item['tag'])

        else:
            key_str = ','.join(item.keys())
            value_str = ('%s,' * len(item.values()))[:-1]

            sql = "INSERT INTO %s (%s) VALUES (%s)" % (table_name.lower(), key_str, value_str)
            values = item.values()

        c = self.db.cursor()
        try:
            c.execute (sql, values)
        except:
            log.msg ("GeoDatabase.storeItem error: %s"
                     % c.mogrify(sql, values),
                     level=log.INFO)
            raise
        return c.rowcount

    def transformCoords (self, x, y, from_srid, to_srid):
        sql = "select ST_X(ST_Transform(ST_SetSRID(ST_Point(%s,%s),%s),%s)) as x, ST_Y(ST_Transform(ST_SetSRID(ST_Point(%s,%s),%s),%s)) as y"
        params = [x, y, from_srid, to_srid]
        params.extend(params)
        cur = self.db.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
        cur.execute (sql, params)
        rec = cur.fetchone ()
        return rec
