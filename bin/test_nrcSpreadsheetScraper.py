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


"""
Tests
"""


from __future__ import division
from __future__ import unicode_literals

from pprint import pprint
import sys
import unittest

import getpass
import nrcSpreadsheetScraper
import psycopg2
import xlrd


#/* ======================================================================= */#
#/*     Python setup
#/* ======================================================================= */#

if sys.version[0] is 2:
    range = xrange


#/* ======================================================================= */#
#/*     Global variables
#/* ======================================================================= */#

TEST_OPTIONS = {
    'dataset': 'Current.xlsx',
    'sheet': 'CALLS',
    'db_host': 'localhost',
    'db_name': 'test_skytruth',
    'db_user': getpass.getuser(),
    'db_pass': '',
}


#/* ======================================================================= */#
#/*     Define setUpModule() function
#/* ======================================================================= */#

def setUpModule():

    global TEST_OPTIONS

    print("Validating test parameters ...")

    # Make sure required test file and sheet exist and can be read
    with xlrd.open_workbook(TEST_OPTIONS['dataset']) as workbook:
        sheet = workbook.sheet_by_name(TEST_OPTIONS['sheet'])

    # Make sure the DB parameters are correct
    db_connection_string = "host='%s' dbname='%s' user='%s' password='%s'" \
                           % (TEST_OPTIONS['db_host'], TEST_OPTIONS['db_name'],
                              TEST_OPTIONS['db_user'], TEST_OPTIONS['db_pass'])
    connection = psycopg2.connect(db_connection_string)
    connection.close()

    print("Done validating test parameters")
    print("Running tests ...")


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

        global TEST_OPTIONS

        with xlrd.open_workbook(TEST_OPTIONS['dataset']) as workbook:
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

        global TEST_OPTIONS

        with xlrd.open_workbook(TEST_OPTIONS['dataset']) as workbook:

            all_expected = []
            sheet = workbook.sheet_by_name(TEST_OPTIONS['sheet'])
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

class TestReportExists(object):

    def test_standard(self):

        """
        Test standard use-case
        """
        pass


#/* ======================================================================= */#
#/*     Define print_usage() function
#/* ======================================================================= */#

def print_usage():

    """
    Command line usage information

    :return: 1 for exit code purposes
    :rtype: int
    """

    print("""
Usage:

    {0} [-to option=value]


Test Options (-to):

    DATASET=path/to/file.xlsx
    TEST_SHEET=SHEET_NAME
    DB_HOST=str
    DB_NAME=str
    DB_USER=str
    DB_PASS=str
    """.format(__file__))

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

    global TEST_OPTIONS

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
                if option in TEST_OPTIONS:
                    TEST_OPTIONS[option] = value
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
    print("Running tests ...")
    pprint(TEST_OPTIONS)
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
