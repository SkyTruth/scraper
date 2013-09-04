# -*- coding: utf-8 -*-
"""
Created on Wed Aug 28 11:04:21 2013

@author: Craig
"""

# standard modules
import logging
import pprint
import types

# site modules
import psycopg2
psycopg2.extensions.register_type(psycopg2.extensions.UNICODE)
psycopg2.extensions.register_type(psycopg2.extensions.UNICODEARRAY)

# local modules

# CONSTANTS


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
        c = self.db.cursor()
        c.execute(sql)

        # Write header followed by data rows
        fp.write('\t'.join([desc[0] for desc in c.description]) + '\n')
        rec = c.fetchone()
        while rec:
            fp.write((u'\t'.join([unicode(x) for x in rec]) + '\n')
                     .encode('utf-8'))
            rec = c.fetchone()
        logging.debug("query extracted for CKAN storage:{}."
                     .format(pprint.pformat(sql)))

    def table_to_tsv(self, tablename, fp, columns='*'):
        if not isinstance(columns, types.StringType):
            columns = ','.join(columns)
        sql = 'SELECT %s FROM "%s";' % (columns, tablename)
        self.query_to_tsv(sql, fp, columns)

    def get_table_primarykey(self, tablenm):
        sql = """\
        SELECT
        c.column_name
        FROM information_schema.table_constraints tc
            JOIN information_schema.constraint_column_usage AS ccu
                USING (constraint_schema, constraint_name)
            JOIN information_schema.columns AS c
                ON c.table_schema = tc.constraint_schema
                    AND tc.table_name = c.table_name
                    AND ccu.column_name = c.column_name
        WHERE constraint_type = 'PRIMARY KEY' and tc.table_name = '{}';
        """.format(tablenm)
        c = self.db.cursor()
        c.execute(sql)

        pks = []
        rec = c.fetchone()
        while rec:
            pks.append(rec[0])
            rec = c.fetchone()
        return pks

    def get_table_fields(self, tablenm, exclude_fields=(), include_fields=()):
        # return an ordered list of tuples [(name, type), ...]
        sql = ("select column_name, data_type from information_schema.columns "
               "where table_name = '{}' "
               "order by ordinal_position; ".format(tablenm))
        c = self.db.cursor()
        c.execute(sql)

        fields = []
        rec = c.fetchone()
        while rec:
            field_nm, field_type = rec
            if not ((field_nm in exclude_fields) or
                    (include_fields and field_nm not in include_fields)):
                fields.append((field_nm, field_type))
            rec = c.fetchone()
        logging.debug("fields: %s"%(fields,))
        return fields
