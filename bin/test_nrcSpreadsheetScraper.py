#!/usr/bin/env python


# This document is part of scraper
# https://github.com/SkyTruth/scraper


# =================================================================================== #
#
#  The MIT License (MIT)
#
#  Copyright (c) 2014 SkyTruth
#
#  Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to deal
#  in the Software without restriction, including without limitation the rights
#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#  copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in all
#  copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#  SOFTWARE.
#
# =================================================================================== #


"""Tests"""


from __future__ import division
from __future__ import unicode_literals

import os
from os.path import isfile, basename
from pprint import pprint
import random
import sys
import unittest
import urllib2

import getpass
import nrcSpreadsheetScraper
import psycopg2
from psycopg2 import extras as psycopg2_extras
import xlrd


#/* ======================================================================= */#
#/*     Python setup
#/* ======================================================================= */#

if sys.version[0] is 2:
    range = xrange


#/* ======================================================================= */#
#/*     Global variables
#/* ======================================================================= */#

# Test options
TO = {
    'sheet': 'CALLS',
    'temp_file': '_-Nonsense-TEst_FiLe.xlsx.ext',
    'db_host': 'localhost',
    'db_schema': 'public',
    'db_name': 'test_skytruth',
    'db_user': getpass.getuser(),
    'db_pass': '',
    'field_reportnum': 'reportnum',
    'db_table': '"NrcParsedReport"',
    'dl_url': 'http://cgmix.uscg.mil/NRC/FOIAFiles/Current.xlsx',
    'db_null': 'NULL',
    'test_reportnum': 10101019,
}
_TO_DESCRIPTIONS = {
    'dl_url': 'URL from which Current.xlsx can be downloaded',
    'temp_file': 'Where Current.xlsx will be downloaded',
    'sheet': 'Sheet to use for most tests',
    'db_host': 'Test database hostname',
    'db_name': 'Name of test database',
    'db_schema': 'Name of schema for test database',
    'db_table': 'Name of table for most tests',
    'db_user': 'User for test database',
    'db_pass': 'Password for test database',
    'db_null': 'Value to use for NULL',
    'test_reportnum': 'Report number to use for report specific tests'
}


#/* ======================================================================= */#
#/*     Define setUpModule() function
#/* ======================================================================= */#

def setUpModule():

    global TO

    print("Validating test parameters ...")

    # Make sure the DB parameters are correct and that the test table is empty
    print("  Database")
    db_connection_string = "host='%s' dbname='%s' user='%s' password='%s'" \
                           % (TO['db_host'], TO['db_name'],
                              TO['db_user'], TO['db_pass'])
    connection = psycopg2.connect(db_connection_string)
    cursor = connection.cursor()
    query = """SELECT COUNT(1) FROM %s.%s;""" % (TO['db_schema'], TO['db_table'])
    cursor.execute(query)
    result = int(cursor.fetchall()[0][0])
    if result > 0:
        cursor.close()
        connection.close()
        raise IOError("ERROR: DB table is not empty: %s.%s" % (TO['db_schema'], TO['db_table']))
    cursor.close()
    connection.close()

    # Make sure the temp file doesn't exist - download unless explicitly specified not to
    print("  Getting test data")
    if isfile(TO['temp_file']):
        raise IOError("ERROR: Temp file already exists: %s" % TO['temp_file'])
    response = urllib2.urlopen(TO['dl_url'])
    with open(TO['temp_file'], 'w') as f:
        f.write(response.read())

    # Make sure required test file and sheet exist and can be read
    with xlrd.open_workbook(TO['temp_file']) as workbook:
        sheet = workbook.sheet_by_name(TO['sheet'])

    print("Running tests ...")


#/* ======================================================================= */#
#/*     Define tearDownModule() function
#/* ======================================================================= */#

def tearDownModule():

    global TO

    if isfile(TO['temp_file']):
        os.remove(TO['temp_file'])


#/* ======================================================================= */#
#/*     Define TestDMS2DD() class
#/* ======================================================================= */#

class TestDMS2DD(unittest.TestCase):

    def test_standard(self):

        """
        Test standard use-case
        """

        # Degrees, minutes, seconds, quadrant
        for test_input in ([29, 23, 23, 'N'], [89, 14, 29, 'W']):
            d, m, s, q = test_input
            q = q.lower()
            expected = d + m / 60 + s / 3600
            if q in ('s', 'w'):
                expected *= -1
            actual = nrcSpreadsheetScraper.dms2dd(*test_input)
            self.assertEqual(expected, actual)


#/* ======================================================================= */#
#/*     Define TestColumnNames() class
#/* ======================================================================= */#

class TestColumnNames(unittest.TestCase):

    def test_standard(self):

        """
        Test standard use-case
        """

        global TO

        with xlrd.open_workbook(TO['temp_file']) as workbook:
            sheet = workbook.sheet_by_name('CALLS')
            expected = [i.value for i in sheet.row(0)]
            actual = nrcSpreadsheetScraper.column_names(sheet)
            self.assertEqual(expected, actual)


#/* ======================================================================= */#
#/*     Define TestSheet2Dict() class
#/* ======================================================================= */#

class TestSheet2Dict(unittest.TestCase):

    def test_standard(self):

        """
        Test standard use-case
        """

        global TO

        with xlrd.open_workbook(TO['temp_file']) as workbook:

            all_expected = []
            sheet = workbook.sheet_by_name(TO['sheet'])
            sheet_dict = nrcSpreadsheetScraper.sheet2dict(sheet)

            # Validate sheet
            column_names = [i.value for i in sheet.row(0)]

            # Get one row structured as a dictionary
            row_num = 0
            for row_dict in sheet_dict:

                # Move one row down the sheet
                # Note that the very first row is skipped
                row_num += 1

                # Assemble the expected row content
                expected = {}
                for column_index, column_name in enumerate(column_names):
                    cell = sheet.cell(row_num, column_index)
                    expected[column_name] = cell.value

                # Run test
                self.assertDictEqual(expected, row_dict)

                # Append for final test
                all_expected.append(expected)

            self.assertListEqual(all_expected, sheet_dict)


#/* ======================================================================= */#
#/*     Define TestReportExists() class
#/* ======================================================================= */#

class TestReportExists(unittest.TestCase):

    def test_standard(self):

        """
        Test standard use-case
        """

        global TO

        test_report_number = TO['test_reportnum']

        db_connection_string = "host='%s' dbname='%s' user='%s' password='%s'" \
                       % (TO['db_host'], TO['db_name'],
                          TO['db_user'], TO['db_pass'])

        db_conn = psycopg2.connect(db_connection_string)
        db_cursor = db_conn.cursor(cursor_factory=psycopg2_extras.DictCursor)

        # Check to see if the report number is already in the table
        query = """SELECT %s FROM %s.%s WHERE %s = %s;""" \
                % (TO['field_reportnum'], TO['db_schema'], TO['db_table'], TO['field_reportnum'], test_report_number)
        db_cursor.execute(query)
        self.assertEqual(0, db_cursor.rowcount, "ERROR: Test %s %s is already in table"
                         % (TO['field_reportnum'], test_report_number))

        # Only perform the actual test if the test report was not found
        if db_cursor.rowcount is 0:

            # Insert the value in order to test the function
            query = """INSERT INTO %s.%s (%s) VALUES (%s);""" \
                    % (TO['db_schema'], TO['db_table'], TO['field_reportnum'], test_report_number)
            db_cursor.execute(query)
            self.assertTrue(nrcSpreadsheetScraper.report_exists(reportnum=test_report_number, db_cursor=db_cursor,
                                                                table=TO['db_table'], schema=TO['db_schema'],
                                                                field=TO['field_reportnum']))

            # Delete the value - safe it was just inserted
            query = """DELETE FROM %s.%s WHERE %s = %s;""" \
                    % (TO['db_schema'], TO['db_table'], TO['field_reportnum'], test_report_number)
            db_cursor.execute(query)

            # Close the connection
            db_cursor.close()
            db_conn.close()


#/* ======================================================================= */#
#/*     Define TestTimeStamp2DateTime() class
#/* ======================================================================= */#

class TestTimeStamp2DateTime(unittest.TestCase):

    def test_standard(self):

        global TO

        test_stamp = 41640.14775462963
        actual = nrcSpreadsheetScraper.timestamp2datetime(test_stamp, 0)
        expected = '2014-01-01 03:32:46'
        self.assertEqual(expected, actual)


#/* ======================================================================= */#
#/*     Define TestTimestamp2datetime() class
#/* ======================================================================= */#

class TestDownload(unittest.TestCase):

    def setUp(self):

        global TO

        # The sample file was downloaded in the setUpModule() function, but the method being tested
        # in this class the exact same thing, so the test file needs to be deleted and re-downloaded
        if isfile(TO['temp_file']):
            os.remove(TO['temp_file'])

    def test_standard(self):

        """
        Test standard use-case
        """

        global TO

        test_url = TO['dl_url']
        target_file = TO['temp_file']

        # Make sure invalid URL's fail
        self.assertRaises(ValueError, nrcSpreadsheetScraper.download, *['asdf', target_file], **{'overwrite': False})

        # Standard test
        self.assertEqual(target_file, nrcSpreadsheetScraper.download(test_url, target_file))

    def test_overwrite(self):

        """
        Test overwriting an existing file
        """

        global TO

        # Create an empty test file to see if an exception is raised when the target file exists and overwrite=False
        with open(TO['temp_file'], 'w') as f:
            f.write(str(''))
        self.assertRaises(ValueError, nrcSpreadsheetScraper.download,
                          *[TO['dl_url'], TO['temp_file']], **{'overwrite': False})

        # Make sure file is still empty and nothing was downloaded
        self.assertTrue(os.path.getsize(TO['temp_file']) == 0)

        # Download file
        self.assertEqual(TO['temp_file'], nrcSpreadsheetScraper.download(TO['dl_url'], TO['temp_file'], overwrite=True))


#/* ======================================================================= */#
#/*     Define TestNameCurrentFile() class
#/* ======================================================================= */#

class TestNameCurrentFile(unittest.TestCase):

    def test_standard(self):

        """
        Test standard use-case
        """

        global TO

        original = TO['temp_file']
        result = nrcSpreadsheetScraper.name_current_file(basename(original))

        self.assertTrue(isinstance(result, str) or isinstance(result, unicode))
        self.assertNotEqual(original, result)


#/* ======================================================================= */#
#/*     Define TestDRRowCount() class
#/* ======================================================================= */#

class TestDBRowCount(unittest.TestCase):

    def test_standard(self):

        """
        Test standard use-case
        """
        
        global TO

        # Connect to the DB
        db_connection_string = "host='%s' dbname='%s' user='%s' password='%s'" \
                               % (TO['db_host'], TO['db_name'], TO['db_user'], TO['db_pass'])
        db_conn = psycopg2.connect(db_connection_string)
        db_cursor = db_conn.cursor()
        
        # Make sure the table being tested is empty
        expected = 0
        select_count_query = """SELECT COUNT(1) FROM %s.%s;""" % (TO['db_schema'], TO['db_table'])
        db_cursor.execute(select_count_query)
        actual = db_cursor.fetchall()[0][0]
        self.assertEqual(expected, actual)

        # Make sure that the function is also showing a count of 0
        expected = 0
        actual = nrcSpreadsheetScraper.db_row_count(db_cursor, "%s.%s" % (TO['db_schema'], TO['db_table']))
        self.assertEqual(expected, actual)

        # Insert a row and make sure the function sees it
        insert_query = """INSERT INTO %s.%s (%s) VALUES (%s);""" \
                       % (TO['db_schema'], TO['db_table'], TO['field_reportnum'], TO['test_reportnum'])
        db_cursor.execute(insert_query)
        db_cursor.execute(select_count_query)
        expected = db_cursor.fetchall()[0][0]
        actual = nrcSpreadsheetScraper.db_row_count(db_cursor, "%s.%s" % (TO['db_schema'], TO['db_table']))
        self.assertEqual(expected, actual)

        # Delete the value - safe it was just inserted
        delete_query = """DELETE FROM %s.%s WHERE %s = %s;""" \
                       % (TO['db_schema'], TO['db_table'], TO['field_reportnum'], TO['test_reportnum'])
        db_cursor.execute(delete_query)

        # Close DB connection
        db_cursor.close()
        db_conn.close()


#/* ======================================================================= */#
#/*     Define TestNrcScrapedReportFields() class                           */#
#/* ======================================================================= */#

class TestNrcScrapedReportFields(unittest.TestCase):

    #/* ----------------------------------------------------------------------- */#
    #/*     Define test_material_name() method
    #/* ----------------------------------------------------------------------- */#

    def test_material_name(self):

        """
        This test only confirms the appropriate number of rows and reportnums
        are inserted into the target table.  It's also pretty ugly ...
        """

        global TO

        #
        # TO = {
        #     'sheet': 'CALLS',
        #     'temp_file': '_-Nonsense-TEst_FiLe.xlsx.ext',
        #     'db_host': 'localhost',
        #     'db_schema': 'public',
        #     'db_name': 'test_skytruth',
        #     'db_user': getpass.getuser(),
        #     'db_pass': '',
        #     'field_reportnum': 'reportnum',
        #     'db_table': '"NrcParsedReport"',
        #     'dl_url': 'http://cgmix.uscg.mil/NRC/FOIAFiles/Current.xlsx',
        #     'db_null': 'NULL',
        #     'test_reportnum': 10101019,
        # }
        #
        # # Parse arguments
        # map_def = kwargs['map_def']
        # print_queries = kwargs['print_queries']
        # execute_queries = kwargs['execute_queries']
        # extras_field_maps = map_def['processing']['args']['extras_field_maps']
        # db_write_mode = kwargs['db_write_mode']
        # uid = kwargs['uid']
        # sheet_seqnos_field = kwargs['sheet_seqnos_field']
        # db_cursor = kwargs['db_cursor']
        # raw_sheet_cache = kwargs['raw_sheet_cache']
        # db_seqnos_field = kwargs['db_seqnos_field']
        # db_null_value = kwargs['db_null_value']
        # sheet_cache = kwargs['sheet_cache']
        #

        # Don't need to call processing functions so create a pseudo function that doesn't actually do anything
        def processing_placeholder(*args, **kwargs):
            return None

        # Construct needed objects for test
        db_conn_str = "host='%s' dbname='%s' user='%s' password='%s'" % (TO['db_host'], TO['db_name'],
                                                                         TO['db_user'], TO['db_pass'])
        db_conn = psycopg2.connect(db_conn_str)
        db_cursor = db_conn.cursor()
        if not isfile(TO['temp_file']):
            response = urllib2.urlopen(TO['dl_url'])
            with open(TO['temp_file'], 'w') as f:
                f.write(response.read())
        workbook = xlrd.open_workbook(TO['temp_file'])
        print_queries = False
        execute_queries = True
        db_write_mode = 'INSERT INTO'
        uid = 1090442.0
        sheet_seqnos_field = 'SEQNOS'
        db_seqnos_field = 'reportnum'
        sheet_cache = {}
        raw_sheet_cache = {}
        db_null_value = 'NULL'
        for sname in workbook.sheet_names():
            if sname not in sheet_cache:
                try:
                    sheet_dict = nrcSpreadsheetScraper.sheet2dict(workbook.sheet_by_name(sname))
                    raw_sheet_cache[sname] = sheet_dict
                    sheet_cache[sname] = {row[sheet_seqnos_field]: row for row in sheet_dict}
                except IndexError:
                    # Sheet was empty
                    pass
        map_def = {
            'db_table': '"NrcScrapedReport"',
            'db_field': 'material_name',
            'db_schema': 'public',
            'sheet_name': 'MATERIAL_INVOLVED',
            'column': 'NAME_OF_MATERIAL',
            'processing': {
                'function': None,  # Not needed for testing - at this point it has already been called
                'args': {
                    'extras_table': '"NrcScrapedMaterial"',
                    'extras_schema': 'public',
                    'extras_field_maps': {
                        'public."NrcScrapedReport"': [
                            {
                                'db_table': "NrcScrapedMaterial",
                                'db_field': 'reportnum',
                                'db_schema': 'public',
                                'sheet_name': 'MATERIAL_INVOLVED',
                                'column': 'SEQNOS',
                                'processing': None
                            },
                            {  # NOTE: This is the same as the parent field map but it is required to write the
                               #        specified value to the extras table
                                'db_table': '"NrcScrapedMaterial"',
                                'db_field': 'name',
                                'db_field_width': 32,
                                'db_schema': 'public',
                                'sheet_name': 'MATERIAL_INVOLVED',
                                'column': 'NAME_OF_MATERIAL',
                                'processing': None
                            },
                            {
                                'db_table': "NrcScrapedMaterial",
                                'db_field': 'reached_water',
                                'db_schema': 'public',
                                'sheet_name': 'MATERIAL_INVOLVED',
                                'column': 'IF_REACHED_WATER',
                                'processing': None
                            },
                            {
                                'db_table': '"NrcScrapedMaterial"',
                                'db_field': 'amt_in_water',
                                'db_schema': 'public',
                                'sheet_name': 'MATERIAL_INVOLVED',
                                'column': 'AMOUNT_IN_WATER',
                                'processing': None
                            },
                            {
                                'db_table': '"NrcScrapedMaterial"',
                                'db_field': 'amt_in_water_unit',
                                'db_schema': 'public',
                                'sheet_name': 'MATERIAL_INVOLVED',
                                'column': 'UNIT_OF_MEASURE_REACH_WATER',
                                'processing': None
                            },
                            {
                                'db_table': '"NrcScrapedMaterial"',
                                'db_field': 'chris_code',
                                'db_schema': 'public',
                                'sheet_name': 'MATERIAL_INV0LVED_CR',
                                'column': 'CHRIS_CODE',
                                'processing': None
                            },
                            {
                                'db_table': '"NrcScrapedMaterial"',
                                'db_field': 'amount',
                                'db_schema': 'public',
                                'sheet_name': 'MATERIAL_INV0LVED_CR',
                                'column': 'UPPER_BOUNDS',
                                'processing': None
                            },
                            {
                                'db_table': '"NrcScrapedMaterial"',
                                'db_field': 'unit',
                                'db_schema': 'public',
                                'sheet_name': 'MATERIAL_INV0LVED_CR',
                                'column': 'UPPER_BOUNDS_UNIT',
                                'processing': None
                            },
                            {
                                'db_table': '"NrcScrapedMaterial"',
                                'db_field': 'ft_id',
                                'db_schema': 'public',
                                'sheet_name': 'CALLS',
                                'column': None,
                                'processing': {
                                    'function': processing_placeholder
                                }
                            },
                            {
                                'db_table': '"NrcScrapedMaterial"',
                                'db_field': 'st_id',
                                'db_schema': 'public',
                                'sheet_name': 'CALLS',
                                'column': None,
                                'processing': {
                                    'function': processing_placeholder
                                }
                            }
                        ]
                    }
                }
            }
        }

        # Execute function
        return_val = nrcSpreadsheetScraper.NrcScrapedReportFields.material_name(db_cursor=db_cursor, uid=uid, workbook=workbook,
                                                                                row=None, db_null_value=db_null_value,
                                                                                map_def=map_def,
                                                                                sheet=sheet_cache[map_def['sheet_name']],
                                                                                all_field_maps=None,
                                                                                sheet_seqnos_field=sheet_seqnos_field,
                                                                                db_write_mode=db_write_mode,
                                                                                print_queries=print_queries,
                                                                                execute_queries=execute_queries,
                                                                                raw_sheet_cache=raw_sheet_cache,
                                                                                db_seqnos_field=db_seqnos_field,
                                                                                sheet_cache=sheet_cache)

        # The processing function is supposed to return a material that is then included in the parent query
        # Make sure the proper value was returned
        self.assertEqual(return_val, "GASOLINE: AUTOMOTIVE (UNLEADED)")

        # Make sure the proper number of records were inserted into the NrcScrapedMaterial table
        count_query = """SELECT COUNT(1) FROM public."NrcScrapedMaterial";"""
        e_sheet = workbook.sheet_by_name('MATERIAL_INVOLVED')
        expected = len([c.value for c in e_sheet.col(0) if c.value == uid])
        db_cursor.execute(count_query)
        result = db_cursor.fetchall()
        actual = int(result[0][0])
        self.assertEqual(expected, actual)

        # Cleanup
        truncate_query = """TRUNCATE public."NrcScrapedMaterial";"""
        db_cursor.execute(truncate_query)
        expected = 0
        db_cursor.execute(count_query)
        actual = int(db_cursor.fetchall()[0][0])
        self.assertEqual(expected, actual)
        e_sheet = None
        db_cursor.close()
        db_conn.close()

    #/* ----------------------------------------------------------------------- */#
    #/*     Define test_full_report_url() method
    #/* ----------------------------------------------------------------------- */#

    def test_full_report_url(self):

        expected = 'http://cgmix.uscg.mil/NRC/'
        actual = nrcSpreadsheetScraper.NrcScrapedReportFields.full_report_url()
        self.assertEqual(expected, actual)

    #/* ----------------------------------------------------------------------- */#
    #/*     Define test_materials_url() method
    #/* ----------------------------------------------------------------------- */#

    def test_materials_url(self):

        expected = 'http://cgmix.uscg.mil/NRC/'
        aactual = nrcSpreadsheetScraper.NrcScrapedReportFields.materials_url()
        self.assertEqual(expected, aactual)

    #/* ----------------------------------------------------------------------- */#
    #/*     Define test_time_stamp() method
    #/* ----------------------------------------------------------------------- */#

    def test_time_stamp(self):

        global TO

        expected = TO['db_null']
        actual = nrcSpreadsheetScraper.NrcScrapedReportFields.time_stamp(db_null_value=TO['db_null'])
        self.assertEqual(expected, actual)

    #/* ----------------------------------------------------------------------- */#
    #/*     Define test_ft_id() method
    #/* ----------------------------------------------------------------------- */#

    def test_ft_id(self):

        global TO

        expected = TO['db_null']
        actual = nrcSpreadsheetScraper.NrcScrapedReportFields.ft_id(db_null_value=TO['db_null'])
        self.assertEqual(expected, actual)

    #/* ----------------------------------------------------------------------- */#
    #/*     Define test_recieved_datetime() method
    #/* ----------------------------------------------------------------------- */#

    def recievedtest__datetime(self):

        # NOTE: The misspelling of this method is intentional to match the DB field name

        # Assemble the required arguments
        # These arguments contain the bare minimum requirements needed to test the function
        class _workbook(object):
            datemode = 0
        workbook = _workbook()
        map_def = {'column': 'DATE'}
        row = {'DATE': 41640.14775462963}

        expected = nrcSpreadsheetScraper.timestamp2datetime(row['DATE'], workbook.datemode)
        actual = nrcSpreadsheetScraper.NrcScrapedReportFields.recieved_datetime(row=row, map_def=map_def, workbook=workbook)
        self.assertEqual(expected, actual)

    #/* ----------------------------------------------------------------------- */#
    #/*     Define test_incident_datetime() method
    #/* ----------------------------------------------------------------------- */#

    def test_incident_datetime(self):

        # Assemble the required arguments
        # These arguments contain the bare minimum requirements needed to test the function
        class _workbook(object):
            datemode = 0
        workbook = _workbook()
        map_def = {'column': 'DATE'}
        row = {'DATE': 41640.14775462963}

        expected = nrcSpreadsheetScraper.timestamp2datetime(row['DATE'], workbook.datemode)
        actual = nrcSpreadsheetScraper.NrcScrapedReportFields.recieved_datetime(row=row, map_def=map_def, workbook=workbook)
        self.assertEqual(expected, actual)


#/* ======================================================================= */#
#/*     Define TestNrcParsedReportFields() class
#/* ======================================================================= */#

class TestNrcParsedReportFields(unittest.TestCase):
    
    #/* ----------------------------------------------------------------------- */#
    #/*     Define test_areaid() method
    #/* ----------------------------------------------------------------------- */#

    def test_areaid(self):

        # TODO: Implement

        global TO

        expected = TO['db_null']
        actual = nrcSpreadsheetScraper.NrcParsedReportFields.areaid(db_null_value=TO['db_null'])
        self.assertEqual(expected, actual)

    #/* ----------------------------------------------------------------------- */#
    #/*     Define test_blockid() method
    #/* ----------------------------------------------------------------------- */#

    def test_blockid(self):

        # TODO: Implement

        global TO

        expected = TO['db_null']
        actual = nrcSpreadsheetScraper.NrcParsedReportFields.blockid(db_null_value=TO['db_null'])
        self.assertEqual(expected, actual)
    
    #/* ----------------------------------------------------------------------- */#
    #/*     Define test_platform_letter() method
    #/* ----------------------------------------------------------------------- */#

    def test_platform_letter(self):

        # TODO: Implement

        global TO

        expected = TO['db_null']
        actual = nrcSpreadsheetScraper.NrcParsedReportFields.platform_letter(db_null_value=TO['db_null'])
        self.assertEqual(expected, actual)

    #/* ----------------------------------------------------------------------- */#
    #/*     Define test_sheen_handler() method
    #/* ----------------------------------------------------------------------- */#

    def test_sheen_handler(self):

        # To update test, paste the updated multipliers dict below
        multipliers = {
            'FE': 1,
            'FEET': 1,
            'IN': 0.0833333,
            'INCHES': 0.0833333,
            'KILOMETERS': 3280.84,
            'METER': 3.28084,
            'METERS': 3.28084,
            'MI': 5280,
            'MIL': 5280,
            'MILES': 5280,
            'NI': 5280,  # Assumed mistyping of 'MI'
            'UN': 0.0833333,  # Assumed mistyping of 'IN'
            'YARDS': 3
        }

        # Check exceptions
        self.assertRaises(KeyError, nrcSpreadsheetScraper.NrcParsedReportFields.sheen_size_length,
                          **{'map_def': 'TEMP'})
        self.assertRaises(KeyError, nrcSpreadsheetScraper.NrcParsedReportFields.sheen_size_length,
                          **{'row': 'TEMP'})

        # Test each unit
        for m_unit, m_multi in multipliers.iteritems():
            map_def = {
                'column': 'value',
                'processing': {
                    'args': {
                        'unit_field': 'unit'
                    }
                }
            }
            row = {
                'value': random.randint(0, 10000),
                'unit': m_unit}

            # Run test
            expected = row[map_def['column']] * m_multi
            actual = nrcSpreadsheetScraper.NrcParsedReportFields._sheen_handler(map_def=map_def, row=row,
                                                                                db_null_value=TO['db_null'])
            self.assertEqual(expected, actual)

        # Test if value is empty
        map_def = {
            'column': 'value',
            'processing': {
                'args': {
                    'unit_field': 'unit'
                }
            }
        }
        row = {
            'value': '',
            'unit': random.choice(multipliers.keys())}
        expected = TO['db_null']
        actual = nrcSpreadsheetScraper.NrcParsedReportFields._sheen_handler(db_null_value=TO['db_null'], map_def=map_def, row=row)
        self.assertEqual(expected, actual)

        # Test if unit is empty
        map_def = {
            'column': 'value',
            'processing': {
                'args': {
                    'unit_field': 'unit'
                }
            }
        }
        row = {
            'value': random.randint(0, 10000),
            'unit': ''}
        expected = TO['db_null']
        actual = nrcSpreadsheetScraper.NrcParsedReportFields.sheen_size_length(db_null_value=TO['db_null'], map_def=map_def, row=row)
        self.assertEqual(expected, actual)
    
    #/* ----------------------------------------------------------------------- */#
    #/*     Define test_affected_area() method
    #/* ----------------------------------------------------------------------- */#

    def test_affected_area(self):

        global TO

        expected = TO['db_null']
        actual = nrcSpreadsheetScraper.NrcParsedReportFields.affected_area(db_null_value=TO['db_null'])
        self.assertEqual(expected, actual)

    #/* ----------------------------------------------------------------------- */#
    #/*     Define test_time_stamp() method
    #/* ----------------------------------------------------------------------- */#

    def test_time_stamp(self):

        global TO

        expected = TO['db_null']
        actual = nrcSpreadsheetScraper.NrcParsedReportFields.time_stamp(db_null_value=TO['db_null'])
        self.assertEqual(expected, actual)
    
    #/* ----------------------------------------------------------------------- */#
    #/*     Define test_ft_id() method
    #/* ----------------------------------------------------------------------- */#

    def test_ft_id(self):

        expected = TO['db_null']
        actual = nrcSpreadsheetScraper.NrcParsedReportFields.ft_id(db_null_value=TO['db_null'])
        self.assertEqual(expected, actual)

    #/* ----------------------------------------------------------------------- */#
    #/*     Define test_coord_formatter() method
    #/* ----------------------------------------------------------------------- */#

    def test_coord_formatter(self):

        global TO

        # Test errors - all should return NULL
        expected = TO['db_null']
        actual = nrcSpreadsheetScraper.NrcParsedReportFields._coord_formatter(db_null_value=TO['db_null'])
        self.assertEqual(expected, actual)
        actual = nrcSpreadsheetScraper.NrcParsedReportFields._coord_formatter(db_null_value=TO['db_null'], **{'NOTHING': None})
        self.assertEqual(expected, actual)

        # Test with actual content
        row = {
            'degree': 28.0,
            'minute': 24.0,
            'second': 25.0,
            'quadrant': 'N'
        }
        map_def = {
            'processing': {
                'args': {
                    'col_degrees': 'degree',
                    'col_minutes': 'minute',
                    'col_seconds': 'second',
                    'col_quadrant': 'quadrant'
                }
            }
        }
        expected = nrcSpreadsheetScraper.dms2dd(row['degree'], row['minute'], row['second'], row['quadrant'])
        actual = nrcSpreadsheetScraper.NrcParsedReportFields._coord_formatter(db_null_value=TO['db_null'], row=row,
                                                                              map_def=map_def)
        self.assertEqual(expected, actual)


#/* ======================================================================= */#
#/*     Define TestNrcScrapedMaterialFields() class
#/* ======================================================================= */#

class TestNrcScrapedMaterialFields(unittest.TestCase):

    #/* ----------------------------------------------------------------------- */#
    #/*     Define test_ft_id() method
    #/* ----------------------------------------------------------------------- */#

    def test_ft_id(self):

        expected = TO['db_null']
        actual = nrcSpreadsheetScraper.NrcScrapedMaterialFields.ft_id(db_null_value=TO['db_null'])
        self.assertEqual(expected, actual)

    #/* ----------------------------------------------------------------------- */#
    #/*     Define test_st_id() method
    #/* ----------------------------------------------------------------------- */#

    def test_st_id(self):

        expected = TO['db_null']
        actual = nrcSpreadsheetScraper.NrcScrapedMaterialFields.ft_id(db_null_value=TO['db_null'])
        self.assertEqual(expected, actual)


#/* ======================================================================= */#
#/*     Define print_usage() function
#/* ======================================================================= */#

def print_usage():

    """
    Command line usage information

    :return: 1 for exit code purposes
    :rtype: int
    """

    global _TO_DESCRIPTIONS

    print("""
Usage:

    {0} [-to option=value]


Test Options (-to):
    """.format(basename(__file__)))

    # Get longest key and add padding
    max_key_width_plus_padding = max([len(i) for i in TO.keys()]) + 4

    # Print test options
    iter_keys = _TO_DESCRIPTIONS.keys()
    iter_keys.sort()
    for key in iter_keys:
        value = _TO_DESCRIPTIONS[key]
        indent = " " * 4
        key_with_padding = "%s%s" % (key, " " * (max_key_width_plus_padding - len(key)))
        print("%s%s%s" % (indent, key_with_padding, value))
    print("")

    return 1


#/* ======================================================================= */#
#/*     Define main() function
#/* ======================================================================= */#

def main(args):

    """
    Main routine

    :param args: arguments from the commandline (sys.argv[1:] in order to drop the script name)
    :type args: list

    :return: 0 on success and 1 on error
    :rtype: int
    """

    global TO

    # Defaults
    run_tests = True

    # Parse arguments - make sure the script name is included
    unittest_args = [sys.argv[0]]
    i = 0
    arg = None
    arg_error = False
    while i < len(args):

        try:
            arg = args[i]

            # Help arguments
            if arg in ('-usage', '--usage', '-help', '--help'):
                i += 1
                return print_usage()

            # Configure test options
            elif arg in ('--test-option', '-to'):
                i += 2
                option, value = args[i - 1].split('=', 1)
                option = option.lower()

                # Cast to type
                if value.upper() == 'NONE':
                    value = None
                elif value.upper() == 'TRUE':
                    value = True
                elif value.upper() == 'FALSE':
                    value = False

                # Make sure option is valid
                if option in TO:
                    TO[option] = value
                else:
                    arg_error = True
                    print("ERROR: Invalid test option: %s" % option)

            # Additional options
            elif arg == '--no-run-tests':
                i += 1
                run_tests = False

            # Assume all unrecognized arguments should be passed on to the unittest module
            else:
                i += 1
                unittest_args.append(arg)

        # This catches three conditions:
        #   1. The last argument is a flag that requires parameters but the user did not supply the parameter
        #   2. The arg parser did not properly consume all parameters for an argument
        #   3. The arg parser did not properly iterate the 'i' variable
        except (IndexError, ValueError):
            arg_error = True
            print("ERROR: An argument has invalid parameters: %s" % arg)

    # Don't run tests if any errors were found
    if arg_error:
        return 1

    # Update user
    print("")
    print("Test options:")
    pprint(TO)
    print("")

    # Run tests
    if run_tests:
        # Make sure unittest gets its arguments
        sys.argv = unittest_args
        return unittest.main()
    else:
        return 1


#/* ======================================================================= */#
#/*     Commandline Execution
#/* ======================================================================= */#

if __name__ == '__main__':

    # Run tests
    sys.exit(main(sys.argv[1:]))
