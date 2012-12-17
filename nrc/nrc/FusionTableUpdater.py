# Function Table Sync

from nrc.NrcBot import NrcBot

class FusionTableUpdater (NrcBot):
    def __init__(self, **kwargs):
    
        # TODO: make class FusionTableClient. in connect(), authenticate usgin U/P from settings
#        self.ft = FusionTableClient()
#        self.ft.connect()
        NrcBot.__init__(self)

    db_table_name = None
    ft_table_id = None
    id_field_name = 'id'
    replace_existing = True
        
        
    def process_item(self, task_id):
        # select row from db_table_name where id_field_name = task_id
        # check to see if row with that id exists in FT
        # if not, insert it
        # if so, and replace_existing is true, then update it
        
        self.item_completed (task_id)
        pass 
    
        
        