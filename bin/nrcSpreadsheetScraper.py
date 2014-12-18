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
Scraper for the "temporary" NRC incident spreadsheet

Sample command:
    ./bin/nrcSpreadsheetScraper.py --db-name test_skytruth --db-user `whoami` --db-host localhost
"""


from __future__ import division
from __future__ import print_function
from __future__ import unicode_literals

from datetime import datetime
import getpass
import os
from os.path import *
import sys
import urllib2

import psycopg2
import psycopg2.extras
import xlrd


#/* ======================================================================= */#
#/*     Python setup
#/* ======================================================================= */#

if sys.version[0] is 2:
    range = xrange


#/* ======================================================================= */#
#/*     Build information
#/* ======================================================================= */#

__version__ = '0.1-dev'
__release__ = 'August 8, 2014'
__author__ = 'Kevin D. Wurster'
__source__ = 'https://github.com/SkyTruth/scraper'
__docname__ = basename(__file__)
__license__ = '''
The MIT License (MIT)

Copyright (c) 2014 SkyTruth

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

'''


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

    {0} [--help-info] [options] [--no-download] [--download-url URL]
    {1} [--db-connection-string] [--db-host hostname] [--db-user username]
    {1} [--db-pass password] [--no-print-progress] [--print-queries]
    {1} [--no-execute-queries] [--overwrite]

Options:

    --db-connection-string  Explicitly define a Postgres supported connection
                            string.  All other --db-* options are ignored.
    --db-host               Hostname for the target database
                            [default: localhost]
    --db-user               Username used for database connection
                            [default: current user]
    --db-name               Name of target database
                            [default: skytruth]
    --db-pass               Password for database user
                            [default: '']

    --download-url          URL from which to download the input file
    --no-download           Don't download the input file
    --overwrite-download    If the --file-to-process already exists and --no-download
                            has not been specified, blindly overwrite the file.
                            Unless the user is specifying a specific target for
                            the download, this flag is not needed due the default
                            file name containing datetime down to the second.

    --file-to-process       Specify where the input file will be downloaded to
                            If used in conjunction with --no-download it is
                            assumed that the specified file already exists and
                            should be used for processing
                            [default: Current_<CURRENT_DATETIME>.xlsx]
    --no-print-progress     Don't print the progress indicator
    --print-queries         Print queries immediately before execution
                            Automatically turns off the progress indicator
    --no-execute-queries    Don't execute queries

""".format(__docname__, " " * len(__docname__)))
    return 1


#/* ======================================================================= */#
#/*     Define print_license() function
#/* ======================================================================= */#

def print_license():

    """
    Print out license information

    :return: 1 for exit code purposes
    :rtype: int
    """

    print(__license__)

    return 1


#/* ======================================================================= */#
#/*     Define print_help() function
#/* ======================================================================= */#

def print_help():

    """
    Detailed help information

    :return: 1 for exit code purposes
    :rtype: int
    """

    print("""
Help: {0}
------{1}
{2}
    """.format(__docname__, '-' * len(__docname__), main.__doc__))

    return 1


#/* ======================================================================= */#
#/*     Define print_help_info() function
#/* ======================================================================= */#

def print_help_info():

    """
    Print a list of help related flags

    :return: 1 for exit code purposes
    :rtype: int
    """

    print("""
Help flags:
    --help      More detailed description of this utility
    --usage     Arguments, parameters, flags, options, etc.
    --version   Version and ownership information
    --license   License information
    """)

    return 1


#/* ======================================================================= */#
#/*     Define print_version() function
#/* ======================================================================= */#

def print_version():

    """
    Print script version information

    :return: 1 for exit code purposes
    :rtype: int
    """

    print("""
%s version %s - released %s
    """ % (__docname__, __version__, __release__))

    return 1


#/* ======================================================================= */#
#/*     Define dms2dd() function
#/* ======================================================================= */#

def dms2dd(degrees, minutes, seconds, quadrant):

    """
    Convert degrees, minutes, seconds, quadrant to decimal degrees

    :param degrees: coordinate degrees
    :type degrees: int
    :param minutes: coordinate minutes
    :type minutes: int
    :param seconds: coordinate seconds
    :type seconds: int
    :param quadrant: coordinate quadrant (N, E, S, W)
    :type quadrant: str|unicode

    :return: decimal degrees
    :rtype: float
    """

    illegal_vals = (None, '', u'')
    for iv in illegal_vals:
        if iv in (degrees, minutes, seconds, quadrant):
            raise ValueError("ERROR: Illegal value: %s" % iv)

    if quadrant.lower() not in ('n', 'e', 's', 'w'):
        raise ValueError("ERROR: Invalid quadrant: %s" % quadrant)

    output = int(degrees) + int(minutes) / 60 + int(seconds) / 3600

    if quadrant.lower() in ('s', 'w'):
        output *= -1

    return output


#/* ======================================================================= */#
#/*     Define column_names() function
#/* ======================================================================= */#

def column_names(sheet, formatter=str):

    """
    Get the ordered column names from an XLRD sheet object

    :param sheet: XLRD sheet object
    :type sheet: xlrd.Sheet
    :param formatter:
    :type formatter: type|function

    :return: list of column names
    :rtype: list
    """

    return [formatter(cell.value) for cell in sheet.row(0)]


#/* ======================================================================= */#
#/*     Define sheet2dict() function
#/* ======================================================================= */#

def sheet2dict(sheet):

    """
    Convert an XLRD sheet object into a list of rows, each structured as a dictionary


    Example Input:

        "Column1","Column2","Column3"
        "Row 1 Val","Another Row 1 Val","Even More Row 1 Values"
        "Row 2 Val","Another Row 2 Val","Even More Row 2 Values"
        "Row 3 Val","Another Row 3 Val","Even More Row 3 Values"


    Example Output:

        [
            {
                'Column1': 'Row 1 Val',
                'Column2': 'Another Row 1 Val',
                'Column3': 'Even More Row 1 Values'
            },
            {
                'Column1': 'Row 2 Val',
                'Column2': 'Another Row 2 Val',
                'Column3': 'Even more Row 2 Values'
            }
            {
                'Column1': 'Row 3 Val',
                'Column2': 'Another Row 3 Val',
                'Column3': 'Even more Row 3 Values'
            }
        ]

    :param sheet: XLRD sheet object from xlrd.open_workbook('workbook').sheet_by_name('name')
    :type sheet: xlrd.Sheet

    :return: list of elements, each containing one row of the sheet as a dictionary
    :rtype: dict
    """

    output = []
    columns = column_names(sheet)
    for r in range(1, sheet.nrows):  # Skip first row since it contains the header
        output.append(dict((columns[c], sheet.cell_value(r, c)) for c in range(sheet.ncols)))

    return output


#/* ======================================================================= */#
#/*     Define report_exists() function
#/* ======================================================================= */#

def report_exists(**kwargs):

    """
    Check to see if a report has already been submitted to a table

    :param seqnos: reportnum
    :type seqnos: int|float
    :param field:
    :type field:

    :return:
    :rtype: bool
    """

    reportnum = kwargs['reportnum']
    cursor = kwargs['db_cursor']
    table = kwargs['table']
    field = kwargs.get('field', 'reportnum')
    schema = kwargs['schema']

    cursor.execute("""SELECT * FROM %s.%s WHERE %s = %s""" % (schema, table, field, reportnum))
    return len(cursor.fetchall()) > 0


#/* ======================================================================= */#
#/*     Define timestamp2datetime() function
#/* ======================================================================= */#

def timestamp2datetime(stamp, workbook_datemode, formatter='%Y-%m-%d %I:%M:%S'):

        """
        Convert a float formatted date a Postgres supported timestamp

        :param stamp: timestamp from XLRD reading a date encoded field
        :type stamp: float
        :param workbook_datemode: from xlrd.Workbook.datemode
        :type workbook_datemode: int

        :return: date capable of being inserted into Postgres timestamp field
        :rtype: str|unicode
        """

        dt = datetime(*xlrd.xldate_as_tuple(stamp, workbook_datemode))

        return dt.strftime(formatter)


#/* ======================================================================= */#
#/*     Define get_current_spreadsheet() function
#/* ======================================================================= */#

def download(url, destination, overwrite=False):

    """
    Download a file

    :param url: URL to download from
    :type url: str|unicode
    :param destination: target path and filename for downloaded file
    :type destination: str|unicode
    :param overwrite: specify whether or not an existing destination should be overwritten
    :type overwrite: bool

    :return: path to downloaded file
    :rtype: str|unicode
    """

    # Validate arguments
    if not overwrite and isfile(destination):
        raise ValueError("ERROR: Overwrite=%s and outfile exists: %s" % (overwrite, destination))

    # Download
    response = urllib2.urlopen(url)
    with open(destination, 'w') as f:
        f.write(response.read())

    return destination


#/* ======================================================================= */#
#/*     Define name_current_file() function
#/* ======================================================================= */#

def name_current_file(input_name):

    """
    Generate the output Current.xlsx name for permanent archival

    :param input_name: input file name (e.g. Current.xlsx)
    :type input_name: str|unicode

    :return: output formatted name
    :rtype: str|unicode
    """

    dt = datetime.now()
    dt = dt.strftime("_%Y-%m-%d_%I:%M:%S")
    input_split = input_name.split('.')
    input_split[0] += dt

    return '.'.join(input_split)


#/* ======================================================================= */#
#/*     Define db_row_count() function
#/* ======================================================================= */#

def db_row_count(cursor, schema_table):

    """

    :param cursor: Postgres formatted database connection string
    :type cursor: psycopg2.cursor
    :param schema_table: schema.table
    :type schema_table: str|unicode

    :return: number of rows in the specified schema.table
    :rtype: int
    """

    query = """SELECT COUNT(1) FROM %s;""" % schema_table
    cursor.execute(query)
    result = cursor.fetchall()

    return int(result[0][0])


#/* ======================================================================= */#
#/*     Define process_field_map() function
#/* ======================================================================= */#

def process_field_map(**kwargs):

    db_cursor = kwargs['db_cursor']
    uid = kwargs['uid']
    workbook = kwargs['workbook']
    row = kwargs['row']
    db_null_value = kwargs['db_null_value']
    map_def = kwargs['map_def']
    sheet = kwargs['sheet']
    all_field_maps = kwargs['all_field_maps']
    sheet_seqnos_field = kwargs['sheet_seqnos_field']
    db_write_mode = kwargs['db_write_mode']
    print_queries = kwargs['print_queries']
    execute_queries = kwargs['execute_queries']
    raw_sheet_cache = kwargs['raw_sheet_cache']
    db_seqnos_field = kwargs['db_seqnos_field']

    if map_def['processing'] is None:
        try:
            value = row[map_def['column']]
        except KeyError:
            # UID doesn't appear in the specified sheet - populate a NULL value
            value = db_null_value

    # Pass all necessary information to the processing function in order to get a result
    else:
        value = map_def['processing']['function'](db_cursor=db_cursor, uid=uid,
                                                  workbook=workbook,
                                                  row=row, db_null_value=db_null_value,
                                                  map_def=map_def,
                                                  sheet=sheet,
                                                  all_field_maps=all_field_maps,
                                                  sheet_seqnos_field=sheet_seqnos_field,
                                                  db_write_mode=db_write_mode,
                                                  print_queries=print_queries,
                                                  execute_queries=execute_queries,
                                                  raw_sheet_cache=raw_sheet_cache,
                                                  db_seqnos_field=db_seqnos_field)

    return value


#/* ======================================================================= */#
#/*     Define NrcScrapedReportField() class
#/* ======================================================================= */#

class NrcScrapedReportFields(object):

    """
    Some fields in the NRC spreadsheet do not map directly to a column in the
    database.  These fields require an additional processing step that is
    highly specific and cannot be re-used.  The field map definition contains
    all of the additional arguments and information necessary to execute one
    of these processing functions.

    A class is used as a namespace to provide better organization and to
    prevent having to name functions something like:
    'get_NrcScrapedReport_material_name_field'
    """
    
    #/* ----------------------------------------------------------------------- */#
    #/*     Define material_name() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def material_name(**kwargs):

        # Parse arguments
        map_def = kwargs['map_def']
        print_queries = kwargs['print_queries']
        execute_queries = kwargs['execute_queries']
        extras_field_maps = map_def['processing']['args']['extras_field_maps']
        db_write_mode = kwargs['db_write_mode']
        uid = kwargs['uid']
        sheet_seqnos_field = kwargs['sheet_seqnos_field']
        db_cursor = kwargs['db_cursor']
        raw_sheet_cache = kwargs['raw_sheet_cache']
        db_seqnos_field = kwargs['db_seqnos_field']
        db_null_value = kwargs['db_null_value']
        sheet_cache = kwargs['sheet_cache']

        # TODO: This currently only reads rows from the sheet specified in the field map and NOT the extra field maps
        #   specified in the processing args.  Currently not a problem since

        # Build query
        initial_value_to_be_returned = None
        for row in raw_sheet_cache[map_def['sheet_name']]:

            extra_query_fields = []
            extra_query_values = []

            # Found a matching row
            if row[sheet_seqnos_field] == uid:

                # The first instance goes into the table specified in the field map
                # This query must be handled by the parent process so this value is
                # returned at the very end
                if initial_value_to_be_returned is None:
                    initial_value_to_be_returned = row[map_def['column']]

                # ALL occurrences are sent to a different table - specified in the field map arguments
                for e_db_map in extras_field_maps:
                    for e_map_def in extras_field_maps[e_db_map]:
                        value = process_field_map(db_cursor=db_cursor, uid=uid, workbook=kwargs['workbook'],
                                                  row=row, db_null_value=db_null_value, map_def=e_map_def,
                                                  sheet=sheet_cache[e_map_def['sheet_name']],
                                                  all_field_maps=kwargs['all_field_maps'],
                                                  sheet_seqnos_field=sheet_seqnos_field, db_write_mode=db_write_mode,
                                                  print_queries=print_queries, execute_queries=execute_queries,
                                                  raw_sheet_cache=raw_sheet_cache,
                                                  db_seqnos_field=db_seqnos_field)

                        # Make sure the value is properly quoted
                        if value not in (None, '', u'', db_null_value):
                            if isinstance(value, str) or isinstance(value, unicode):
                                value = value.replace("'", '"')  # Single quotes cause problems on insert
                                try:
                                    if e_map_def['db_field_width']:
                                        value = value[:e_map_def['db_field_width']]
                                except KeyError:
                                    pass
                                extra_query_values.append("'%s'" % value)  # String value
                            else:
                                extra_query_values.append("%s" % value)  # int|float value
                            extra_query_fields.append(e_map_def['db_field'])

                    # Do something with the query
                    query = """%s %s.%s (%s) VALUES (%s);""" % (db_write_mode,
                                                                e_map_def['db_schema'],
                                                                e_map_def['db_table'],
                                                                ', '.join(extra_query_fields),
                                                                ', '.join(extra_query_values))
                    if print_queries:
                        print("")
                        print(query)
                    if execute_queries:
                        db_cursor.execute(query)

        # This processing function handled ALL inserts - tell parent process there's nothing left to do
        return initial_value_to_be_returned
    
    #/* ----------------------------------------------------------------------- */#
    #/*     Define full_report_url() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def full_report_url(**kwargs):

        """
        Default value
        """

        return 'http://cgmix.uscg.mil/NRC/'
    
    #/* ----------------------------------------------------------------------- */#
    #/*     Define materials_url() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def materials_url(**kwargs):

        """
        Default value
        """
        
        return NrcScrapedReportFields.full_report_url()
    
    #/* ----------------------------------------------------------------------- */#
    #/*     Define time_stamp() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def time_stamp(**kwargs):

        """
        Required to insert a NULL value
        """

        return kwargs.get('db_null_value', None)
    
    #/* ----------------------------------------------------------------------- */#
    #/*     Define ft_id() function
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def ft_id(**kwargs):

        """
        Required to insert a NULL value
        """

        return kwargs.get('db_null_value', None)

    #/* ----------------------------------------------------------------------- */#
    #/*     Define _datetime_caller() function
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def _datetime_caller(**kwargs):

        """
        Several methods require converting a timestamp to a Postgres supported
        timestamp format.  This method eliminates repitition

        :param workbook:
        :type workbook:
        :param row:
        :type row:
        :param map_def:
        :type map_def:

        :rtype:
        :return:
        """

        # TODO: Use 24 hour time

        workbook = kwargs['workbook']
        row = kwargs['row']
        map_def = kwargs['map_def']

        return timestamp2datetime(row[map_def['column']], workbook.datemode)

    #/* ----------------------------------------------------------------------- */#
    #/*     Define recieved_time() function
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def recieved_datetime(**kwargs):

        """
        See documentation for function called in the return statement
        """

        return NrcScrapedReportFields._datetime_caller(**kwargs)

    #/* ----------------------------------------------------------------------- */#
    #/*     Define incident_datetime() function
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def incident_datetime(**kwargs):

        """
        See documentation for function called in the return statement
        """

        return NrcScrapedReportFields._datetime_caller(**kwargs)

    #/* ----------------------------------------------------------------------- */#
    #/*     Define incident_datetime() function
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def calltype(**kwargs):

        """
        Database is expecting
        """

        map_def = kwargs['map_def']
        row = kwargs['row']

        value = row[map_def['column']]
        if value == 'INC':
            value = 'INCIDENT'

        return value


#/* ======================================================================= */#
#/*     Define NrcParsedReportFields() class
#/* ======================================================================= */#

class NrcParsedReportFields(object):

    """
    Some fields in the NRC spreadsheet do not map directly to a column in the
    database.  These fields require an additional processing step that is
    highly specific and cannot be re-used.  The field map definition contains
    all of the additional arguments and information necessary to execute one
    of these processing functions.

    A class is used as a namespace to provide better organization and to
    prevent having to name functions something like:
    'get_NrcScrapedReport_material_name_field'
    """

    #/* ----------------------------------------------------------------------- */#
    #/*     Define areaid() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def areaid(**kwargs):

        # TODO: Implement - currently returning NULL
        return kwargs.get('db_null_value', None)

    #/* ----------------------------------------------------------------------- */#
    #/*     Define blockid() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def blockid(**kwargs):

        # TODO: Implement - currently returning NULL
        return kwargs.get('db_null_value', None)
    
    #/* ----------------------------------------------------------------------- */#
    #/*     Define platform_letter() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def platform_letter(**kwargs):

        # TODO: Implement - currently returning NULL
        return kwargs.get('db_null_value', None)

    #/* ----------------------------------------------------------------------- */#
    #/*     Define _sheen_handler() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def _sheen_handler(**kwargs):

        """
        Several converters require
        """

        row = kwargs['row']
        map_def = kwargs['map_def']
        db_null_value = kwargs['db_null_value']

        value = row[map_def['column']]
        unit = row[map_def['processing']['args']['unit_field']]

        # If the value is not a float, change it to nothing so the next test fails
        try:
            value = float(value)
        except ValueError:
            value = ''

        # No sheen size - nothing to do
        if value == '' or unit == '':
            return db_null_value

        # Found a sheen size and unit - perform conversion
        else:

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

            # Database is expecting to handle the normalization by reading from a field containing "1.23 METERS"
            # This function takes care of that but must still supply the expected post-normalization format
            return unicode(multipliers[unit.upper()] * value) + ' FEET'


    #/* ----------------------------------------------------------------------- */#
    #/*     Define sheen_size_length() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def sheen_size_length(**kwargs):

        """
        See called function documentation
        """

        return NrcParsedReportFields._sheen_handler(**kwargs)
    
    #/* ----------------------------------------------------------------------- */#
    #/*     Define sheen_size_width() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def sheen_size_width(**kwargs):

        """
        See called function documentation
        """

        return NrcParsedReportFields._sheen_handler(**kwargs)
    
    #/* ----------------------------------------------------------------------- */#
    #/*     Define affected_area() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def affected_area(**kwargs):

        return kwargs.get('db_null_value', None)

    #/* ----------------------------------------------------------------------- */#
    #/*     Define time_stamp() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def time_stamp(**kwargs):

        """
        Required to insert a NULL value
        """

        return kwargs.get('db_null_value', None)
    
    #/* ----------------------------------------------------------------------- */#
    #/*     Define ft_id() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def ft_id(**kwargs):

        """
        Required to insert a NULL value
        """

        return kwargs.get('db_null_value', None)

    #/* ----------------------------------------------------------------------- */#
    #/*     Define _coord_formatter() protected static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def _coord_formatter(**kwargs):

        """
        The latitude() and longitude() methods require the same general
        logic.
        """

        try:
            row = kwargs['row']
            col_deg = kwargs['map_def']['processing']['args']['col_degrees']
            col_min = kwargs['map_def']['processing']['args']['col_minutes']
            col_sec = kwargs['map_def']['processing']['args']['col_seconds']
            col_quad = kwargs['map_def']['processing']['args']['col_quadrant']
            output = dms2dd(row[col_deg], row[col_min], row[col_sec], row[col_quad])
        except (ValueError, KeyError):
            output = kwargs['db_null_value']

        return output

    #/* ----------------------------------------------------------------------- */#
    #/*     Define latitude() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def latitude(**kwargs):

        """
        Convert coordinates from DMS to DD
        """

        return NrcParsedReportFields._coord_formatter(**kwargs)

    #/* ----------------------------------------------------------------------- */#
    #/*     Define longitude() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def longitude(**kwargs):

        """
        Convert coordinates from DMS to DD
        """

        return NrcParsedReportFields._coord_formatter(**kwargs)


#/* ======================================================================= */#
#/*     Define NrcScrapedMaterialFields() class
#/* ======================================================================= */#

class NrcScrapedMaterialFields(object):

    """
    Some fields in the NRC spreadsheet do not map directly to a column in the
    database.  These fields require an additional processing step that is
    highly specific and cannot be re-used.  The field map definition contains
    all of the additional arguments and information necessary to execute one
    of these processing functions.

    A class is used as a namespace to provide better organization and to
    prevent having to name functions something like:
    'get_NrcScrapedReport_material_name_field'
    """

    #/* ----------------------------------------------------------------------- */#
    #/*     Define ft_id() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def ft_id(**kwargs):

        return kwargs.get('db_null_value', None)

    #/* ----------------------------------------------------------------------- */#
    #/*     Define st_id() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def st_id(**kwargs):

        return kwargs.get('db_null_value', None)


#/* ======================================================================= */#
#/*     Define BotTaskStatusFields() class
#/* ======================================================================= */#

class BotTaskStatusFields(object):

    """
    Some fields in the NRC spreadsheet do not map directly to a column in the
    database.  These fields require an additional processing step that is
    highly specific and cannot be re-used.  The field map definition contains
    all of the additional arguments and information necessary to execute one
    of these processing functions.

    A class is used as a namespace to provide better organization and to
    prevent having to name functions something like:
    'get_NrcScrapedReport_material_name_field'
    """

    #/* ----------------------------------------------------------------------- */#
    #/*     Define status() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def status(**kwargs):

        return 'DONE'

    #/* ----------------------------------------------------------------------- */#
    #/*     Define bot() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def bot(**kwargs):

        return 'NrcExtractor'


#/* ======================================================================= */#
#/*     Define main() function
#/* ======================================================================= */#

def main(args):

    """
    Main routine to parse, transform, and insert Current.xlsx into the tables
    used by the Alerts system.

    http://cgmix.uscg.mil/NRC/FOIAFiles/Current.xlsx

    Before doing any transformations, a set of SEQNOS/reportnum's are gathered
    from one of the workbook's sheets.  The default column in 'CALLS' but can be
    specified by the user.  This set of ID's are treated as primary keys and drive
    processing.

    Rather than process the input document sheet by sheet and row by row, a set
    of field map definitions are declared to describe which fields in which
    sheets should be inserted into which table in which schema.  Each field map
    is applied against each ID which means that if ID number 1234 is being
    processed, the bare minimum field map example below states that whatever
    value is in sheet 'CALLS' and column 'RESPONSIBLE_COMPANY' can be sent to
    public."NrcScrapedReport".suspected_responsible_company  The more complicated
    field map states that a specific function must do more of the heavy lifting.

    Field maps are grouped by table and center around the target field.  There
    should be one map for every field in a table.  The structure for field maps
    is roughly as follows:

        All field maps = {
            'table_name': [
                {
                    'db_table': Name of target table,
                    'db_field': Name of target field,
                    'db_field_width': Maximum width for this field - used in string slicing
                    'db_schema': Name of target schema,
                    'sheet_name': Name of source sheet in input file,
                    'column': Name of source column in sheet_name,
                    'processing': {  # Optional - should be set to None if not used
                        'function': Callable object responsible for additional sub-processing
                        'args': {  # Essentially kwargs
                            'Arg1': parameter,
                            'Arg2': ...
                        }
                    }
                },
                {
                    'db_table': Name of target table,
                    'db_field': Name of target field,
                    'db_schema': Name of target schema,
                    'sheet_name': Name of source sheet in input file,
                    'column': Name of source column in sheet_name,
                    'processing': {  # Optional - should be set to None if not used
                        'function': Callable object responsible for additional sub-processing
                        'args': {  # Essentially kwargs
                            'Arg1': parameter,
                            'Arg2': ...
                        }
                    }
                },
            ],
            'TABLE_NAME': [
                {
                    'db_table': Name of target table,
                    'db_field': Name of target field,
                    'db_schema': Name of target schema,
                    'sheet_name': Name of source sheet in input file,
                    'column': Name of source column in sheet_name,
                    'processing': {  # Optional - should be set to None if not used
                        'function': Callable object responsible for additional sub-processing
                        'args': {  # Essentially kwargs
                            'Arg1': parameter,
                            'Arg2': ...
                        }
                    }
                }
            ],
        }


    The order of operations for a given ID is as follows:

        1. Get an ID
        2. Get a set of field maps for one target table
        3. Process all field maps and assemble an insert query
        4. Execute the insert statement
        5. Repeat steps 2-4 until all tables have been processed


    Example bare minimum field map:

        The field map below shows that the value in the 'RESPONSIBLE_COMPANY'
        column in the 'CALLS' sheet can be sent directly to
        public."NrcScrapedReport".suspected_responsible_company without any
        additional processing.  Note the quotes around the table name.

        {
            'db_table': '"NrcScrapedReport"',
            'db_field': 'suspected_responsible_company',
            'db_field_width': 32,
            'db_schema': 'public',
            'sheet_name': 'CALLS',
            'column': 'RESPONSIBLE_COMPANY',
            'processing': None
        },


    Example field map with all options:

        This field map shows that no specific column contains the value required
        for public."NrcParsedReport".longitude  Instead, some information must be
        passed to the NrcParsedReportFields.longitude() function where the actual
        processing happens.  Field maps using additional processing always receive
        the following kwargs:

            all_field_maps      All field maps with keys set to schema.table
            db_cursor           The cursor to be used for all queries
            db_null_value       Value to use for NULL
            db_seqnos_field     The reportnum field in the database
            db_write_mode       The first part of the SQL statement for writes
                                (e.g. INSERT INTO)
            execute_queries     Specifies whether or not queries should actually
                                be executed
            map_def             Current map definition being processed (example
                                below)
            print_queries       Specifies whether or not queries should be printed
                                as they are executed
            raw_sheet_cache     Structured similar to the normal sheet cache,
                                but with a list of rows instead of a dictionary
                                containing reportnums as keys and rows as values
            row                 The current row being processed - structured
                                just like a csv.DictReader row
            sheet               The entire sheet from which the row was extracted
                                as described in the field map
            sheet_seqnos_field  The field in all sheets containing the reportnum
            uid                 The current SEQNOS/reportnum being processed
            workbook            XLRD workbook object

        The callable object specified in map_def['processing']['function'] is
        responsible for ALL queries.  The processing functions are intended
        to return a final value to be inserted into the target field described
        in the field map but this behavior is not required.  If the function
        itself handles all queries internally it can return '__NO_QUERY__' in
        order to be excluded from the insert statement for that table.

        {
            'db_table': '"NrcParsedReport"',
            'db_field': 'longitude',
            'db_schema': 'public',
            'sheet_name': 'INCIDENT_COMMONS',
            'column': None,
            'processing': {
                'function': NrcParsedReportFields.longitude,
                'args': {
                    'col_degrees': 'LONG_DEG',
                    'col_minutes': 'LONG_MIN',
                    'col_seconds': 'LONG_SEC',
                    'col_quadrant': 'LONG_QUAD'
                }
            }
        },


    :param args: arguments from the commandline (sys.argv[1:] in order to drop the script name)
    :type args: list

    :return: 0 on success and 1 on error
    :rtype: int
    """

    #/* ----------------------------------------------------------------------- */#
    #/*     Define Field Maps
    #/* ----------------------------------------------------------------------- */#

    field_map_order = ['public."NrcScrapedReport"', 'public."NrcParsedReport"','public."BotTaskStatus"' ]
    field_map = {
        'public."NrcScrapedReport"': [
            {
                'db_table': '"NrcScrapedReport"',
                'db_field': 'reportnum',
                'db_schema': 'public',
                'sheet_name': 'CALLS',
                'column': 'SEQNOS',
                'processing': None
            },
            {
                'db_table': '"NrcScrapedReport"',
                'db_field': 'recieved_datetime',
                'db_schema': 'public',
                'sheet_name': 'CALLS',
                'column': 'DATE_TIME_RECEIVED',
                'processing': {
                    'function': NrcScrapedReportFields.recieved_datetime
                }
            },
            {
                'db_table': '"NrcScrapedReport"',
                'db_field': 'calltype',
                'db_schema': 'public',
                'sheet_name': 'CALLS',
                'column': 'CALLTYPE',
                'processing': {
                    'function': NrcScrapedReportFields.calltype
                }
            },
            {
                'db_table': '"NrcScrapedReport"',
                'db_field': 'suspected_responsible_company',
                'db_schema': 'public',
                'sheet_name': 'CALLS',
                'column': 'RESPONSIBLE_COMPANY',
                'processing': None
            },
            {
                'db_table': '"NrcScrapedReport"',
                'db_field': 'description',
                'db_schema': 'public',
                'sheet_name': 'INCIDENT_COMMONS',
                'column': 'DESCRIPTION_OF_INCIDENT',
                'processing': None
            },
            {
                'db_table': '"NrcScrapedReport"',
                'db_field': 'incident_datetime',
                'db_schema': 'public',
                'sheet_name': 'INCIDENT_COMMONS',
                'column': 'INCIDENT_DATE_TIME',
                'processing': {
                    'function': NrcScrapedReportFields.incident_datetime
                }
            },
            {
                'db_table': '"NrcScrapedReport"',
                'db_field': 'incidenttype',
                'db_schema': 'public',
                'sheet_name': 'INCIDENT_COMMONS',
                'column': 'TYPE_OF_INCIDENT',
                'processing': None
            },
            {
                'db_table': '"NrcScrapedReport"',
                'db_field': 'cause',
                'db_schema': 'public',
                'sheet_name': 'INCIDENT_COMMONS',
                'column': 'INCIDENT_CAUSE',
                'processing': None
            },
            {
                'db_table': '"NrcScrapedReport"',
                'db_field': 'location',
                'db_schema': 'public',
                'sheet_name': 'INCIDENT_COMMONS',
                'column': 'LOCATION_ADDRESS',
                'processing': None
            },
            {
                'db_table': '"NrcScrapedReport"',
                'db_field': 'state',
                'db_schema': 'public',
                'sheet_name': 'INCIDENT_COMMONS',
                'column': 'LOCATION_STATE',
                'processing': None
            },
            {
                'db_table': '"NrcScrapedReport"',
                'db_field': 'nearestcity',
                'db_schema': 'public',
                'sheet_name': 'INCIDENT_COMMONS',
                'column': 'LOCATION_NEAREST_CITY',
                'processing': None
            },
            {
                'db_table': '"NrcScrapedReport"',
                'db_field': 'county',
                'db_schema': 'public',
                'sheet_name': 'INCIDENT_COMMONS',
                'column': 'LOCATION_COUNTY',
                'processing': None
            },
            {
                'db_table': '"NrcScrapedReport"',
                'db_field': 'medium_affected',
                'db_schema': 'public',
                'sheet_name': 'INCIDENT_DETAILS',
                'column': 'MEDIUM_DESC',
                'processing': None
            },
            {
                'db_table': '"NrcScrapedReport"',
                'db_field': 'material_name',
                'db_schema': 'public',
                'sheet_name': 'MATERIAL_INVOLVED',
                'column': 'NAME_OF_MATERIAL',
                'processing': {
                    'function': NrcScrapedReportFields.material_name,
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
                                {
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
                                    'sheet_name': 'MATERIAL_INVOLVED',
                                    'column': 'CHRIS_CODE',
                                    'processing': None
                                },
                                {  # TODO: Not populated
                                    'db_table': '"NrcScrapedMaterial"',
                                    'db_field': 'amount',
                                    'db_schema': 'public',
                                    'sheet_name': 'MATERIAL_INVOLVED',
                                    'column': 'AMOUNT_OF_MATERIAL',
                                    'processing': None
                                },
                                {  # TODO: Not populated
                                    'db_table': '"NrcScrapedMaterial"',
                                    'db_field': 'unit',
                                    'db_schema': 'public',
                                    'sheet_name': 'MATERIAL_INVOLVED',
                                    'column': 'UNIT_OF_MEASURE',
                                    'processing': None
                                },
                                {
                                    'db_table': '"NrcScrapedMaterial"',
                                    'db_field': 'ft_id',
                                    'db_schema': 'public',
                                    'sheet_name': 'CALLS',
                                    'column': None,
                                    'processing': {
                                        'function': NrcScrapedMaterialFields.ft_id
                                    }
                                },
                                {
                                    'db_table': '"NrcScrapedMaterial"',
                                    'db_field': 'st_id',
                                    'db_schema': 'public',
                                    'sheet_name': 'CALLS',
                                    'column': None,
                                    'processing': {
                                        'function': NrcScrapedMaterialFields.st_id
                                    }
                                }
                            ]
                        }
                    }
                }
            },
            {
                'db_table': '"NrcScrapedReport"',
                'db_field': 'full_report_url',
                'db_schema': 'public',
                'sheet_name': 'CALLS',
                'column': None,
                'processing': {
                    'function': NrcScrapedReportFields.full_report_url
                }
            },
            {
                'db_table': '"NrcScrapedReport"',
                'db_field': 'materials_url',
                'db_schema': 'public',
                'sheet_name': 'CALLS',
                'column': None,
                'processing': {
                    'function': NrcScrapedReportFields.materials_url
                }
            },
            {
                'db_table': '"NrcScrapedReport"',
                'db_field': 'time_stamp',
                'db_schema': 'public',
                'sheet_name': 'CALLS',
                'column': None,
                'processing': {
                    'function': NrcScrapedReportFields.time_stamp
                }
            },
            {
                'db_table': '"NrcScrapedReport"',
                'db_field': 'ft_id',
                'db_schema': 'public',
                'sheet_name': 'CALLS',
                'column': None,
                'processing': {
                    'function': NrcScrapedReportFields.ft_id
                }
            }
        ],
        'public."NrcParsedReport"': [
            {
                'db_table': '"NrcParsedReport"',
                'db_field': 'reportnum',
                'db_schema': 'public',
                'sheet_name': 'INCIDENT_COMMONS',
                'column': 'SEQNOS',
                'processing': None
            },
            {
                'db_table': '"NrcParsedReport"',
                'db_field': 'latitude',
                'db_schema': 'public',
                'sheet_name': 'INCIDENT_COMMONS',
                'column': None,
                'processing': {
                    'function': NrcParsedReportFields.latitude,
                    'args': {
                        'col_degrees': 'LAT_DEG',
                        'col_minutes': 'LAT_MIN',
                        'col_seconds': 'LAT_SEC',
                        'col_quadrant': 'LAT_QUAD'
                    }
                }
            },
            {
                'db_table': '"NrcParsedReport"',
                'db_field': 'longitude',
                'db_schema': 'public',
                'sheet_name': 'INCIDENT_COMMONS',
                'column': None,
                'processing': {
                    'function': NrcParsedReportFields.longitude,
                    'args': {
                        'col_degrees': 'LONG_DEG',
                        'col_minutes': 'LONG_MIN',
                        'col_seconds': 'LONG_SEC',
                        'col_quadrant': 'LONG_QUAD'
                    }
                }
            },
            {  # TODO: Implement - check notes about which column to use
                'db_table': '"NrcParsedReport"',
                'db_field': 'areaid',
                'db_schema': 'public',
                'sheet_name': 'INCIDENT_COMMONS',
                'column': None,
                'processing': {
                    'function': NrcParsedReportFields.areaid
                }
            },
            {  # TODO: Implement - check notes about which column to use
                'db_table': '"NrcParsedReport"',
                'db_field': 'blockid',
                'db_schema': 'public',
                'sheet_name': 'INCIDENT_COMMONS',
                'column': None,
                'processing': {
                    'function': NrcParsedReportFields.blockid
                }
            },
            {
                'db_table': '"NrcParsedReport"',
                'db_field': 'zip',
                'db_schema': 'public',
                'sheet_name': 'INCIDENT_COMMONS',
                'column': 'LOCATION_ZIP',
                'processing': None
            },
            {  # TODO: Implement - check notes about which column to use
                'db_table': '"NrcParsedReport"',
                'db_field': 'platform_letter',
                'db_schema': 'public',
                'sheet_name': 'INCIDENT_COMMONS',
                'column': None,
                'processing': {
                    'function': NrcParsedReportFields.platform_letter
                }
            },
            {
                'db_table': '"NrcParsedReport"',
                'db_field': 'sheen_size_length',
                'db_schema': 'public',
                'sheet_name': 'INCIDENT_DETAILS',
                'column': 'SHEEN_SIZE_LENGTH',
                'processing': {
                    'function': NrcParsedReportFields.sheen_size_length,
                    'args': {'unit_field': 'SHEEN_SIZE_LENGTH_UNITS'}
                }
            },
            {
                'db_table': '"NrcParsedReport"',
                'db_field': 'sheen_size_width',
                'db_schema': 'public',
                'sheet_name': 'INCIDENT_DETAILS',
                'column': 'SHEEN_SIZE_WIDTH',
                'processing': {
                    'function': NrcParsedReportFields.sheen_size_width,
                    'args': {'unit_field': 'SHEEN_SIZE_WIDTH_UNITS'}
                }
            },
            {  # TODO: Implement
                'db_table': '"NrcParsedReport"',
                'db_field': 'affected_area',
                'db_schema': 'public',
                'sheet_name': 'INCIDENT_COMMONS',
                'column': None,
                'processing': {
                    'function': NrcParsedReportFields.affected_area,
                }
            },
            {
                'db_table': '"NrcParsedReport"',
                'db_field': 'county',
                'db_schema': 'public',
                'sheet_name': 'INCIDENT_COMMONS',
                'column': 'LOCATION_COUNTY',
                'processing': None
            },
            {
                'db_table': '"NrcParsedReport"',
                'db_field': 'time_stamp',
                'db_schema': 'public',
                'sheet_name': 'CALLS',
                'column': None,
                'processing': {
                    'function': NrcParsedReportFields.time_stamp,
                }
            },
            {
                'db_table': '"NrcParsedReport"',
                'db_field': 'ft_id',
                'db_schema': 'public',
                'sheet_name': 'CALLS',
                'column': None,
                'processing': {
                    'function': NrcParsedReportFields.ft_id,
                }
            }
        ],
        'public."BotTaskStatus"': [
            {
                'db_table': '"BotTaskStatus"',
                'db_field': 'task_id',
                'db_schema': 'public',
                'sheet_name': 'INCIDENT_COMMONS',
                'column': 'SEQNOS',
                'processing': None
            },
            {
                'db_table': '"BotTaskStatus"',
                'db_field': 'status',
                'db_schema': 'public',
                'sheet_name': 'INCIDENT_COMMONS',
                'column': None,
                'processing': {
                    'function': BotTaskStatusFields.status,
                }
            },
            {
                'db_table': '"BotTaskStatus"',
                'db_field': 'status',
                'db_schema': 'public',
                'sheet_name': 'INCIDENT_COMMONS',
                'column': None,
                'processing': {
                    'function': BotTaskStatusFields.bot,
                }
            },
        ],
    }


    #/* ----------------------------------------------------------------------- */#
    #/*     Define Defaults
    #/* ----------------------------------------------------------------------- */#

    # Database
    db_connection_string = None
    db_host = 'localhost'
    db_name = 'skytruth'
    db_user = getpass.getuser()
    db_pass = ''
    db_write_mode = 'INSERT INTO'
    db_seqnos_field = 'reportnum'
    db_null_value = 'NULL'
    sheet_seqnos_field = 'SEQNOS'

    # NRC file I/O
    download_url = 'http://cgmix.uscg.mil/NRC/FOIAFiles/Current.xlsx'
    file_to_process = os.getcwd() + sep + name_current_file(basename(download_url))
    overwrite_downloaded_file = False
    download_file = True
    process_subsample = None
    process_subsample_min = 0

    # User feedback settings
    print_progress = True
    print_queries = False
    execute_queries = True
    final_table_counts = ['public."NrcParsedReport"', 'public."NrcScrapedMaterial"', 'public."NrcScrapedReport"']

    #/* ----------------------------------------------------------------------- */#
    #/*     Parse arguments
    #/* ----------------------------------------------------------------------- */#

    i = 0
    arg_error = False
    while i < len(args):

        try:
            arg = args[i]

            # Help arguments
            if arg in ('--help-info', '-help-info', '--helpinfo', '-help-info'):
                return print_help_info()
            elif arg in ('--help', '-help', '--h', '-h'):
                return print_help()
            elif arg in ('--usage', '-usage'):
                return print_usage()
            elif arg in ('--version', '-version'):
                return print_version()
            elif arg in ('--license', '-usage'):
                return print_license()

            # Spreadsheet I/O
            elif arg == '--no-download':
                i += 1
                download_file = False
            elif arg == '--download-url':
                i += 2
                download_url = args[i - 1]
            elif arg == '--file-to-process':
                i += 2
                file_to_process = abspath(args[i - 1])

            # Database connection
            elif arg == '--db-connection-string':
                i += 2
                db_connection_string = args[i - 1]
            elif arg == '--db-host':
                i += 2
                db_host = args[i - 1]
            elif arg == '--db-user':
                i += 2
                db_user = args[i - 1]
            elif arg == '--db-name':
                i += 2
                db_name = args[i - 1]
            elif arg == '--db-pass':
                i += 2
                db_pass = args[i - 1]

            # Commandline print-outs
            elif arg == '--no-print-progress':
                i += 1
                print_progress = False
            elif arg == '--print-queries':
                i += 1
                print_queries = True
                print_progress = False
            elif arg == '--no-execute-queries':
                i += 1
                execute_queries = False

            # Additional options
            elif arg == '--overwrite-download':
                i += 1
                overwrite_downloaded_file = True
            elif arg == '--subsample':
                i += 2
                process_subsample = args[i - 1]
            elif arg == '--subsample-min':
                i += 2
                process_subsample_min = args[i - 1]

            # Positional arguments and errors
            else:

                # Invalid argument
                i += 1
                arg_error = True
                print("ERROR: Invalid argument: %s" % arg)

        # This catches three conditions:
        #   1. The last argument is a flag that requires parameters but the user did not supply the parameter
        #   2. The arg parser did not properly consume all parameters for an argument
        #   3. The arg parser did not properly iterate the 'i' variable
        except IndexError:
            i += 1
            arg_error = True
            print("ERROR: An argument has invalid parameters")

    #/* ----------------------------------------------------------------------- */#
    #/*     Adjust options
    #/* ----------------------------------------------------------------------- */#

    # Database - must be done here in order to allow the user to overwrite the default credentials and settings
    if db_connection_string is None:
        db_connection_string = "host='%s' dbname='%s' user='%s' password='%s'" % (db_host, db_name, db_user, db_pass)

    #/* ----------------------------------------------------------------------- */#
    #/*     Validate parameters
    #/* ----------------------------------------------------------------------- */#

    bail = False

    # Make sure arguments were properly parse
    if arg_error:
        bail = True
        print("ERROR: Did not successfully parse arguments")

    # Make sure the downloaded file is not going to be accidentally deleted
    if download_file and not overwrite_downloaded_file and isfile(file_to_process):
        bail = True
        print("ERROR: Overwrite=%s and download target exists: %s" % (overwrite_downloaded_file, file_to_process))

    # Make sure the user has write permission to the target directory
    if not os.access(dirname(file_to_process), os.W_OK):
        bail = True
        print("ERROR: Need write permission for download directory: %s" % dirname(file_to_process))

    # Handle subsample
    if process_subsample is not None:
        try:
            process_subsample = int(process_subsample)
            process_subsample_min = int(process_subsample_min)
        except ValueError:
            bail = True
            print("ERROR: Invalid subsample or subsample min - must be an int: %s" % process_subsample)

    # Exit if any problems were encountered
    if bail:
        return 1

    #/* ----------------------------------------------------------------------- */#
    #/*     Prep DB connection and XLRD workbook for processing
    #/* ----------------------------------------------------------------------- */#

    # Test connection
    print("Connecting to DB: %s" % db_connection_string)
    try:
        connection = psycopg2.connect(db_connection_string)
        connection.close()
    except psycopg2.OperationalError as e:
        print("ERROR: Could not connect to database: %s" % db_connection_string)
        print("  Postgres Error: %s" % e)
        return 1

    #/* ----------------------------------------------------------------------- */#
    #/*     Download the spreadsheet
    #/* ----------------------------------------------------------------------- */#

    if download_file:
        print("Downloading: %s" % download_url)
        print("Target: %s" % file_to_process)
        try:
            download(download_url, file_to_process)
        except urllib2.URLError, e:
            print("ERROR: Could not download from URL: %s" % download_url)
            print("       URLLIB Error: %s" % e)
            return 1

    # Prep workbook
    print("Opening workbook: %s" % file_to_process)
    with xlrd.open_workbook(file_to_process, 'r') as workbook:

        # Establish a DB connection  and turn on dict reading
        db_conn = psycopg2.connect(db_connection_string)
        db_cursor = db_conn.cursor(cursor_factory=psycopg2.extras.DictCursor)

        #/* ----------------------------------------------------------------------- */#
        #/*     Validate field map definitions
        #/* ----------------------------------------------------------------------- */#

        validate_field_map_error = False

        print("Validating field mapping ...")
        for db_map in field_map_order:

            # Check each field definition in the set of mappings
            for map_def in field_map[db_map]:

                # Attempt to get the sheet to test
                if map_def['sheet_name'] is not None and map_def['column'] is not None:
                    try:
                        sheet = workbook.sheet_by_name(map_def['sheet_name'])
                        if map_def['column'] not in column_names(sheet):
                            validate_field_map_error = True
                            print("ERROR: Can't find source: %s -> %s.%s"
                                  % (file_to_process, map_def['sheet_name'], map_def['column']))

                    # Could not get the sheet to test
                    except xlrd.XLRDError:
                        validate_field_map_error = True
                        print("ERROR: Sheet does not exist: %s" % map_def['sheet_name'])

                # Make sure schema and table exist in the DB
                query = "SELECT * FROM information_schema.columns WHERE table_schema = '%s' AND table_name = '%s' AND column_name = '%s';" \
                        % (map_def['db_schema'], map_def['db_table'].replace('"', ''), map_def['db_field'])
                db_cursor.execute(query)
                results = db_cursor.fetchall()
                if not results:
                    validate_field_map_error = True
                    print("ERROR: Invalid DB target: %s.%s.%s.%s.%s"
                          % (db_host, db_name, map_def['db_schema'], map_def['db_table'], map_def['db_field']))

        # Encountered an error validating the field map
        if validate_field_map_error:
            db_cursor.close()
            db_conn.close()
            return 1

        #/* ----------------------------------------------------------------------- */#
        #/*     Cache initial DB row counts for final stat printing
        #/* ----------------------------------------------------------------------- */#

        initial_db_row_counts = {ts: db_row_count(db_cursor, ts) for ts in final_table_counts}

        #/* ----------------------------------------------------------------------- */#
        #/*     Additional prep
        #/* ----------------------------------------------------------------------- */#

        # Cache all sheets needed by the field definitions as dictionaries
        print("Caching sheets ...")
        sheet_cache = {}
        raw_sheet_cache = {}
        for sname in workbook.sheet_names():
            if sname not in sheet_cache:
                try:
                    sheet_dict = sheet2dict(workbook.sheet_by_name(sname))
                    raw_sheet_cache[sname] = sheet_dict
                    sheet_cache[sname] = {row[sheet_seqnos_field]: row for row in sheet_dict}
                except IndexError:
                    # Sheet was empty
                    pass

        # Get a list of unique report id's
        unique_report_ids = []
        for s_name, s_rows in sheet_cache.iteritems():
            for reportnum in s_rows.keys():
                unique_report_ids.append(reportnum)
        unique_report_ids = list(set(unique_report_ids))

        # Grab a subsample if necessary
        if process_subsample is not None or process_subsample < len(unique_report_ids):

            # TODO: Delete constraining line - needed to verify everything was wroking
            unique_report_ids = [i for i in unique_report_ids if i > 1074683]

            unique_report_ids.sort()
            unique_report_ids = unique_report_ids[process_subsample_min:process_subsample_min + process_subsample]

        #/* ----------------------------------------------------------------------- */#
        #/*     Process data
        #/* ----------------------------------------------------------------------- */#

        # Loops:
        # Get a report number to process
        #   Get a set of field maps for a single table to process
        #       Get a field map to process

        print("Processing workbook ...")
        num_ids = len(unique_report_ids)
        uid_i = 0

        # Loop through the primary keys
        for uid in unique_report_ids:

            # Update user
            uid_i += 1
            if print_progress:
                sys.stdout.write("\r\x1b[K" + "  %s/%s" % (uid_i, num_ids))
                sys.stdout.flush()

            # Get field maps for one table
            for db_map in field_map_order:

                query_fields = [db_seqnos_field]
                query_values = [str(uid)]

                # If the report already exists, in the target table, skip everything else
                _schema, _table = db_map.split('.')
                if not report_exists(db_cursor=db_cursor, reportnum=uid, schema=_schema, table=_table):

                    # Get a single field map to process
                    for map_def in field_map[db_map]:

                        # Don't need to process the reportnum information since it was added to the initial query above
                        if map_def['db_field'] != db_seqnos_field:

                            # Get the row for this sheet
                            try:
                                row = sheet_cache[map_def['sheet_name']][uid]
                            except KeyError:
                                row = None

                            # If no additional processing is required, simply grab the value from the sheet and add to the query
                            if row is not None:

                                #/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */#
                                #/*     Value goes from input file straight into DB
                                #/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */#

                                if map_def['processing'] is None:
                                    try:
                                        value = row[map_def['column']]
                                    except KeyError:
                                        # UID doesn't appear in the specified sheet - populate a NULL value
                                        value = db_null_value

                                #/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */#
                                #/*     Value with additional processing
                                #/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */#

                                # Pass all necessary information to the processing function in order to get a result
                                else:
                                    value = map_def['processing']['function'](db_cursor=db_cursor, uid=uid, workbook=workbook,
                                                                              row=row, db_null_value=db_null_value,
                                                                              map_def=map_def,
                                                                              sheet=sheet_cache[map_def['sheet_name']],
                                                                              all_field_maps=field_map,
                                                                              sheet_seqnos_field=sheet_seqnos_field,
                                                                              db_write_mode=db_write_mode,
                                                                              print_queries=print_queries,
                                                                              execute_queries=execute_queries,
                                                                              raw_sheet_cache=raw_sheet_cache,
                                                                              db_seqnos_field=db_seqnos_field,
                                                                              sheet_cache=sheet_cache)

                                #/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */#
                                #/*     Add this field map to the insert statement
                                #/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */#

                                # Handle NULL values - these should be handled elsewhere so this is more of a safety net
                                if value is None or not value:
                                    value = db_null_value

                                # Assemble query
                                if value not in ('__NO_QUERY__', db_null_value):
                                    query_fields.append(map_def['db_field'])

                                    # Only put quotes around specific values
                                    if isinstance(value, str) or isinstance(value, unicode):

                                        # Having single quotes in the string causes problems on insert because the entire
                                        # value is single quoted
                                        value = value.replace("'", '"')
                                        query_values.append("'%s'" % value)
                                    else:
                                        query_values.append("%s" % value)

                    #/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */#
                    #/*     Execute query
                    #/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */#

                    # Execute query, but not if the report already exists
                    query = """%s %s (%s) VALUES (%s);""" \
                            % (db_write_mode, db_map, ", ".join(query_fields), ", ".join(query_values))
                    if print_queries:
                        print("")
                        print(query)
                    if execute_queries:
                        db_cursor.execute(query)

        # Done processing - update user
        if print_progress:
            print(" - Done")

    #/* ----------------------------------------------------------------------- */#
    #/*     Cleanup and final return
    #/* ----------------------------------------------------------------------- */#

    # Update user
    padding = max([len(i) for i in field_map.keys()])
    indent = " " * 2
    print("Initial row counts:")
    for schema_table, count in initial_db_row_counts.iteritems():
        print("%s%s%s" % (indent, schema_table + ' ' * (padding - len(schema_table) + 4), count))
    print("Final row counts:")
    final_db_row_counts = {ts: db_row_count(db_cursor, ts) for ts in final_table_counts}
    for schema_table, count in final_db_row_counts.iteritems():
        print("%s%s%s" % (indent, schema_table + ' ' * (padding - len(schema_table) + 4), count))
    print("New rows:")
    for schema_table, count in final_db_row_counts.iteritems():
        print("%s%s%s" % (indent, schema_table + ' ' * (padding - len(schema_table) + 4),
                          final_db_row_counts[schema_table] - initial_db_row_counts[schema_table]))

    # Success - commit inserts and destroy DB connections
    db_conn.commit()
    db_cursor.close()
    db_conn.close()

    return 0


#/* ======================================================================= */#
#/*     Commandline Execution
#/* ======================================================================= */#

if __name__ == '__main__':

    sys.exit(main(sys.argv[1:]))
