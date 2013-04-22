# -*- coding: utf-8 -*-
"""
Created on Fri Jan 18 11:01:33 2013

@author: Craig
"""

# standard modules
import logging

# site modules

# local modules
from DBS3 import DBS3_session


def main():
    session = DBS3_session()
    session.argparser.add_argument(
            'tablename',
            metavar='TABLENAME',
            help='The name of the database table to store')
    args = session.parse_args()

    loglevel = logging.DEBUG if args.verbose else logging.INFO
    logging.basicConfig(level=loglevel)
    logging.debug("args: %s"%(args,))

    try:
        fpath = session.table_to_file(args.tablename)
        session.ship_file(fpath,
                          args.compress,
                          args.bucketname,
                          args.filename,
                          args.public)
    finally:
        session.close()

if __name__ == "__main__":
    main()
