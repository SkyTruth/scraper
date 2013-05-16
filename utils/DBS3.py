# -*- coding: utf-8 -*-
"""
Created on Tue Apr 16 11:26:39 2013

@author: Craig
"""


# standard modules
import sys
import logging
import os.path
import argparse
import tempfile
import zipfile
import shutil

# site modules
import psycopg2
psycopg2.extensions.register_type(psycopg2.extensions.UNICODE)
psycopg2.extensions.register_type(psycopg2.extensions.UNICODEARRAY)
from boto.s3.connection import S3Connection
from boto.s3.key import Key as S3Key
from zipfile import ZipFile

# local modules
import settings

# CONSTANTS
S3_ACCESS_KEY = settings.S3_ACCESS_KEY
S3_SECRET_KEY = settings.S3_SECRET_KEY
S3_BUCKET     = settings.S3_BUCKET
DB_HOST       = settings.DB_HOST
DB_USER       = settings.DB_USER
DB_PASSWD     = settings.DB_PASSWD
DB_DATABASE   = settings.DB_DATABASE


class Database(object):
    def __init__(self, host, user, pwd, dbname):
        try:
            self.db = psycopg2.connect (host=host,
                                        user=user,
                                        password=pwd,
                                        database=dbname)
                                        #charset = 'utf8')
            self.db.autocommit = True

            logging.info ("Connected to database %s.%s as user %s."
                    % (host, dbname, user))
        except psycopg2.Error, e:
            self.db = None
            logging.error ("Unable to connect to database: Error %s" % (e,))
            raise

    def close(self):
        self.db.close()

    def submitSQL(self, sql):
        c = self.db.cursor()
        c.execute(sql)
        return c

    def query_to_tsv(self, sql, fp, columns='*'):
        #sql = 'SELECT %s FROM "%s"' % (columns, tablename)
        c = self.db.cursor()
        c.execute(sql)
        #query_recs = c.fetchall ()

        # Write header followed by data rows
        fp.write('\t'.join([desc[0] for desc in c.description]) + '\n')
        #for rec in query_recs:
        rec = c.fetchone()
        while rec:
            fp.write('\t'.join([str(x) for x in rec]) + '\n')
            rec = c.fetchone()
        logging.info("query extracted for S3 storage:%s."%(sql,))

    def table_to_tsv(self, tablename, fp, columns='*'):
        sql = 'SELECT %s FROM "%s"' % (columns, tablename)
        self.query_to_tsv(sql, fp, columns)

class S3access(object):
    def __init__(self, aws_access, aws_secret):
        self.conn = S3Connection(aws_access, aws_secret)
        if self.conn is None:
            raise RuntimeError("AWS connection failed")

        logging.info ("Connected to AWS through %s."%(aws_access,))

    def close(self):
        self.conn.close()

    def ship_file(self, fpath, bucketnm, s3name=None, public=None):
        if s3name is None:
            s3name = os.path.basename(fpath)

        # set access control
        if public is None or public == '':
            acl = 'private'
        elif public.upper() == 'R':
            acl = 'public-read'
        elif public.upper() == 'W':
            acl = 'public-read-write'
        else:
            logging.warn(
                    "Unrecognized access code '%s'; setting private access."
                    %(public,))
            acl = 'private'

        try:
            bucket = self.conn.lookup(bucketnm)
            k = S3Key(bucket)
            k.key = s3name
            k.set_contents_from_filename(fpath,
                                         reduced_redundancy=True,
                                         policy=acl)
            k.set_acl(acl)
        except Exception:
            logging.error (
                    "S3 connection failed; check AWS access code and password")
            raise

        logging.info ("S3 file '%s' stored as %s."%(s3name, acl))

    def zip_and_ship_file(self, fpath, bucketnm, s3name=None, public=None):
        zfpath = fpath + '.zip'
        zfile = ZipFile(zfpath, 'w', zipfile.ZIP_DEFLATED)
        try:
            zfile.write(fpath, os.path.basename(fpath))
        finally:
            zfile.close()

        self.ship_file(zfpath, bucketnm, s3name, public)

class DBS3_session(object):
    def __init__(self):
        self._argparser = None
        self._db = None
        self._s3 = None
        self._tempdir = None

    def close(self):
        if self._tempdir:
            shutil.rmtree(self._tempdir, ignore_errors=True)
        if self._s3:
            self._s3.close()
        if self._db:
            self._db.close()

    @property
    def argparser(self):
        if self._argparser is None:
            self._argparser = self._get_s3_argparser()
        return self._argparser

    @property
    def db(self):
        if self._db is None:
            self._db = Database(DB_HOST, DB_USER, DB_PASSWD, DB_DATABASE)
        return self._db

    @property
    def s3(self):
        if self._s3 is None:
            self._s3 = S3access(S3_ACCESS_KEY, S3_SECRET_KEY)
        return self._s3

    @property
    def tempdir(self):
        if self._tempdir is None:
            self._tempdir = tempfile.mkdtemp()
        return self._tempdir

    def parse_args(self, argv=None, parser=None):
        if argv is None:
            argv = sys.argv[1:]
        if parser is None:
            parser = self._argparser

        args = parser.parse_args(argv)

        if args.compress is None:
            args.compress = True
        if args.bucketname is None:
            args.bucketname = S3_BUCKET
        if args.public_write:
            args.public = 'W'
        elif args.public_read:
            args.public = 'R'
        else:
            args.public = ''

        return args

    def table_to_file(self, tablename):
        fpath = os.path.join(self.tempdir, tablename+'.txt')
        try:
            fp = open(fpath, "wb")
            self.db.table_to_tsv(tablename, fp)
        finally:
            fp.close()
        return fpath

    def query_to_file(self, query, name):
        fpath = os.path.join(self.tempdir, name+'.txt')
        try:
            fp = open(fpath, "wb")
            self.db.query_to_tsv(query, fp)
        finally:
            fp.close()
        return fpath

    def ship_file(self, fpath, compress, bucketname, s3name, public):
        if compress:
            self.s3.zip_and_ship_file(fpath, bucketname, s3name, public)
        else:
            self.s3.ship_file(fpath, bucketname, s3name, public)

    def submitSQL(self, sql):
        return self.db.submitSQL(sql)

    def _get_s3_argparser(self):
        parser = argparse.ArgumentParser(
                description=
                'DBtoS3 transfers the contents of a database query to a file '
                'in an S3 bucket.  Data columns are separated by tabs.  The '
                'file may be zipped (default).  Database and authentication '
                'are configured in the script file.')

        parser.add_argument('-v',
                            dest='verbose',
                            action='store_true',
                            default=False,
                            help='Enables debug output to log')
        parser.add_argument('--compress', '-c',
                            dest='compress',
                            action='store_true',
                            default=True,
                            help='Store the data as a zip-compressed text file')
        parser.add_argument('--uncompress', '-u',
                            dest='compress',
                            action='store_false',
                            default=True,
                            help='Store the data as an uncompressed text file')
        parser.add_argument('--bucket', '-b',
                            dest='bucketname',
                            metavar='BUCKET',
                            help='The name of the S3 bucket to store the data')
        parser.add_argument('--filename', '-f',
                            dest='filename',
                            metavar='FILENAME',
                            help='Name the output file FILENAME. '
                                 'defaults to TABLENAME.txt[.zip]')
        parser.add_argument('--public-read','-r',
                            dest='public_read',
                            action='store_true',
                            default=False,
                            help='Set the S3 data to be publically readable')
        parser.add_argument('--public-write','-w',
                            dest='public_write',
                            action='store_true',
                            default=False,
                            help='Set the S3 data to be publically writable '
                                 '(implies public-read). '
                                 'If neither public-read nor public-write '
                                 'are set the S3 data is private.')
        return parser

