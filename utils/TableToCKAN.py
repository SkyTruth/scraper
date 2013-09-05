# -*- coding: utf-8 -*-
"""
Created on Wed Aug 28 11:58:29 2013

@author: Craig
"""

# standard modules
import logging
import argparse
import tempfile
import os.path

# site modules

# local modules
import settings
import database
import ckanAccess

# CONSTANTS
TRANSFERSIZE = 25

"""
Logic:
    given tablename
    check if tablename exists on ckan
    if not
        create ckan table from db info
    get full table or query from table to tsv
    Transfer data from tsv to ckan
"""



# standard modules

# site modules

# local modules


def get_args():
    parser = argparse.ArgumentParser(
            description=
            'tableToCKAN transfers the contents of a database query '
            'to an analogous CKAN datastore.')

    parser.add_argument('-v',
                        dest='verbose',
                        action='store_true',
                        default=False,
                        help='Enables debug output to log'
                       )

    parser.add_argument('--create-set',
                        action='store_true',
                        default=False,
                        help='Enables creation of a new dataset'
                       )

    parser.add_argument('--create-store',
                        action='store_true',
                        default=False,
                        help='Enables creation of a new datastore'
                       )

    parser.add_argument('--as',
                        dest='dstore_nm', metavar='DATASTORE_NAME',
                        help='Provide an alternative name for the datastore. '
                             'By default the datastore '
                             'is named after the table.'
                       )

    parser.add_argument('dataset',
                        help='The name of the CKAN dataset to hold the table. '
                             'One dataset typically holds several datastores. '
                             'The dataset must exist or --create-set must '
                             'be specified. '
                       )
    parser.add_argument('tablename',
                        help='The database table to be transferred to the '
                             'CKAN datastore.  The datastore is named after '
                             'the table.  It must exist or --create-store '
                             'must be specified.'
                       )
    args = parser.parse_args()
    return args

#XXX We want to break out a DBCKAN module/class for most of this code
#    as with DBS3.py
def main():
    args = get_args()
    table_nm = args.tablename
    dataset = args.dataset
    dstore_nm = args.dstore_nm if args.dstore_nm else table_nm

    loglevel = logging.DEBUG if args.verbose else logging.INFO
    logging.basicConfig(level=loglevel)
    logging.debug("args: %s"%(args,))

    db = database.Database(settings.DB_HOST,
                           settings.DB_USER,
                           settings.DB_PASSWD,
                           settings.DB_DATABASE)

    if table_nm == 'FracFocusReport':
        exclude_fields = ('api_old')
    else:
        exclude_fields = ()
    fields = db.get_table_fields(table_nm, exclude_fields=exclude_fields)
    field_nms = [f[0] for f in fields]

    tempdir = tempfile.mkdtemp()
    fpath = os.path.join(tempdir, table_nm+'.txt')
    try:
        fp = open(fpath, "wb")
        db.table_to_tsv(table_nm, fp, field_nms)
    finally:
        fp.close()

    # Initialize a CKAN session
    CKANsession = ckanAccess.CKANaccess(settings.CKAN_BASE_URL,
                                        settings.CKAN_KEY)

    # Acquire the dataset object
    try:
        dset = CKANsession.get_dataset(dataset)
    except ckanAccess.CKANerror:
        if not args.create_set:
            raise
        dset = CKANsession.create_dataset(dataset,
                **{
                'title': 'Skytruth dataset {}'.format(dataset),
                'url': 'http://skytruth.org'
                })
    # Acquire the datastore object
    try:
        dstore = dset.get_datastore(dstore_nm)
    except ckanAccess.CKANerror:
        if not args.create_store:
            raise
        ds_fields = [dict(zip(('id', 'type'), f)) for f in fields]
        pks = db.get_table_primarykey(table_nm)
        dstore = dset.create_datastore(dstore_nm,
                **{
                'fields': ds_fields,
                'primary_key': pks
                })

    # Transfer the records in blocks of TRANSFERSIZE
    try:
        fp = open(fpath)
        fp.readline()  # Skip header record
        records = []
        record_count = 0
        for line in fp:
            if line:
                record_count += 1
                records.append(line)
            if record_count % TRANSFERSIZE == 0:
                logging.debug("TableToCKAN: transferring {} records."
                             .format(len(records)))
                dstore.transfer_tsv_records(field_nms, records)
                records = []
    finally:
        fp.close()
    if records:
            logging.debug("TableToCKAN: transferring {} records."
                         .format(len(records)))
            dstore.transfer_tsv_records(field_nms, records)

if __name__ == "__main__":
    main()
