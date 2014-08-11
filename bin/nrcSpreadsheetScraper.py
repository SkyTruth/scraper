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

import json
from os.path import *
import psycopg2
import sys
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
    file_to_process = basename(download_url)

    # DB connection parameters
    db_host = 'ewn3'
    db_name = 'skytruth'
    db_user = 'scraper'
    db_pass = ''

    #/* ----------------------------------------------------------------------- */#
    #/*     Containers
    #/* ----------------------------------------------------------------------- */#

    db_connection_string = None

    # Field map describing which field on which sheet maps to which field in which table
    field_map_workbook_to_db = [

        # -={ Table: NrcScrapedReport }=- #
        {
            'sheet': 'CALLS',
            'field': 'SEQNOS',
            'db_field': 'reportnum',
            'db_schema': 'public',
            'db_table': 'NrcScrapedReport'
        },
        {
            'sheet': 'CALLS',
            'field': 'DATE_TIME_RECEIVED',
            'db_field': 'received_datetime',
            'db_schema': 'public',
            'db_table': 'NrcScrapedReport'
        },
        {
            'sheet': 'CALLS',
            'field': 'CALLTYPE',
            'db_field': 'calltype',
            'db_schema': 'public',
            'db_table': 'NrcScrapedReport'
        },
        {
            'sheet': 'CALLS',
            'field': 'RESPONSIBLE_COMPANY',
            'db_field': 'suspected_responsible_company',
            'db_schema': 'public',
            'db_table': 'NrcScrapedReport'
        },
        {
            'sheet': 'INCIDENT_COMMONS',
            'field': 'DESCRIPTION_OF_INCIDENT',
            'db_field': 'description',
            'db_schema': 'public',
            'db_table': 'NrcScrapedReport'
        },
        {
            'sheet': 'INCIDENT_COMMONS',
            'field': 'INCIDENT_DATE_TIME',
            'db_field': 'incident_datetime',
            'db_schema': 'public',
            'db_table': 'NrcScrapedReport'
        },
        {
            'sheet': 'INCIDENT_COMMONS',
            'field': 'TYPE_OF_INCIDENT',
            'db_field': 'incidenttype',
            'db_schema': 'public',
            'db_table': 'NrcScrapedReport'
        },
        {
            'sheet': 'INCIDENT_COMMONS',
            'field': 'INCIDENT_CAUSE',
            'db_field': 'cause',
            'db_schema': 'public',
            'db_table': 'NrcScrapedReport'
        },
        {
            'sheet': 'INCIDENT_COMMONS',
            'field': 'LOCATION_ADDRESS',
            'db_field': 'location',
            'db_schema': 'public',
            'db_table': 'NrcScrapedReport'
        },
        {
            'sheet': 'INCIDENT_COMMONS',
            'field': 'LOCATION_STATE',
            'db_field': 'state',
            'db_schema': 'public',
            'db_table': 'NrcScrapedReport'
        },
        {
            'sheet': 'INCIDENT_COMMONS',
            'field': 'LOCATION_NEAREST_CITY',
            'db_field': 'nearestcity',
            'db_schema': 'public',
            'db_table': 'NrcScrapedReport'
        },
        {
            'sheet': 'INCIDENT_COMMONS',
            'field': 'LOCATION_COUNTY',
            'db_field': 'county',
            'db_schema': 'public',
            'db_table': 'NrcScrapedReport'
        },
        {
            'sheet': 'INCIDENT_DETAILS',
            'field': 'MEDIUM_DESC',
            'db_field': 'medium_affected',
            'db_schema': 'public',
            'db_table': 'NrcScrapedReport'
        },

        # -={ Table: NrcParsedReport }=- #
        {
            'sheet': 'INCIDENT_COMMONS',
            'field': 'SEQNOS',
            'db_field': 'reportnum',
            'db_schema': 'public',
            'db_table': 'NrcParsedReport'
        },
        {
            'sheet': 'INCIDENT_COMMONS',
            'field': 'LOCATION_ZIP',
            'db_field': 'zip',
            'db_schema': 'public',
            'db_table': 'NrcParsedReport'
        },
        {
            'sheet': 'INCIDENT_COMMONS',
            'field': 'INCIDENT_COUNTY',
            'db_field': 'county',
            'db_schema': 'public',
            'db_table': 'NrcParsedReport'
        },

        # -={ Table: NrcScrapedMaterials }=- #
        {
            'sheet': 'MATERIAL_INVOLVED_CR',
            'field': 'SEQNOS',
            'db_field': 'reportnum',
            'db_schema': 'public',
            'db_table': 'NrcScrapedMaterials'
        },
        {
            'sheet': 'MATERIAL_INVOLVED_CR',
            'field': 'CHRIS_CODE',
            'db_field': 'chris_code',
            'db_schema': 'public',
            'db_table': 'NrcScrapedMaterials'
        },
        {
            'sheet': 'MATERIAL_INVOLVED_CR',
            'field': 'NAME_OF_MATERIAL',
            'db_field': 'name',
            'db_schema': 'public',
            'db_table': 'NrcScrapedMaterials'
        },
        {
            'sheet': 'MATERIAL_INVOLVED_CR',
            'field': 'UPPER_BOUNDS',
            'db_field': 'amount',
            'db_schema': 'public',
            'db_table': 'NrcScrapedMaterials'
        },
        {
            'sheet': 'MATERIAL_INVOLVED_CR',
            'field': 'UPPER_BOUNDS_UNITS',
            'db_field': 'unit',
            'db_schema': 'public',
            'db_table': 'NrcScrapedMaterials'
        },
        {
            'sheet': 'MATERIAL_INVOLVED_CR',
            'field': 'IF_REACHED_WATER',
            'db_field': 'reached_water',
            'db_schema': 'public',
            'db_table': 'NrcScrapedMaterials'
        },
        {
            'sheet': 'MATERIAL_INVOLVED_CR',
            'field': 'AMOUNT_IN_WATER',
            'db_field': 'amt_in_water',
            'db_schema': 'public',
            'db_table': 'NrcScrapedMaterials'
        },
        {
            'sheet': 'MATERIAL_INVOLVED_CR',
            'field': 'UNIT_OF_MEASURE_IF_REACH_WATER',
            'db_field': 'amt_in_water_unit',
            'db_schema': 'public',
            'db_table': 'NrcScrapedMaterials'
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
            elif arg == '-db-host':
                i += 2
                db_host = args[i - 1]
            elif arg == '-db-user':
                i += 2
                db_user = args[i - 1]
            elif arg == '-db-name':
                i += 2
                db_name = args[i - 1]
            elif arg == '-db-pass':
                i += 2
                db_pass = args[i - 1]

            # User defined field map: NrcParsedReport
            elif '-field-map-NrcParsedReport' in arg:
                i += 2
                try:
                    field_map_NrcParsedReport = json.loads(args[i - 1])
                except ValueError:
                    arg_error = True
                    print("ERROR: Field map for NrcParsedReport Report is not JSON compliant")

            # User defined field map: NrcScrapedMaterials
            elif '-field-map-NrcScrapedMaterials' in arg:
                i += 2
                try:
                    field_map_NrcScrapedMaterials = json.loads(args[i - 1])
                except ValueError:
                    arg_error = True
                    print("ERROR: Field map for NrcScrapedMaterials is not JSON compliant")

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

    #/* ----------------------------------------------------------------------- */#
    #/*     Prep DB connection and XLRD workbook for processing
    #/* ----------------------------------------------------------------------- */#

    # Allow user to provide a complete DB connection string
    if db_connection_string is None:
        db_connection_string = "host='%s' dbname='%s' user='%s' password='%s'" % (db_host, db_name, db_user, db_pass)

    # Connect to DB
    with psycopg2.connect(db_connection_string) as db_conn:

        # Establish DB cursor using the DictCursor so that queries are received as a dict
        with db_conn.cursor(cursor_factory=psycopg2.extras.DictCursor) as db_cursor:

            # Prep workbook
            with xlrd.open_workbook(file_to_process) as workbook:

                #/* ----------------------------------------------------------------------- */#
                #/*     Prep workbook for processing
                #/* ----------------------------------------------------------------------- */#

                for sheet_name in ()

    #/* ----------------------------------------------------------------------- */#
    #/*     Cleanup and final return
    #/* ----------------------------------------------------------------------- */#

    # Success
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
