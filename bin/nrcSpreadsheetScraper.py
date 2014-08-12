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
"""


from __future__ import division
from __future__ import print_function

import os
from os.path import *
import sys

import psycopg2
from psycopg2 import extras as psycopg2_extras
import xlrd


#/* ======================================================================= */#
#/*     Document level information
#/* ======================================================================= */#

__all__ = ['__version__', '__release__', '__author__', '__source__', '__package__', '__license__',
           'print_usage', 'print_license', 'print_help', 'print_help_info', 'print_version', 'main']


#/* ======================================================================= */#
#/*     Build information
#/* ======================================================================= */#

__version__ = '0.1-dev'
__release__ = 'August 8, 2014'
__author__ = 'Kevin D. Wurster'
__source__ = 'https://github.com/SkyTruth/scraper'
__package__ = 'scraper'
__docname__ = basename(__file__)
__license__ = '''
New BSD License

Copyright (c) 2014, Kevin D. Wurster
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

* The names of its contributors may not be used to endorse or promote products
  derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
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

    # TODO: Populate usage

    print("""
Usage:
    %s [options]
""" % __docname__)
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
    # TODO: Populate help information
    print("""
Help: {0}
------{1}
    """.format(__docname__, '-' * len(__docname__)))

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
    :type quadrant: str

    :return: decimal degrees
    :rtype: float
    """

    output = degrees + (minutes / 60) + (seconds / 3600)

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
#/*     Define NrcScrapedReportField() class
#/* ======================================================================= */#

class NrcScrapedReportFields(object):
    
    #/* ----------------------------------------------------------------------- */#
    #/*     Define material_name() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def material_name(**kwargs):
        pass
    
    #/* ----------------------------------------------------------------------- */#
    #/*     Define full_report_url() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def full_report_url(**kwargs):

        return 'http://cgmix.uscg.mil/NRC/'
    
    #/* ----------------------------------------------------------------------- */#
    #/*     Define materials_url() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def materials_url(**kwargs):
        
        return NrcScrapedReportFields.full_report_url()
    
    #/* ----------------------------------------------------------------------- */#
    #/*     Define time_stamp() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def time_stamp(**kwargs):

        return None
    
    #/* ----------------------------------------------------------------------- */#
    #/*     Define ft_id() function
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def ft_id(**kwargs):

        return None


#/* ======================================================================= */#
#/*     Define NrcParsedReportFields() class
#/* ======================================================================= */#

class NrcParsedReportFields(object):

    #/* ----------------------------------------------------------------------- */#
    #/*     Define areaid() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def areaid(**kwargs):
        pass
    
    #/* ----------------------------------------------------------------------- */#
    #/*     Define blockid() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def blockid(**kwargs):
        pass
    
    #/* ----------------------------------------------------------------------- */#
    #/*     Define platform_letter() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def platform_letter(**kwargs):
        pass
    
    #/* ----------------------------------------------------------------------- */#
    #/*     Define sheen_size_length() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def sheen_size_length(**kwargs):
        pass
    
    #/* ----------------------------------------------------------------------- */#
    #/*     Define sheen_size_width() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def sheen_size_width(**kwargs):
        pass
    
    #/* ----------------------------------------------------------------------- */#
    #/*     Define affected_area() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def affected_area(**kwargs):
        pass

    #/* ----------------------------------------------------------------------- */#
    #/*     Define time_stamp() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def time_stamp(**kwargs):

        return None
    
    #/* ----------------------------------------------------------------------- */#
    #/*     Define ft_id() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def ft_id(**kwargs):

        return None

    #/* ----------------------------------------------------------------------- */#
    #/*     Define _coord_formatter() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def _coord_formatter(**kwargs):

        try:
            row = kwargs['processing']['args']['row']
            col_deg = kwargs['processing']['args']['col_degrees']
            col_min = kwargs['processing']['args']['col_minutes']
            col_sec = kwargs['processing']['args']['col_seconds']
            col_quad = kwargs['processing']['args']['col_quadrant']
            output = dms2dd(row[col_deg], row[col_min], row[col_sec], row[col_quad])
        except (ValueError, KeyError):
            output = None

        return output

    #/* ----------------------------------------------------------------------- */#
    #/*     Define latitude() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def latitude(**kwargs):

        return NrcParsedReportFields._coord_formatter(**kwargs)

    #/* ----------------------------------------------------------------------- */#
    #/*     Define longitude() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def longitude(**kwargs):

        return NrcParsedReportFields._coord_formatter(**kwargs)


#/* ======================================================================= */#
#/*     Define NrcScrapedMaterialsFields() class
#/* ======================================================================= */#

class NrcScrapedMaterialsFields(object):

    #/* ----------------------------------------------------------------------- */#
    #/*     Define ft_id() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def ft_id(**kwargs):

        return None

    #/* ----------------------------------------------------------------------- */#
    #/*     Define st_id() static method
    #/* ----------------------------------------------------------------------- */#

    @staticmethod
    def st_id(**kwargs):

        return None


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

    #/* ----------------------------------------------------------------------- */#
    #/*     Defaults
    #/* ----------------------------------------------------------------------- */#

    # NRC file
    download_url = 'http://cgmix.uscg.mil/NRC/FOIAFiles/Current.xlsx'
    file_to_process = 'docs/' + basename(download_url)

    # DB connection parameters
    db_host = 'ewn3'
    db_name = 'skytruth'
    db_user = 'scraper'
    db_pass = ''
    db_write_mode = 'REPLACE'

    #/* ----------------------------------------------------------------------- */#
    #/*     Containers
    #/* ----------------------------------------------------------------------- */#

    db_connection_string = None

    # === Field Map === #
    field_map_NrcScrapedReport = [
        {
            'db_table': 'NrcScrapedReport',
            'db_field': 'reportnum',
            'db_schema': 'public',
            'sheet_name': 'CALLS',
            'column': 'SEQNOS',
            'processing': None
        },
        {
            'db_table': 'NrcScrapedReport',
            'db_field': 'received_datetime',
            'db_schema': 'public',
            'sheet_name': 'CALLS',
            'column': 'DATE_TIME_RECEIVED',
            'processing': None
        },
        {
            'db_table': 'NrcScrapedReport',
            'db_field': 'calltype',
            'db_schema': 'public',
            'sheet_name': 'CALLS',
            'column': 'CALLTYPE',
            'processing': None
        },
        {
            'db_table': 'NrcScrapedReport',
            'db_field': 'suspected_responsible_company',
            'db_schema': 'public',
            'sheet_name': 'CALLS',
            'column': 'RESPONSIBLE_COMPANY',
            'processing': None
        },
        {
            'db_table': 'NrcScrapedReport',
            'db_field': 'description',
            'db_schema': 'public',
            'sheet_name': 'INCIDENT_COMMONS',
            'column': 'DESCRIPTION_OF_INCIDENT',
            'processing': None
        },
        {
            'db_table': 'NrcScrapedReport',
            'db_field': 'incident_datetime',
            'db_schema': 'public',
            'sheet_name': 'INCIDENT_COMMONS',
            'column': 'INCIDENT_DATE_TIME',
            'processing': None
        },
        {
            'db_table': 'NrcScrapedReport',
            'db_field': 'incidenttype',
            'db_schema': 'public',
            'sheet_name': 'INCIDENT_COMMONS',
            'column': 'TYPE_OF_INCIDENT',
            'processing': None
        },
        {
            'db_table': 'NrcScrapedReport',
            'db_field': 'cause',
            'db_schema': 'public',
            'sheet_name': 'INCIDENT_COMMONS',
            'column': 'INCIDENT_CAUSE',
            'processing': None
        },
        {
            'db_table': 'NrcScrapedReport',
            'db_field': 'location',
            'db_schema': 'public',
            'sheet_name': 'INCIDENT_COMMONS',
            'column': 'LOCATION_ADDRESS',
            'processing': None
        },
        {
            'db_table': 'NrcScrapedReport',
            'db_field': 'state',
            'db_schema': 'public',
            'sheet_name': 'INCIDENT_COMMONS',
            'column': 'LOCATION_STATE',
            'processing': None
        },
        {
            'db_table': 'NrcScrapedReport',
            'db_field': 'nearestcity',
            'db_schema': 'public',
            'sheet_name': 'INCIDENT_COMMONS',
            'column': 'LOCATION_NEAREST_CITY',
            'processing': None
        },
        {
            'db_table': 'NrcScrapedReport',
            'db_field': 'county',
            'db_schema': 'public',
            'sheet_name': 'INCIDENT_COMMONS',
            'column': 'LOCATION_COUNTY',
            'processing': None
        },
        {
            'db_table': 'NrcScrapedReport',
            'db_field': 'medium_affected',
            'db_schema': 'public',
            'sheet_name': 'INCIDENT_DETAILS',
            'column': 'MEDIUM_DESC',
            'processing': None
        },
        {
            'db_table': 'NrcScrapedReport',
            'db_field': 'material_name',
            'db_schema': 'public',
            'sheet_name': 'MATERIAL_INVOLVED',
            'column': 'NAME_OF_MATERIAL',
            'processing': {
                'function': NrcScrapedReportFields.material_name,
                'args': {
                    'extras_table': 'NrcScrapedMaterial'
                }
            }
        },
        {
            'db_table': 'NrcScrapedReport',
            'db_field': 'full_report_url',
            'db_schema': 'public',
            'sheet_name': None,
            'column': None,
            'processing': {
                'function': NrcScrapedReportFields.full_report_url
            }
        },
        {
            'db_table': 'NrcScrapedReport',
            'db_field': 'materials_url',
            'db_schema': 'public',
            'sheet_name': None,
            'column': None,
            'processing': {
                'function': NrcScrapedReportFields.materials_url
            }
        },
        {
            'db_table': 'NrcScrapedReport',
            'db_field': 'time_stamp',
            'db_schema': 'public',
            'sheet_name': None,
            'column': None,
            'processing': {
                'function': NrcScrapedReportFields.time_stamp
            }
        },
        {
            'db_table': 'NrcScrapedReport',
            'db_field': 'ft_id',
            'db_schema': 'public',
            'sheet_name': None,
            'column': None,
            'processing': {
                'function': NrcScrapedReportFields.ft_id
            }
        }
    ]

    # === Field Map === #
    field_map_NrcParsedReport = [
        {
            'db_table': 'NrcParsedReport',
            'db_field': 'reportnum',
            'db_schema': 'public',
            'sheet_name': 'INCIDENT_COMMONS',
            'column': 'SEQNOS',
            'processing': None
        },
        {
            'db_table': 'NrcParsedReport',
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
            'db_table': 'NrcParsedReport',
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
            'db_table': 'NrcParsedReport',
            'db_field': 'areaid',
            'db_schema': 'public',
            'sheet_name': 'INCIDENT_COMMONS',
            'column': None,
            'processing': {
                'function': NrcParsedReportFields.areaid
            }
        },
        {  # TODO: Implement - check notes about which column to use
            'db_table': 'NrcParsedReport',
            'db_field': 'blockid',
            'db_schema': 'public',
            'sheet_name': 'INCIDENT_COMMONS',
            'column': None,
            'processing': {
                'function': NrcParsedReportFields.blockid
            }
        },
        {
            'db_table': 'NrcParsedReport',
            'db_field': 'zip',
            'db_schema': 'public',
            'sheet_name': 'INCIDENT_COMMONS',
            'column': 'LOCATION_ZIP',
            'processing': None
        },
        {  # TODO: Implement - check notes about which column to use
            'db_table': 'NrcParsedReport',
            'db_field': 'blockid',
            'db_schema': 'public',
            'sheet_name': 'INCIDENT_COMMONS',
            'column': None,
            'processing': {
                'function': NrcParsedReportFields.platform_letter
            }
        },
        {  # TODO: Implement
            'db_table': 'NrcParsedReport',
            'db_field': 'sheen_size_length',
            'db_schema': 'public',
            'sheet_name': 'INCIDENT_COMMONS',
            'column': 'SHEEN_SIZE_LENGTH',
            'processing': {
                'function': NrcParsedReportFields.sheen_size_length,
                'args': {'unit_field': 'SHEEN_SIZE_UNITS'}
            }
        },
        {  # TODO: Implement
            'db_table': 'NrcParsedReport',
            'db_field': 'sheen_size_width',
            'db_schema': 'public',
            'sheet_name': 'INCIDENT_COMMONS',
            'column': 'SHEEN_SIZE_WIDTH',
            'processing': {
                'function': NrcParsedReportFields.sheen_size_width,
                'args': {'unit_field': 'SHEEN_SIZE_UNITS'}
            }
        },
        {  # TODO: Implement
            'db_table': 'NrcParsedReport',
            'db_field': 'affected_area',
            'db_schema': 'public',
            'sheet_name': 'INCIDENT_COMMONS',
            'column': None,
            'processing': {
                'function': NrcParsedReportFields.affected_area,
            }
        },
        {
            'db_table': 'NrcParsedReport',
            'db_field': 'county',
            'db_schema': 'public',
            'sheet_name': 'INCIDENT_COMMONS',
            'column': 'INCIDENT_COUNTY',
            'processing': None
        },
        {
            'db_table': 'NrcParsedReport',
            'db_field': 'time_stamp',
            'db_schema': 'public',
            'sheet_name': None,
            'column': None,
            'processing': {
                'function': NrcParsedReportFields.time_stamp,
            }
        },
        {
            'db_table': 'NrcParsedReport',
            'db_field': 'ft_id',
            'db_schema': 'public',
            'sheet_name': None,
            'column': None,
            'processing': {
                'function': NrcParsedReportFields.ft_id,
            }
        }
    ]

    # === Field Map === #
    field_map_NrcScrapedMaterials = [
        {
            'db_table': 'NrcScrapedMaterials',
            'db_field': 'reportnum',
            'db_schema': 'public',
            'sheet_name': 'MATERIAL_INV0LVED_CR',
            'column': 'SEQNOS',
            'processing': None
        },
        {
            'db_table': 'NrcScrapedMaterials',
            'db_field': 'chris_code',
            'db_schema': 'public',
            'sheet_name': 'MATERIAL_INV0LVED_CR',
            'column': 'CHRIS_CODE',
            'processing': None
        },
        {
            'db_table': 'NrcScrapedMaterials',
            'db_field': 'name',
            'db_schema': 'public',
            'sheet_name': 'MATERIAL_INV0LVED_CR',
            'column': 'NAME_OF_MATERIAL',
            'processing': None
        },
        {
            'db_table': 'NrcScrapedMaterials',
            'db_field': 'amount',
            'db_schema': 'public',
            'sheet_name': 'MATERIAL_INV0LVED_CR',
            'column': 'UPPER_BOUNDS',
            'processing': None
        },
        {
            'db_table': 'NrcScrapedMaterials',
            'db_field': 'unit',
            'db_schema': 'public',
            'sheet_name': 'MATERIAL_INV0LVED_CR',
            'column': 'UPPER_BOUNDS_UNITS',
            'processing': None
        },
        {
            'db_table': 'NrcScrapedMaterials',
            'db_field': 'reached_water',
            'db_schema': 'public',
            'sheet_name': 'MATERIAL_INV0LVED_CR',
            'column': 'IF_REACHED_WATER',
            'processing': None
        },
        {
            'db_table': 'NrcScrapedMaterials',
            'db_field': 'amt_in_water',
            'db_schema': 'public',
            'sheet_name': 'MATERIAL_INV0LVED_CR',
            'column': 'AMOUNT_IN_WATER',
            'processing': None
        },
        {
            'db_table': 'NrcScrapedMaterials',
            'db_field': 'amt_in_water_unit',
            'db_schema': 'public',
            'sheet_name': 'MATERIAL_INV0LVED_CR',
            'column': 'UNIT_OF_MEASURE_IF_REACH_WATER',
            'processing': None
        },
        {
            'db_table': 'NrcScrapedMaterials',
            'db_field': 'ft_id',
            'db_schema': 'public',
            'sheet_name': None,
            'column': None,
            'processing': {
                'function': NrcScrapedMaterialsFields.ft_id
            }
        },
        {
            'db_table': 'NrcScrapedMaterials',
            'db_field': 'st_id',
            'db_schema': 'public',
            'sheet_name': None,
            'column': None,
            'processing': {
                'function': NrcScrapedMaterialsFields.st_id
            }
        }
    ]


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

            elif arg == 'go':
                i += 1
                pass

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
    #/*     Validate parameters
    #/* ----------------------------------------------------------------------- */#

    bail = False

    # Make sure arguments were properly parse
    if arg_error:
        bail = True
        print("ERROR: Did not successfully parse arguments")

    # Check the input file
    if not os.access(file_to_process, os.R_OK):
        bail = True
        print("ERROR: Can't access input file: %s" % file_to_process)

    # Exit if any problems were encountered
    if bail:
        return 1

    #/* ----------------------------------------------------------------------- */#
    #/*     Prep DB connection and XLRD workbook for processing
    #/* ----------------------------------------------------------------------- */#

    # Allow user to provide a complete DB connection string
    if db_connection_string is None:
        db_connection_string = "host='%s' dbname='%s' user='%s' password='%s'" % (db_host, db_name, db_user, db_pass)

    # Test connection
    try:
        connection = psycopg2.connect(db_connection_string)
        connection.close()
    except psycopg2.OperationalError as e:
        print("ERROR: Could not connect to database: %s" % db_connection_string)
        print("  Postgres Error: %s" % e)
        return 1

    # Prep workbook
    with xlrd.open_workbook(file_to_process, 'r') as workbook:

        # Establish a DB connection  and turn on dict reading
        db_conn = psycopg2.connect(db_connection_string)
        db_cursor = db_conn.cursor(cursor_factory=psycopg2_extras.DictCursor)

        #/* ----------------------------------------------------------------------- */#
        #/*     Validate field map definitions
        #/* ----------------------------------------------------------------------- */#

        validate_field_map_error = False

        print("Validating field mapping ...")
        for db_map in (field_map_NrcScrapedMaterials, field_map_NrcScrapedReport, field_map_NrcParsedReport):

            # Check each field definition in the set of mappings
            for map_def in db_map:

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
                        % (map_def['db_schema'], map_def['db_table'], map_def['db_field'])
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
                #/*     Process data
                #/* ----------------------------------------------------------------------- */#

    #/* ----------------------------------------------------------------------- */#
    #/*     Cleanup and final return
    #/* ----------------------------------------------------------------------- */#

    # Success
    db_cursor.close()
    db_conn.close()
    return 0


#/* ======================================================================= */#
#/*     Commandline Execution
#/* ======================================================================= */#

if __name__ == '__main__':

    # Not enough arguments - print usage
    if len(sys.argv) is 1:
        sys.exit(print_usage())

    # Got enough arguments - give all but the first to the main() function
    else:
        sys.exit(main(sys.argv[1:]))
