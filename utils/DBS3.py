# -*- coding: utf-8 -*-
"""
Created on Tue Apr 16 11:26:39 2013

@author: Craig
"""


# standard modules
import sys
import os.path
import argparse
import tempfile
import shutil

# site modules

# local modules
from database import Database
from s3access import S3access
import settings

# CONSTANTS
S3_ACCESS_KEY = settings.S3_ACCESS_KEY
S3_SECRET_KEY = settings.S3_SECRET_KEY
S3_BUCKET     = settings.S3_BUCKET
DB_HOST       = settings.DB_HOST
DB_USER       = settings.DB_USER
DB_PASSWD     = settings.DB_PASSWD
DB_DATABASE   = settings.DB_DATABASE


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

