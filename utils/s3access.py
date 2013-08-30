# -*- coding: utf-8 -*-
"""
Created on Wed Aug 28 11:04:48 2013

@author: Craig
"""

# standard modules
import os.path
import logging
import zipfile
from zipfile import ZipFile

# site modules
from boto.s3.connection import S3Connection
from boto.s3.key import Key as S3Key

# local modules

# CONSTANTS


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

