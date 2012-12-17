# FracFocusPublisher

import logging
from optparse import OptionParser
import re
import pprint
import os


# This Utility publishes FracFocus data to the frack.skytruth.org website

#Steps:

#   Get Records from MYSQL
#   Write CSV to ZIP
#   Publish ZIP to Amazon S3
#   Add links to frack.skytruth.org


def publish ():
    tempfile = os.path.join(tempdir, os.path.basename(dest_filename) )
    # create temp file
    # write zip file
    # publish zip to website
    # delete temp file


def write_zip ():
    # connect to db
    # Exec query
    # Iterate over results
        # write to file
    # close file
    # close db connection    

def main ():
    desc = "Publish FracFocus Data to frack.skytruth.org"
    
    usage = """%prog [options] 


    
"""
    parser = OptionParser(description=desc, usage=usage)

    parser.set_defaults(loglevel=logging.INFO)
    parser.add_option("-q", "--quiet",
                          action="store_const", dest="loglevel", const=logging.ERROR, 
                          help="Only output error messages")
    parser.add_option("-v", "--verbose",
                          action="store_const", dest="loglevel", const=logging.DEBUG, 
                          help="Output debugging information")

    (options, args) = parser.parse_args()
    
    if len(args) < 0:
        parser.error("Not enough arguments.")
    elif len(args) > 0:
        parser.error("Too many arguments.")
        

    logging.basicConfig(format='%(levelname)s: %(message)s', level=options.loglevel)

    infile_name = args[0]
    outfile_name = args[1]
    
    print '%s => %s' % (infile_name, outfile_name)
    
    publish ()
    

if __name__ == "__main__":
    main ()