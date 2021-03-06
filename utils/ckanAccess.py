# -*- coding: utf-8 -*-
"""
Created on Wed Aug 28 11:46:55 2013

@author: Craig
"""

# standard modules
import json
import logging
import pprint
import urllib
import urllib2

# site modules

# local modules

# CONSTANTS


# CKAN structure:
# A CKAN site has a number of datasets
# Each dataset is a collection of datafiles and datastores
# Datafiles are simply uploade files of any format.
# A datastore is analogous to a database table.
# This module is mainly concerned with datastores.
#
# CKAN data types:
# http://docs.ckan.org/en/ckan-2.0.2/datastore-api.html#field-types
# The DataStore supports all types supported by PostgreSQL as well as
# a few additions.
# The json type has been added as a storage for nested data.
#

class CKANerror(Exception):
    pass

class CKANaccess(object):
    def __init__(self, base_url, ckan_key):
        self.base_url = base_url
        if base_url[-1] != '/': self.base_url += '/'
        self.ckan_key = ckan_key
        self.dataset_list = None

    def _send_request(self, action, request_dict):
        url = self.base_url + 'api/3/action/' + action
        logging.info('ckan request: {}'.format(url))
        logging.debug('ckan request dict\n{}'
                     .format(pprint.pformat(request_dict)))
        request = urllib2.Request(url)
        request.add_header('Authorization', self.ckan_key)
        request_string = urllib.quote(json.dumps(request_dict))
        response = urllib2.urlopen(request, request_string)
        if response.code != 200:
            raise CKANerror("Invalid response code {}".format(response.code))

        # Load and verify CKAN's response.
        response_dict = json.loads(response.read())
        if response_dict['success'] is not True:
            raise CKANerror("Request failed for {}\n{}"
                            .format(url, response_dict['error']))
        logging.debug('ckan result:\n{}'
                     .format(pprint.pformat(response_dict['result'])))
        return response_dict['result']

    def get_dataset_list(self):
        if self.dataset_list is None:
            request_dict = {}
            result = self._send_request('package_list', request_dict)
            self.dataset_list = result
            logging.debug('dataset_list\n{}'.format(
                    pprint.pformat(self.dataset_list)))
        return self.dataset_list

    def _clear_dataset_list(self):
        # called when datasets created or destroyed
        self.dataset_list = None

    def dataset_exists(self, dataset_nm):
        return dataset_nm in self.get_dataset_list()

    def create_dataset(self, name, **kwargs):
        if self.dataset_exists(name):
            raise CKANerror("Cannot create: dataset '{}' exists".format(name))
        request_dict = dict(kwargs)
        request_dict['name'] = name
        self._send_request('package_create', request_dict)
        self._clear_dataset_list()
        return self.get_dataset(name)

    def get_dataset(self, name, create=False):
        if not self.dataset_exists(name):
            if not create:
                raise CKANerror("Cannot get: dataset '{}' does not exist"
                                .format(name))
            return self.create_dataset(name)
        request_dict = {'id': name}
        result = self._send_request('package_show', request_dict)
        logging.debug('dataset dict\n{}'
                     .format(pprint.pformat(request_dict)))
        return CKANdataset(self, name, result)

    def delete_dataset(self, name):
        if not self.dataset_exists(name):
            raise CKANerror("Cannot delete: dataset '{}' does not exist"
                            .format(name))
        request_dict = {'id': name}
        self._send_request('package_delete', request_dict)
        self._clear_dataset_list()

class CKANdataset(object):
    def __init__(self, access, dataset_nm, dataset_dict):
        self.access = access
        self.dataset_nm = dataset_nm
        self.dataset_id = dataset_dict['id']
        self.resource_list = None
        self.datastore_dict = None
        self.alias_list = None
        self._get_resource_list(dataset_dict)

    def _get_resource_list(self, dataset_dict=None):
        if self.resource_list is None:
            if dataset_dict is None:
                request_dict = {'id': self.dataset_id}
                dataset_dict = self.access._send_request('package_show',
                                                         request_dict)
            self.resource_list = [dsr['id']
                                 for dsr in dataset_dict['resources']]
            logging.debug('resource_list\n{}'.format(
                    pprint.pformat(self.resource_list)))
        return self.resource_list

    def _get_datastore_dict(self):
        if self.datastore_dict is None:
            rlist = self._get_resource_list()
            request_dict = {'resource_id': '_table_metadata'}
            response_dict = self.access._send_request('datastore_search',
                                                    request_dict)
            self.alias_list = [rec['name']
                               for rec in response_dict['records']
                               if rec['alias_of']]
            self.datastore_dict = dict([(rec['name'], rec['alias_of'])
                                  for rec in response_dict['records']
                                  if (rec['name'] in rlist or
                                      rec['alias_of'] in rlist)])
            logging.debug('datastore_dict\n{}'.format(
                    pprint.pformat(self.datastore_dict)))
        return self.datastore_dict

    def get_datastore_list(self):
        return self._get_datastore_dict().keys()

    def _clear_datastore_dict(self):
        # called when datasets created or destroyed
        self.datastore_dict = None
        self.resource_list = None
        self.alias_list = None

    def datastore_exists(self, datastore_nm):
        return datastore_nm in self._get_datastore_dict()
    def alias_exists(self, datastore_nm):
        self._get_datastore_dict()  # update lists
        return datastore_nm in self.alias_list

    def _create_resource(self, name, **kwargs):
        request_dict = dict(kwargs)
        request_dict.update({
                'package_id': self.dataset_id,
                'url': 'http://skytruth.org',
                'name': name,
                })
        resource = self.access._send_request('resource_create', request_dict)
        return resource

    def create_datastore(self, datastore_nm, **kwargs):
        if self.datastore_exists(datastore_nm):
            raise CKANerror("Cannot create; datastore '{}' exists"
                            .format(datastore_nm))
        if self.alias_exists(datastore_nm):
            raise CKANerror("Cannot create; alias '{}' already in use."
                            .format(datastore_nm))
        # return a CKANdatastore object
        # fields is a list of dicts [{'id':'fieldnm', 'type':'integer'}, ...]
        resource = self._create_resource(datastore_nm)
        request_dict = dict(kwargs)
        request_dict.update({
                'resource_id': resource['id'],
                'aliases': datastore_nm,
                })
        datastore = self.access._send_request('datastore_create', request_dict)
        logging.debug('datastore_create response:\n{}'
                     .format(pprint.pformat(datastore)))
        # What is this datastore dictionary returned by the api call???
        self._clear_datastore_dict()
        # Now re-read the datastore_dict to get the resource_id
        return self.get_datastore(datastore_nm)

    def get_datastore(self, datastore_nm):
        if not self.datastore_exists(datastore_nm):
            raise CKANerror("Cannot get; datastore '{}' does not exist:"
                            .format(datastore_nm))
        return CKANdatastore(self.access,
                             self,
                             datastore_nm,
                             self.datastore_dict[datastore_nm])

    def delete_datastore(self, datastore_nm):
        if not self.datastore_exists(datastore_nm):
            raise CKANerror("Cannot delete: datastore '{}' does not exist"
                            .format(id))
        dstore = self.get_datastore(datastore_nm)
        request_dict = {'resource_id': dstore.datastore_id}
        self.access._send_request('datastore_delete', request_dict)
        self._clear_datastore_dict()

class CKANdatastore(object):
    def __init__(self, access, dataset, datastore_nm, datastore_id):
        self.access = access
        self.dataset = dataset
        self.datastore_nm = datastore_nm
        self.datastore_id = datastore_id

    def transfer_tsv_records(self, fields, reclines):
        # format records for ckan
        records = []
        for recline in reclines:
            #datavals = recline.split('\t')
            datavals = [None if dv == 'None' else dv.strip()
                        for dv in recline.split('\t')]
            assert len(fields) == len(datavals)
            records.append(dict(zip(fields, datavals)))
        request_dict = {
                'resource_id': self.datastore_id,
                'records': records,
                #'method': 'insert',
                }
        self.access._send_request('datastore_upsert', request_dict)

