# -*- coding: utf-8 -*-
"""
Created on Thu Sep 05 11:37:49 2013

@author: Craig
"""

# standard modules
import logging
import argparse
import pprint
import sys

# site modules

# local modules
import settings
import ckanAccess

# CONSTANTS
LIST = 'list'
CREATE = 'create'
DELETE = 'delete'


# standard modules

# site modules

# local modules


def get_args():
    parser = argparse.ArgumentParser(
            description=
            'ckanUtil provides maintenance functions for the CKAN site.\n'
            '  {} <dataset>\n'
            '  {} <dataset | datastore>\n'
            "  {} <dataset> | 'all'".format(CREATE, DELETE, LIST))

    parser.add_argument('command',
                        choices=('create', 'delete', 'list'),
                        help='The type of operation to execute. (required)'
                       )
    parser.add_argument('name',
                        help='The ckan object to operate on. '
                             'Either a dataset name or a datastore '
                             'identified as "dataset_name/datastore_name". '
                             "The 'list' command accepts the value 'all' "
                             'in which case it will list all dataset names. '
                       )
    parser.add_argument('-v',
                        dest='verbose',
                        action='store_true',
                        default=False,
                        help='Enables debug output to log'
                       )

    args = parser.parse_args()
    return args


def main():
    args = get_args()
    cmd = args.command
    name = args.name

    loglevel = logging.DEBUG if args.verbose else logging.INFO
    logging.basicConfig(level=loglevel)
    logging.debug("args: %s"%(args,))

    if name=='all':
        if cmd != LIST:
            raise ckanAccess.CKANerror(
                    "name 'all' is only allowed for 'list' command"
                    .format(cmd))
        name = ''
    if '/' in name:
        if cmd == CREATE:
            raise ckanAccess.CKANerror(
                    "Cannot create a datastore (try TableToCKAN utility).")
        dset_nm, dstore_nm = name.split('/', 1)
    else:
        dset_nm, dstore_nm = name, ""

    # Initialize a CKAN session and acquire named objects
    dset = dstore = None
    CKANsession = ckanAccess.CKANaccess(settings.CKAN_BASE_URL,
                                        settings.CKAN_KEY)
    if dset_nm:
        if cmd == CREATE and CKANsession.dataset_exists(dset_nm):
            raise ckanAccess.CKANerror(
                    "Cannot create dataset '{}', it already exists."
                    .format(dset_nm))
        dset = CKANsession.get_dataset(dset_nm, create=cmd==CREATE)
    if dstore_nm:
        dstore = dset.get_datastore(dstore_nm)

    # Execute the command
    if cmd == LIST:
        if dset:
            list = dset.get_datastore_list()
        else:
            list = CKANsession.get_dataset_list()
        pprint.pprint(list, sys.stdout, 2)

    if cmd == CREATE:
        # created by call to get_dataset
        pass
    if cmd == DELETE:
        if dstore:
            dset.delete_datastore(dstore.datastore_nm)
        else:
            CKANsession.delete_dataset(dset.dataset_nm)


if __name__ == "__main__":
    main()
