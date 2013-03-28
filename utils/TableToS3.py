# -*- coding: utf-8 -*-
"""
Created on Fri Jan 18 11:01:33 2013

@author: Craig
"""

# standard modules
import logging
import os.path
import argparse
import tempfile
import zipfile
import shutil

# site modules
#import MySQLdb
import psycopg2
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

    def table_to_tsv(self, tablename, fp, columns='*'):
        sql = 'SELECT %s FROM "%s"' % (columns, tablename)
        c = self.db.cursor()
        c.execute(sql)
        table_recs = c.fetchall ()

        # Write header
        fp.write('\t'.join([desc[0] for desc in c.description]) + '\n')
        for rec in table_recs:
            fp.write('\t'.join([str(x) for x in rec]) + '\n')
        logging.info("Table %s extracted for S3 storage."%(tablename,))

class S3access(object):
    def __init__(self, aws_access, aws_secret):
        self.conn = S3Connection(aws_access, aws_secret)
        if self.conn is None:
            raise RuntimeError("AWS connection failed")

        logging.info ("Connected to AWS through %s."%(aws_access,))

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
            k.set_contents_from_filename(fpath, reduced_redundancy=True)
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

def _parse_args():
    parser = argparse.ArgumentParser(
            description=\
"""\
TableToS3 transfers the contents of a database table to a file in an S3 bucket.
Data columns are separated by tabs.  The file may be zipped (default).
Database and authentication are configured in the script file.
""")
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
                        help='set the S3 data to be publically readable')
    parser.add_argument('--public-write','-w',
                        dest='public_write',
                        action='store_true',
                        default=False,
                        help='set the S3 data to be publically writable '
                             '(implies public-read). '
                             'If neither public-read nor public-write are set '
                             'the S3 data is private.')
    parser.add_argument('tablename',
                        metavar='TABLENAME',
                        help='The name of the database table to store')
    args = parser.parse_args()
    return args


def main():
    logging.basicConfig(level=logging.INFO)
    args = _parse_args()
    logging.debug("args: %s"%(args,))
    if args.compress is None:
        args.compress = True
    if args.bucketname is None:
        args.bucketname = S3_BUCKET
    if args.public_write:
        public = 'W'
    elif args.public_read:
        public = 'R'
    else:
        public = ''

    db = Database(DB_HOST, DB_USER, DB_PASSWD, DB_DATABASE)

    tablename = args.tablename
    bucketname = args.bucketname
    s3name = args.filename
    tmpdir = tempfile.mkdtemp()
    try:
        fpath = os.path.join(tmpdir, tablename+'.txt')
        try:
            fp = open(fpath, "wb")
            db.table_to_tsv(tablename, fp)
        finally:
            fp.close()

        s3 = S3access(S3_ACCESS_KEY, S3_SECRET_KEY)

        if args.compress:
            s3.zip_and_ship_file(fpath, bucketname, s3name, public)
        else:
            s3.ship_file(fpath, bucketname, s3name, public)
    finally:
        shutil.rmtree(tmpdir, ignore_errors=True)

if __name__ == "__main__":
    main()
