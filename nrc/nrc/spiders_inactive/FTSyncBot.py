#MYSQL to Fustion Tables Sync Bot

import re

from scrapy.spider import BaseSpider
from scrapy import log

from nrc.database import NrcDatabase
from nrc.NrcBot import NrcBot
from nrc import settings

import MySQLdb

from FTSync.MysqlFTSync import MysqlFTSync
from FTClient import FTClient
from FTClient.authorization.clientlogin import ClientLogin

import logging


class FTSyncBot(NrcBot):
    name = 'FTSyncBot'
    default_params = {
        'ft_id_field': 'ft_id',
        'seq_field': 'seqid',
        'max_recs': 1000
    }

    def __init__(self, **kwargs):
        NrcBot.__init__(self, **kwargs)
        logging.basicConfig(format='%(levelname)s: %(message)s', level=logging.DEBUG)

    def process_item(self, task):

        params = self.default_params
        params.update (task)

        ft_client= FTClient.ClientLoginFTClient(ClientLogin().authorize(settings.FUSION_TABLE_USER, settings.FUSION_TABLE_PASS))
        mysql_ft_sync = MysqlFTSync (ft_client, self.db.db, ft_id_field = params['ft_id_field'], seq_field=params['seq_field'])

        command = task['sync_type']

        records_affected = 0
        success = False
        max_records = params['max_recs']
        if command == 'MYSQL2FT':
            try:
                while records_affected < max_records:
                    new_records_affected = mysql_ft_sync.sync_mysql_to_ft (params['mysql_table'], params['ft_table'])
                    if not new_records_affected:
                        break
                    records_affected += new_records_affected

                success=True
            except FTClient.FTClientError as e:
                self.send_alert (e.message)

            except MySQLdb.Error as e:
                self.send_alert (e)
        elif command == 'FT2MYSQL':
            try:
                while records_affected < max_records:
                    new_records_affected = mysql_ft_sync.sync_ft_to_mysql (params['mysql_table'], params['ft_table'])
                    if not new_records_affected:
                        break
                    records_affected += new_records_affected

                success=True
            except FTClient.FTClientError as e:
                self.send_alert (e.message)

            except MySQLdb.Error as e:
                self.send_alert (e)

        else:
            self.send_alert ('Unknown sync type: %s'%command)

        self.log ("%s records affected" % records_affected, log.INFO)

        self.item_completed (task['task_id'])
        yield




