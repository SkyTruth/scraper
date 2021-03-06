# -*- coding: utf-8 -*-
"""
Created on Mon Jul 08 13:34:26 2013

@author: Craig
"""
#
# NOTICE:  The two operating scrapers, CogisPendingPermits and
#          CogisApprovedPermits are derived from CogisPermitScraper
#          and are located in the last 60 lines of this file.
#

# standard modules
from datetime import date, datetime, timedelta

# site modules
from scrapy.contrib.loader import ItemLoader
from scrapy.http import Request, FormRequest
from scrapy import log
from scrapy.selector import HtmlXPathSelector

# local modules
from nrc.items import NrcItem, FeedEntry, SingleField
from nrc.items import convert_fuzzy_date, convert_fuzzy_dt
from nrc.items import item_dict_to_string
from nrc.NrcBot import NrcBot

# CONSTANTS
WELL_INFO_INTERVAL = 10   # Days inwhich full well set is checked for changes.
PRE_PRODUCTION = True  # If true, emit draft alerts

# Moved to BotTaskParams
#request_url = 'http://cogcc.state.co.us/COGIS/DrillingPermits.asp'
#feedsource_id = 1002

permit_link_tmpl = 'http://ogccweblink.state.co.us/results.aspx?id=%s'

new_permit_title_tmpl = \
"Application for Colorado drilling permit by {operator} in {county} county."
new_permit_summary_tmpl = \
"An application has been made by operator {operator} for a drilling permit " \
"in {county} county Colorado on {date_received}.  The current status of " \
"the permit application is {permit_status}."

approved_permit_title_tmpl = \
"Colorado drilling permit approved for {operator} in {county} county."
approved_permit_summary_tmpl = \
"An application for a drilling permit in {county} county Colorado " \
"has been approved for operator {operator} on {permit_status_date}.  " \
"The well is assigned api {api}."

permit_status_title_tmpl = \
"Colorado permit application status changed to {permit_status} " \
"for {operator} in {county} county."
permit_status_summary_tmpl = \
"An application for a drilling permit made by operator {operator} " \
"in {county} county, Colorado has been changed to status {permit_status} " \
"on {permit_status_date}."

spud_title_tmpl = \
"SPUD date published for Colorado well {api} " \
"in {county} county by {operator}."
spud_summary_tmpl = \
"A SPUD date of {well_spud_date} is published for well {api} " \
"in {county} county, Colorado by {operator}."

well_status_title_tmpl = \
"Colorado well {api} in {county} county status changed " \
"to {well_status} by {operator}."
well_status_summary_tmpl = \
"Well {api} in {county} county, Colorado has changed status " \
"to {well_status} by operator {operator} on {well_status_date}."

content_template = """\
<b>Permit Details</b><br>
{permit_application}
Permit type: <a href="http://cogcc.state.co.us/COGIS_Help/Permit_Types.htm">
            {permit_type}</a><br>
Operator: {operator}<br>
County: {county}<br>
Application date: {date_received}<br>
Permit status: {permit_status}<br>
Status date: {permit_status_date}<br>
Well name: {well_name}<br>
Field: {field}<br>
Planned depth: {proposed_depth}<br>
{well_data}
{notestring}
"""

permit_app_tmpl = """\
Permit application: <a href="{permit_link}">{permit_number}</a><br>
"""
well_data_tmpl = """\
Well status: <a href="http://cogcc.state.co.us/COGIS_Help/Status_Codes.htm">
            {well_status}</a><br>
Well SPUD date: {well_spud_date}<br>
Well API Record: <a href="{well_link}">{api}</a><br>
"""

class CogisPermit(NrcItem):
    insert_mode = 'replace'
    returning = 'st_id'

    st_id = SingleField()
    ft_id = SingleField()
    county = SingleField()
    date_received = SingleField()
    date_posted = SingleField()
    operator = SingleField()
    operator_number = SingleField()
    contact = SingleField()
    well_name = SingleField()
    field = SingleField()
    formation = SingleField()
    proposed_depth = SingleField()
    permit_number = SingleField()
    permit_type = SingleField()
    permit_status = SingleField()
    permit_status_date = SingleField()
    permit_link = SingleField()
    well_api = SingleField()
    well_lat = SingleField()
    well_lng = SingleField()
    well_status = SingleField()
    well_status_date = SingleField()
    well_spud_date = SingleField()
    well_link = SingleField()

class CogisPermitScraper (NrcBot):
    allowed_domains = None

    def request_form(self, task):
        url = task['target_url']
        request = Request (url,
                           callback=self.submit_form,
                           dont_filter=True,
                           errback=self.error_callback)
        self.log('retrieving request form at url %s' % (url), log.INFO)
        request.meta['task'] = task
        return request

    def submit_form(self, response):
        req = FormRequest.from_response(response,
                                        formdata=self.formdata,
                                        callback=self.parse_cogis_permits,
                                        errback=self.error_callback)
        req.meta['task'] = response.meta['task']
        yield(req)

    def parse_cogis_permits(self, response):
        task = response.meta['task']
        hxs = HtmlXPathSelector(response)

        rows = hxs.select('//table[2]//tr')
        if (len(rows) == 0):
            self.send_alert ('No data found in COGIS permit search response')
            self.log('No permit data present in response', log.WARNING)
        elif (len(rows) <= 1):
            self.log('No permits found in COGIS response', log.WARNING)
        else:
            self.log('%s permits found in COGIS response'%(len(rows) - 1,),
                     log.INFO)
            field_table = self.field_table
            for row in rows[1:]:
                ldr = ItemLoader (CogisPermit())
                tds = row.select('./td')
                for i_td, extractor, fld0, fld1 in field_table:
                    try:
                        vals = extractor(tds[i_td-1])
                    except IndexError:
                        vals = extractor(None)
                    #print fld0, fld1, "vals:", vals
                    if fld0 == fld1:
                        ldr.add_value(fld0, ' '.join(vals))
                    else:
                        if fld0: ldr.add_value(fld0, vals[0])
                        if fld1: ldr.add_value(fld1, vals[1])
                item = ldr.load_item()
                # Mark task status as PROCESSING so we detect
                # any undisposed tasks.
                self.item_processing(self.get_permit_task_id(item))

                self.crawler.stats.inc_value('1_permits_returned_count',
                                             spider=self)
                for result in self.pre_process_permit_item(item):
                    yield result
        self.item_completed (task['task_id'])

    def pre_process_permit_item(self, item):
        stats = self.crawler.stats
        # Check that we have the essential information
        well_name = item.get('well_name', '')
        api = item.get('well_api', '')
        permit_number = item.get('permit_number', '')
        if not( well_name and (permit_number or api)):
            self.log('Incomplete permit data for well %s'%(well_name,),
                     log.WARNING)
            self.item_dropped(self.get_permit_task_id(item))
            stats.inc_value('4_incomplete_permit_count', spider=self)
            return

        existing_item = self.db.loadItem(item, {'well_name':well_name,})

        # See if we need well data.
        # Permit must be APPROVED to access well data.
        if item['permit_status'] == 'APPROVED' and item.get('well_api'):
            api = item.get('well_api', "")
            api_int = int(api.replace('-','')[:10])
            # We will get well data if:
            #   this is the first time this item has been seen as APPROVED...
            #   or it's this api's lucky day
            #      in an update period of WELL_INFO_INTERVAL days
            if ((not existing_item or
                  existing_item.get('permit_status') != 'APPROVED')
                or
                (api_int % WELL_INFO_INTERVAL ==
                      date.today().toordinal() % WELL_INFO_INTERVAL) ):
                    yield self.request_well_data(item)
                    return

        for result in self.process_permit_item(item):
            yield result

    def get_permit_task_id(self, item):
        api = item.get('well_api', "")
        permit_number = item.get('permit_number', "")
        # For api we drop the leading '05' and limit to 10 digits
        # to keep number in integer range.
        task_id = (int(permit_number) if permit_number
                   else int(api.replace('-','')[2:12]))
        return task_id

    def request_well_data(self, item):
        url = item.get('well_link')
        request = Request(url,
                          callback=self.parse_well_data,
                          dont_filter=True,
                          errback=self.error_callback)
        request.meta['current_item'] = item
        self.log('Requesting well information for %s at url %s'
                 % (item.get('well_api', 'UNK'), url), log.INFO)
        self.crawler.stats.inc_value('2_welldata_request_count', spider=self)
        return request

    def parse_well_data(self, response):
        self.crawler.stats.inc_value('2_welldata_response_count', spider=self)
        item = response.meta['current_item']
        hxs = HtmlXPathSelector(response)
        tds = hxs.select('//td')
        # Note that there may be two instances of lat/lng in the record,
        # one is 'as planned' and the 2nd is 'as built'.
        # We want the 2nd if it's there.
        try:
            lat, lng = find_well_data(tds,
                                      parse_well_latlng,
                                      "Lat/Long:",
                                      all=True)[-1]
        except IndexError:
            lat = lng = None
        well_status = find_well_data(tds, parse_text, "Status:", embedded=True)
        well_spud_date = find_well_data(tds,
                                        parse_date,
                                        "Spud Date:",
                                        nexttd=True)

        if lat:
            item['well_lat'] = lat
            item['well_lng'] = lng
        if well_status and well_status != item.get('well_status'):
            item['well_status'] = well_status
            item['well_status_date'] = convert_fuzzy_date(str(date.today()))
        elif 'well_status' not in item:
            # To avoid keyerrors in feed generator, make sure well keys exist
            item['well_status'] = None
            item['well_status_date'] = None

        if well_spud_date or 'well_spud_date' not in item:
            item['well_spud_date'] = well_spud_date

        for result in self.process_permit_item(item):
            yield result

    def process_permit_item(self, item):
        #print "Processing item:", dict(item)
        stats = self.crawler.stats
        stats.inc_value('3_permits_processed_count', spider=self)
        well_name = item.get('well_name', '')

        # If we already have a permit record for this item
        # get the existing item and merge it's data into item
        # We unset PROCESSING status because task_id may change in merge
        self.item_completed(self.get_permit_task_id(item))
        item, existing_item = self.merge_existing_item(item)

        # if item is None it does not contain new data and
        # need not be updated.
        if not item:
            if existing_item:
                stats.inc_value('4_existing_permit_count', spider=self)
            # If there is no existing item, then there is a special condition
            # which was handled in the merge_existing_item method.
            return

        # first check for required fields
        if (not (item.get('well_lat') and item.get('well_lng') ) ):
            stats.inc_value('4_incomplete_permit_count', spider=self)
            return

        # Reset items to PROCESSING status so we know if we lose any
        task_id = self.get_permit_task_id(item)
        self.item_processing(self.get_permit_task_id(item))

        # existing_item contains the current database contents.
        if not existing_item:
            # this is a new item; yield item and alerts
            self.log('New permit data for %s, well %s'
                     %(self.get_permit_task_id(item), well_name,),
                     log.INFO)
            yield item
            for result in self.alert_new_permit(item): yield result
            stats.inc_value('4_new_permit_count', spider=self)
            return

        # Here we have a modified item and an existing item
        # Update the item and check for alert conditions.
        self.log("Record updated for %s, well %s" %(task_id, well_name),
                 log.INFO)
        yield item

        #########
        ## screen for alert data changes
        # screen for permit status change
        if (item.get('permit_status')
            and item.get('permit_status')
                != existing_item.get('permit_status')):
            for result in self.alert_permit_status(item): yield result
            stats.inc_value('4_update_permit_status_count', spider=self)
            return

        # screen for new spud date
        if (item.get('well_spud_date')
            and str(item.get('well_spud_date'))!=
                str(existing_item.get('well_spud_date')) ):
            for result in self.alert_spud(item): yield result
            stats.inc_value('4_update_spud_count', spider=self)
            return

        # screen for well status change
        if (item.get('well_status')
            and item.get('well_status') != existing_item.get('well_status')):
            for result in self.alert_well_status(item): yield result
            stats.inc_value('4_update_well_status_count', spider=self)
            return

        # Count un-alerted data updates
        stats.inc_value('4_update_permit_data_count', spider=self)
        return

    def merge_existing_item(self, item):
        stats = self.crawler.stats
        well_name = item.get('well_name')

        # See if existing record exists
        existing_item = self.db.loadItem(item, {'well_name':well_name,})
        if not existing_item:
            return item, None

        #########
        # verify item match
        status = item.get('permit_status')
        ex_status = existing_item.get('permit_status')
        api = item.get('well_api', '')
        ex_api = existing_item.get('well_api', '')
        permit_number = item.get('permit_number', '')
        ex_permit_num = existing_item.get('permit_number', '')
        try:
            if api and ex_api:
                # do not mismatch on last two of 2-3-5-2 api.
                assert ex_api[:12] == api[:12]
            if permit_number and ex_permit_num:
                assert permit_number == ex_permit_num
        ## Deal with possible record key value mismatches here
        except AssertionError:
            # There is an identification conflict involving the well name.
            # This is usually a permit number mismatch because a permit
            # is withdrawn and the well_name is being reused for a new permit.
            # If either record is permit_status = "WITHDRAWN" then ignore
            # and delete if needed, the "WITHDRAWN" record.
            if ex_status == "WITHDRAWN":
                # The existing record is WITHDRAWN, so delete it
                self.log(("Record well_name match on '%s' has mismatched "
                          "key numbers.  Delete existing record "
                          "with permit status WITHDRAWN."
                            %(well_name,)),
                          log.WARNING)
                id = existing_item.get('st_id')
                if id:
                    rows = self.db.deleteItem("CogisPermit", id, 'st_id')
                    assert rows == 1
                    stats.inc_value('6_deleted_record_count', spider=self)

                existing_item = None

            if status == "WITHDRAWN":
                # The new record is WITHDRAWN so ignore it.
                self.log(("Record well_name match on '%s' has mismatched "
                          "key numbers.  Ignoring scraped record "
                          "with permit status WITHDRAWN."
                            %(well_name,)),
                          log.WARNING)
                self.item_dropped(self.get_permit_task_id(item))
                stats.inc_value('4_withdrawn_permit_count', spider=self)
                item = existing_item = None

            # Unresolved mismatch.  This could be the result of a past mistake
            # being correct in the current data.  We delete the existing
            # record and ignore the current record, and let the next scrape
            # pick up the latest information on this well.
            if "WITHDRAWN" not in (status, ex_status):
                self.log(
                    "Record well_name match with mismatched key numbers:\n"
                    "Well name: {}\n{}\n{}".format(
                        well_name,
                        item_dict_to_string(item, "Scraped:"),
                        item_dict_to_string(existing_item, "Existing")),
                    log.WARNING)

                id = existing_item.get('st_id')
                if id:
                    rows = self.db.deleteItem("CogisPermit", id, 'st_id')
                    assert rows == 1
                    stats.inc_value('6_deleted_record_count', spider=self)
                self.item_dropped(self.get_permit_task_id(item))
                stats.inc_value('4_invalid_permit_count', spider=self)
                item = existing_item = None

            return item, existing_item

        ########
        ## merge existing values into scraped item
        ## check for any new values in scraped item
        update_item = False
        for name, ex_val in existing_item.items():
            current = item.get(name);
            if not current and ex_val:
                item[name] = ex_val
            elif ex_status == "APPROVED":
                # NOTE:  If the existing record shows it 'APPROVED', maintain
                #        that status.  We may be reprocessing a Pending record
                #        after the approved record has been downloaded.
                item['permit_status'] = ex_status
            elif str(current) != str(ex_val):
                # We have new information in the scraped record.
                update_item = True
                self.log("Permit data '%s' set to %s from %s for well %s"
                         %(name, item.get(name), existing_item.get(name),
                           well_name),
                         log.INFO)
        if not update_item:
            return None, existing_item
        return item, existing_item

    def alert_new_permit(self, item):
        params = dict(item)
        if item['permit_status'] == 'APPROVED':
            params['title_tmpl'] = approved_permit_title_tmpl
            params['summary_tmpl'] = approved_permit_summary_tmpl
        else:
            params['title_tmpl'] = new_permit_title_tmpl
            params['summary_tmpl'] = new_permit_summary_tmpl
        params['date'] = convert_fuzzy_dt(item['permit_status_date'])
        for alert in self.create_feed_entry(params): yield alert

    def alert_permit_status(self, item):
        params = dict(item)
        if item['permit_status'] == 'APPROVED':
            params['title_tmpl'] = approved_permit_title_tmpl
            params['summary_tmpl'] = approved_permit_summary_tmpl
        else:
            params['title_tmpl'] = permit_status_title_tmpl
            params['summary_tmpl'] = permit_status_summary_tmpl
        params['date'] = convert_fuzzy_dt(item['permit_status_date'])
        for alert in self.create_feed_entry(params): yield alert

    def alert_spud(self, item):
        params = dict(item)
        params['title_tmpl'] = spud_title_tmpl
        params['summary_tmpl'] = spud_summary_tmpl
        spud_date = item.get('well_spud_date', date.today())
        params['date'] = convert_fuzzy_dt(spud_date)
        for alert in self.create_feed_entry(params): yield alert

    def alert_well_status(self, item):
        params = dict(item)
        params['title_tmpl'] = well_status_title_tmpl
        params['summary_tmpl'] = well_status_summary_tmpl
        status_date = item.get('well_status_date')
        params['date'] = convert_fuzzy_dt(status_date) if status_date else None
        for alert in self.create_feed_entry(params): yield alert

    def create_feed_entry (self, params):
        params['feedsource_id'] = self.feedsource_id
        status = params.get('permit_status')
        if status == 'APPROVED':
            params['api'] = params.get('well_api', 'N/A')
        else:
            params['api'] = params.get('well_api', 'Not assigned')
        if params.get('well_api'):
            params['well_data'] = well_data_tmpl.format(**params)
        else:
            params['well_data'] = ''
        if params.get('permit_number'):
            params['permit_application'] = permit_app_tmpl.format(**params)
            params['link'] = params.get('permit_link')
        else:
            params['permit_application'] = ''
            params['link'] = params.get('well_link')
        params['content_tmpl'] = content_template
        params['notestring'] = ''
#        if params['notes']:
#            params['notestring'] = ("Notes: %s<br>"
#                                    % (', '.join(params['notes']),))

        # create a new feed item
        l=ItemLoader (FeedEntry())

        feed_entry_id = self.db.uuid4_str()
        l.add_value ('id', feed_entry_id)

        l.add_value ('title', params['title_tmpl'].format(**params))
        l.add_value ('incident_datetime', params['date'])
        l.add_value ('link', params['link'])

        l.add_value ('summary', params['summary_tmpl'].format(**params))
        l.add_value ('content', params['content_tmpl'].format(**params))

        l.add_value ('lat', params['well_lat'])
        l.add_value ('lng', params['well_lng'])

        l.add_value ('source_id', params['feedsource_id'])

        ### DURING TESTING PERIOD EMIT DRAFT ALERTS
        if PRE_PRODUCTION:
            l.add_value ('status', 'draft')
        ###########################################

        feed_item = l.load_item()

        if (feed_item.get('lat')
            and feed_item.get('lng')
            and feed_item.get('incident_datetime')
            and (datetime.now() - feed_item.get('incident_datetime'))
                 <= timedelta(days=60)):
            yield feed_item
            for tag in self.get_tags(params):
                yield self.create_tag (feed_entry_id, tag)
            self.crawler.stats.inc_value('5_permit_alert_count', spider=self)


    def get_tags (self, params):
        tags = []
        tags.append ('COGIS')
        tags.append ('drilling permit')
        if params['permit_status'] == 'APPROVED':
            tags.append ('drilling')
        return tags

    def item_stored(self, item, id):
        task_id = self.get_permit_task_id(item)
        if item.get('st_id', -1) == id:
            self.log('Updated item %s (%s)' % (task_id, item['well_name'],),
                 log.INFO)
            self.item_updated(task_id)
        else:
            self.log('Stored new item %s (%s)' % (task_id, item['well_name'],),
                 log.INFO)
            self.item_new(task_id)

############################################################################
## Text data parsing function

def parse_text(text):
    return text.strip().replace(u'\xa0', ' ').encode('utf-8')

def parse_date(text):
    return None if not text else convert_fuzzy_date(text).split()[0]

def parse_ints(text):
    if not text: return [None, None]
    text = text.replace(',','')
    text_list = [t.strip() for t in text.split('|')]
    try:
        return [int(t) for t in text_list]
    except ValueError:
        return [None, None]

def parse_float(text):
    if not text: return None
    text.replace(',','')
    try:
        return float(text)
    except ValueError:
        return None

def parse_well_latlng(text):
    lat = lng = None
    latlng = text.split('/')
    if len(latlng) == 2:
        lat, lng = [parse_float(l) for l in latlng]
    if lat is None or lng is None:
        return None, None
    return lat, lng

# NOTE: Extractors return two values because many table fields
#       have two lines with distinct data in each.
def extract_null(td):
    return [None, None]

def extract_text(td, join=True):
    if td is None:
        return "" if join else [""]
    textlist = [parse_text(t.extract()) for t in td.select('.//text()')]
    return " ".join(textlist) if join else textlist

def extract_textlines(td):
    if td is None:
        return ["", ""]
    textlist = extract_text(td, join=False)
    return ( [t for t in textlist if t] + ["", ""] ) [:2]

def extract_dates(td):
    raw = extract_textlines(td)
    return [parse_date(raw[0]),
            parse_date(raw[1])]

def extract_ints(td):
    raw = extract_textlines(td)
    return [max(parse_ints(raw[0])),
            max(parse_ints(raw[1]))]

def extract_approved_api(td):
    raw = extract_textlines(td)
    status_date = parse_date(raw[0])
    return [status_date, raw[1]]

def set_approved_status(td):
    return ['APPROVED', ""]

def extract_link(td):
    href = ' '.join(td.select('.//@href').extract()).strip()
    # a hack.
    # should be using urlparse standard module and page url
    if href.startswith('/cogis'):
        href = "http://cogcc.state.co.us" + href
    return [href, None]

def extract_pending_permit_link(td):
    raw = extract_textlines(td)
    return [CogisPermitScraper.permit_link_tmpl%(raw[1],), ""]

def extract_pending_latlng(td):
    lat = lng = None
    href = ' '.join(td.select('.//@href').extract()).strip()
    if href and '?' in href:
        query = href.split('?')[1]
        params = query.split('&')
        for param in params:
            if param[:4] == 'lat=':
                lat = float(param[4:])
            elif param[:4] == 'lon=':
                lng = float(param[4:])
    if lat and lng:
        return [lat, lng]
    return [None, None]

def extract_permit_county(td):
    if CogisPermitScraper.county.upper() != 'ALL':
        return [CogisPermitScraper.county, '']
    return extract_textlines(td)

def find_well_data(tds,
                   parser,
                   intro,
                   nexttd=False,
                   all=False,
                   embedded=False):
    results = []
    parse = False
    for td in tds:
        text = extract_text(td)
        if embedded:
            i_ = text.find(intro)
            if i_ < 0: continue
            text = text[i_:]
        if text.startswith(intro):
            parse = True
            if nexttd:
                continue
            else:
                text = text[len(intro):]
        if parse:
            result = parser(text)
            parse = False
            if all:
                results.append(result)
                continue
            else:
                return result
    if all:
        return results
    return None


#######################################################################
## Derived scrapers for two permit sources
class CogisPendingPermits(CogisPermitScraper):
    name = "CogisPendingPermits"
    field_table = (
            (1, extract_dates, "date_received", "date_posted"),
            (2, extract_textlines, "operator", "operator_number"),
            (3, extract_textlines, "contact", "contact"),
            (4, extract_textlines, "permit_status", "permit_number"),
            (4, extract_pending_permit_link, "permit_link", ""),
            (5, extract_dates, "permit_status_date", ""),
            (6, extract_textlines, "well_name","well_name"),
            (7, extract_textlines, "permit_type", ""),
            (8, extract_pending_latlng, "well_lat", "well_lng"),
            (10, extract_textlines, "formation", ""),
            (11, extract_ints, "proposed_depth", ""),
            (12, extract_textlines, "field", "field"),
            (13, extract_permit_county, "county", ""),
            (1, extract_null, "well_api", "well_spud_date"),
            (1, extract_null, "well_status", "well_status_date"),
            (1, extract_null, "well_link", ""),
            )

    def process_item(self, task):
        CogisPermitScraper.feedsource_id = task['feedsource_id']
        CogisPermitScraper.permit_link_tmpl = task.get('permit_link_tmpl')
        CogisPermitScraper.county = task.get('county').upper()
        self.formdata = {"listtype": "Pending",
                         "county": CogisPermitScraper.county,
                         "B1": "Go!",
                        }
        yield self.request_form(task)

class CogisApprovedPermits(CogisPermitScraper):
    name = "CogisApprovedPermits"
    field_table = (
            (1, extract_dates, "date_received", "date_posted"),
            (2, extract_textlines, "operator", "operator_number"),
            (3, extract_textlines, "contact", "contact"),
            (4, extract_approved_api, "permit_status_date", "well_api"),
            (4, set_approved_status, "permit_status", ""),
            (4, extract_link, "well_link", ""),
            (5, extract_textlines, "permit_type", ""),
            (6, extract_textlines, "well_name", "well_name"),
            (7, extract_textlines, "formation", ""),
            (8, extract_ints, "proposed_depth", ""),
            (11, extract_textlines, "field", "field"),
            (12, extract_permit_county, "county", ""),
            (1, extract_null, "permit_number", "permit_link"),
            )
    def process_item(self, task):
        CogisPermitScraper.feedsource_id = task['feedsource_id']
        CogisPermitScraper.permit_link_tmpl = task.get('permit_link_tmpl')
        CogisPermitScraper.county = task.get('county').upper()
        self.formdata = {"listtype": "Approved",
                         "county": CogisPermitScraper.county,
                         "B1": "Go!",
                        }
        yield self.request_form(task)
