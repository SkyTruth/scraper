# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/topics/items.html

import time
import random
from datetime import date, datetime, timedelta
import re
from urlparse import urlsplit, urljoin
from dateutil.parser import parse as parse_date

from scrapy.item import Item, Field
from scrapy.contrib.loader.processor import TakeFirst, MapCompose, Join
from scrapy.contrib.loader import ItemLoader

import psycopg2

def format_datetime (dt):
    if type(dt) is time.struct_time:
        dt = datetime(*dt[:6])
    return dt.strftime('%Y-%m-%d %H:%M:%S')

def convert_nrc_date(dt):
    #convert time format and translate to UTC
    #TODO should use a real timezone here to accout for daylight time
#    new_dt = datetime.strptime(dt,'%d-%b-%Y %H:%M') + timedelta(hours=5)
    new_dt = datetime.strptime(dt,'%d-%b-%Y %H:%M')
    return format_datetime(new_dt)

def convert_date_MDY(dt):
    new_dt = datetime.strptime(dt,'%m/%d/%Y')
    return format_datetime(new_dt)

def convert_fuzzy_date(dt):
    new_dt=parse_date(dt,fuzzy=1)
    return format_datetime(new_dt)

def convert_fuzzy_dt(dt):
    if isinstance(dt, (date, datetime)):
        return dt
    return parse_date(dt,fuzzy=1)

def convert_lat_lng(l):
    # assume l is a string with 1, 2 or 3 separate numbers in it
    # first number is degrees, second is minutes third is seconds

    # find each separate number in the string
    values = re.compile('-?[\d.]+').findall(l)[0:3]
    result = 0.0
    mult = 1.0
    for v in values:
        try:
            if mult == 1.0:
                result += float(v) * mult
                if result < 0:
                    mult = -1.0
            else:
                result += abs(float(v)) * mult  # minutes and seconds cannot be negative

            mult /= 60.0
        except ValueError:
            pass

    # If there is an 'S' or a 'W' in there, then the value is negative
    if (re.compile('[SW]', re.IGNORECASE).search(l) and result > 0):
        result = -result
    elif (re.compile('[NE]', re.IGNORECASE).search(l) and result < 0):
        result = -result

    # round off to remove irele precision
    return result

def convert_lng(l):
    # for NRC reports, longitude is always negative
    result = convert_lat_lng(l)
    if (result > 0):
        result = -result
    return result

def convert_lat(l):
    # for NRC reports, latitude is always positive
    result = convert_lat_lng(l)
    if (result < 0):
        result = -result
    return result

def normalize_url(url, loader_context):
    base_url = loader_context.get('base_url','')
    return urljoin (base_url, url)

def fix_entities(s):
    return s.encode('ascii', 'xmlcharrefreplace')

# Add jitter to lat/lng values
def add_lat_lng_jitter (s):
    jitter = 0.007
    return float(s) + random.uniform(-jitter, jitter)

def convert_NULL(s):
    if s == 'NULL':
        s = None
    return s

def strip_non_digits(s):
    return re.sub('[^\d\.]','',s)

def float_check(s):
    try:
        float(s)
    except ValueError:
        return None
    return s

def extract_largest_float(s):
    fl = re.findall(r'([-+]?[0-9]*\.?[0-9]+)', s)
    if fl:
        return str(max([float(f) for f in fl]))
    return ""

def title_case (s):
    return s.title()

def item_dict_to_string(dic, header=None):
    if header is None:
        header = dic.__class__.__name__+':'
    field_list = dict(dic).items()
    field_list.sort()
    output_list = [header] + \
                  ['\t%s: %s'%(f[0], f[1]) for f in field_list]
    return u'\n'.join(output_list)

class SingleField (Field):
    def __init__(self,**kwargs):
        kwargs['output_processor'] = TakeFirst()
        Field.__init__(self,**kwargs)


class ContentField (SingleField):
    def __init__(self,**kwargs):
        kwargs['isContent'] = True
        kwargs['input_processor'] = MapCompose(convert_NULL)
        SingleField.__init__(self,**kwargs)

class KeyField (ContentField):
    def __init__(self,**kwargs):
        kwargs['iskey'] = True
        SingleField.__init__(self,**kwargs)

class NrcItem (Item):
    insert_mode = 'replace'  #  ( insert | replace )
    returning = None
    def keyFields (self):
        return [name for name,meta in self.fields.items() if meta.get('iskey')]
    def contentFields (self):
        return [name for name,meta in self.fields.items() if meta.get('isContent')]

    # compare content fields in this item with the same fields in the given item (may be a dict or an Item)
    # returns a dict as follows
    # {key1: (self[key1], item[key1]),  key2: (self[key2], item[key2])}
    # if there are no differences, then the dict is empty
    def contentDiff (self, item):
        diff = {}
        for field_name in self.contentFields():
            self_value = self.get(field_name)
            item_value = item.get(field_name)
            if self_value != item_value:
                diff[field_name] = (self_value, item_value)
        return diff
    def __repr__(self):
        return "%s(%s)" % (self.__class__.__name__, ', '.join (['%s=%s'%(k,self.get(k)) for k in self.keyFields()]))

class BotTaskError (NrcItem):
    task_id = SingleField ()
    bot = SingleField ()
    code = SingleField ()
    message = SingleField ()


class NrcScrapedReport(Item):
    reportnum = SingleField(
        xpath = 'td[@headers="NRC Report #"]/text()',
        input_processor = MapCompose(unicode.strip),
        )
    calltype = SingleField (
        xpath = 'td[@headers="Type of Call"]/text()',
        input_processor = MapCompose(unicode.strip),
        )
    recieved_datetime = SingleField (
        xpath = 'td[@headers="Date/Time Received"]/text()',
        input_processor = MapCompose(convert_nrc_date),
        )
    description = SingleField (
        xpath = 'td[@headers="Description Of Incident"]/text()',
        input_processor = MapCompose(unicode.strip),
        )
    incidenttype = SingleField (
        xpath = 'td[@headers="Type Of Incident"]/text()',
        input_processor = MapCompose(unicode.strip),
        )
    cause = SingleField (
        xpath = 'td[@headers="Incident Cause"]/text()',
        input_processor = MapCompose(unicode.strip),
        )
    incident_datetime = SingleField (
        xpath = 'td[@headers="Incident Date/Time"]/text()',
        input_processor = MapCompose(convert_nrc_date),
        )
    location = SingleField (
        xpath = 'td[@headers="Location"]/text()',
        input_processor = MapCompose(unicode.strip),
        )
    state = SingleField (
        xpath = 'td[@headers="State"]/text()',
        input_processor = MapCompose(unicode.strip),
        )
    nearestcity = SingleField (
        xpath = 'td[@headers="Nearest City"]/text()',
        input_processor = MapCompose(unicode.strip),
        )
    county = SingleField (
        xpath = 'td[@headers="County"]/text()',
        input_processor = MapCompose(unicode.strip),
        )
    suspected_responsible_company = SingleField (
        xpath = 'td[@headers="Suspected Responsible Company"]/text()',
        input_processor = MapCompose(unicode.strip),
        )
    medium_affected = SingleField (
        xpath = 'td[@headers="Medium Affected"]/text()',
        input_processor = MapCompose(unicode.strip),
        )
    material_name = SingleField (
        xpath = 'td[@headers="Material Name"]/text()',
        input_processor = MapCompose(unicode.strip),
        )
    full_report_url = SingleField (
        xpath = 'td[@headers="View Report"]/a/@href',
        input_processor = MapCompose(normalize_url),
        )
    materials_url = SingleField (
        xpath = 'td[@headers="Materials Page"]/a/@href',
        input_processor = MapCompose(normalize_url),
        )

    def __repr__(self):
        return "NrcScrapedReport(reportnum=%s, incident_datetime=%s)" % (self['reportnum'], self['incident_datetime'])


class NrcScrapedFullReport(Item):
    reportnum = SingleField()
    full_report_body = SingleField()
    full_report_url = SingleField()
#    parsed_blockid = SingleField()
#    parsed_areaid = SingleField()
#    parsed_latitude = SingleField(
#        input_processor = MapCompose(convert_lat_lng))
#    parsed_longitude = SingleField(
#        input_processor = MapCompose(convert_lat_lng))

    def __repr__(self):
        return "NrcFullReport(reportnum=%s)" % self['reportnum']

class NrcParsedReport(Item):
    reportnum = SingleField()
    blockid = SingleField()
    areaid = SingleField()
    platform_letter = SingleField()
    latitude = SingleField(
        input_processor = MapCompose(convert_lat))
    longitude = SingleField(
        input_processor = MapCompose(convert_lng))
    zip = SingleField()
    sheen_size_length = SingleField()
    sheen_size_width = SingleField()
    affected_area = SingleField()
    county = SingleField()




class NrcScrapedMaterial(Item):
    reportnum = SingleField()
    chris_code = SingleField(
        xpath = 'td[@headers="Chris Code"]/text()',
        input_processor = MapCompose(unicode.strip)
        )
    name = SingleField(
        xpath = 'td[@headers="Name Of Material"]/text()',
        input_processor = MapCompose(unicode.strip),
        )
    amount = SingleField(
        xpath = 'td[@headers="Amount Of Material"]/text()',
        input_processor = MapCompose(unicode.strip),
        )
    unit = SingleField(
        xpath = 'td[@headers="Unit Of Measure"][1]/text()',
        input_processor = MapCompose(unicode.strip),
        )
    reached_water = SingleField(
        xpath = 'td[@headers="Reached Water"]/text()',
        input_processor = MapCompose(unicode.strip),
        )
    amt_in_water = SingleField(
        xpath = 'td[@headers="Amount In Water"]/text()',
        input_processor = MapCompose(unicode.strip),
        )
    amt_in_water_unit = SingleField(
        xpath = 'td[@headers="Unit Of Measure"][2]/text()',
        input_processor = MapCompose(unicode.strip),
        )

class NrcGeocode (Item):
    reportnum = SingleField ()
    source = SingleField ()
    lat = SingleField ()
    lng = SingleField ()
    precision = SingleField ()


class FeedEntry (Item):
    id = SingleField ()
    title = SingleField ()
    link = SingleField ()
#    updated = SingleField ()     # Deprecated - use published or incicent_datetime
    published = SingleField ()   # this is the date the item was published
                                 # Leave this null to have the current timestamp applied
    summary = Field (
        input_processor=MapCompose(fix_entities),
        output_processor=Join(' - ')
    )
    content = Field (
        input_processor=MapCompose(fix_entities),
        output_processor=Join('<br/>')
    )
    lat = SingleField ()
    lng = SingleField ()
    source_id = SingleField ()
    kml_url = SingleField ()
    incident_datetime = SingleField ()   # date of the incident
    source_item_id = SingleField ()     # id of the item in the source data (usually equal to task_id)
    status = SingleField ()  # if left null, default is 'published'
                             # when testing a scraper, set status to 'draft'
                             # and view alerts at
                             # http://alerts.skytruth.org/?show=draft
                             # or 'show=draftonly'

class NrcTag (Item):
    reportnum = SingleField()
    tag = SingleField ()
    comment = SingleField()

class FeedEntryTag (Item):
    feed_entry_id = SingleField()
    tag = SingleField ()
    comment = SingleField()

class NrcAnalysis (Item):
    reportnum = SingleField()
    sheen_length = SingleField ()
    sheen_width = SingleField ()
    reported_spill_volume = SingleField ()
    reported_spill_unit = SingleField ()
    min_spill_volume = SingleField ()
    calltype = SingleField ()
    severity = SingleField ()
    release_type = SingleField ()
    region = SingleField ()

class RssFeedItem (Item):
    item_id = SingleField ()
    feed_id = SingleField ()
    content = SingleField ()
    def __repr__(self):
        return "RssFeedItem(item_id=%s)" % self['item_id']

class FusionTableItem (Item):
    table_id = SingleField ()
    item_id_value = SingleField ()
    item_id_field = SingleField ()
    replace_existing = SingleField ()
    field_data = SingleField ()

class PA_DrillingPermit (NrcItem):
    insert_mode = 'insert'
    returning = 'st_id'

    st_id = KeyField ()
    ft_id = SingleField ()

    County_Name = ContentField ()
    Municipality_Name = ContentField ()
    Auth_Id = ContentField ()
    Date_Disposed = ContentField ()
    Disposition_Code = ContentField ()
    Appl_Type_Code = ContentField ()
    Auth_Type_Description = ContentField ()
    Complete_API_ = ContentField ()
    Other_Id = ContentField ()
    Marcellus_Shale_Well = ContentField ()
    Horizontal_Well = ContentField ()
    Well_Type = ContentField ()
    Site_Name = ContentField ()
    Total_Depth = ContentField ()
    Lat_Deg = ContentField ()
    Lat_Min = ContentField ()
    Lat_Sec = ContentField ()
    Long_Deg = ContentField ()
    Long_Min = ContentField ()
    Long_Sec = ContentField ()
    GIS_Datum = ContentField ()
    Latitude_Decimal = ContentField ()
    Longitude_Decimal = ContentField ()
    Client_Id = ContentField ()
    Operator = ContentField ()
    Address1 = ContentField ()
    Address2 = ContentField ()
    City = ContentField ()
    State_Code = ContentField ()
    Zip_Code = ContentField ()

    Unconventional = ContentField ()
    OGO_Num = ContentField ()
    Facility_Id = ContentField ()


class PA_Spud (NrcItem):
    insert_mode = 'insert'
    returning = 'st_id'

    st_id = KeyField ()
    ft_id = SingleField ()

    SPUD_Date = ContentField ()
    Well_API__ = ContentField ()
    OGO__ = ContentField ()
    Operator_s_Name = ContentField ()
    County = ContentField ()
    Municipality = ContentField ()
    Farm_Name = ContentField ()
    Well_Number = ContentField ()
    Latitude = ContentField ()
    Longitude = ContentField ()
    Marcellus_Ind_ = ContentField ()
    Horizontal_Ind_ = ContentField ()
    Creation_Date = SingleField ()
    Created_By = SingleField ()
    Modification_Date = SingleField ()
    Modified_By = SingleField ()
    Well_Type = SingleField ()
    Region = SingleField ()
    Unconventional = SingleField ()

class PA_Violation (NrcItem):
    insert_mode = 'insert'
    returning = 'st_id'

    st_id = KeyField ()
    ft_id = SingleField ()
    InspectionID = ContentField ()
    ViolationID = ContentField ()
    EnforcementID = ContentField ()
    Operator = ContentField ()
    Region = ContentField ()
    InspectionDate = ContentField ()
    InspectionType = ContentField ()
    Permit_API = ContentField ()
    IsMarcellus = ContentField ()
    InspectionCategory = ContentField ()
    County = ContentField ()
    Municipality = ContentField ()
    InspectionResult = ContentField ()
    InspectionComment = ContentField ()
    ViolationDate = ContentField ()
    ViolationCode = ContentField ()
    ViolationType = ContentField ()
    ViolationComment = ContentField ()
    ResolvedDate = ContentField ()
    EnforcementCode = ContentField ()
    PenaltyFinalStatus = ContentField ()
    PenaltyDateFinal = ContentField ()
    EnforcementDateFinal = ContentField ()
    PenaltyAmount = ContentField ()
    TotalAmountCollected = ContentField ()
    Unconventional = ContentField ()

class WV_DrillingPermit (NrcItem):
    insert_mode = 'insert'
    returning = 'st_id'

    st_id = SingleField ()
    ft_id = SingleField ()

    API = KeyField ()
    permit_number = ContentField ()
    permit_type = ContentField ()
    current_operator = ContentField ()
    farm_name = ContentField ()
    well_number = ContentField ()
    permit_activity_type = KeyField ()
    permit_activity_date = SingleField (
        input_processor = MapCompose(convert_date_MDY),
        )
    utm_north = ContentField ()
    utm_east = ContentField ()
    datum = ContentField ()
    county = ContentField ()
    target_formation = ContentField()


class FracFocusScrape (NrcItem):
    insert_mode = 'insert'
    returning = 'seqid'

    api = KeyField (
            xpath = 'td[2]/text()',
        )
    job_date = KeyField (
            xpath = 'td[3]/text()',
            input_processor = MapCompose(convert_date_MDY)
        )
    state = ContentField (
            xpath = 'td[4]/text()',
        )
    county = ContentField (
            xpath = 'td[5]/text()',
        )
    operator = SingleField (
            xpath = 'td[6]/div/text()',
            input_processor = MapCompose(unicode.strip)
        )
    well_name = SingleField (
            xpath = 'td[7]/div/text()',
            input_processor = MapCompose(unicode.strip)
        )
    well_type = ContentField (
            xpath = 'td[8]/text()',
        )
    latitude = ContentField (
            xpath = 'td[9]/text()',
        )
    longitude = ContentField (
            xpath = 'td[10]/text()',
        )
    datum = ContentField (
            xpath = 'td[11]/text()',
        )

class FracFocusPDF (NrcItem):
    insert_mode = 'replace'

    seqid = KeyField ()
    pdf = ContentField()
    filename = ContentField()

def normalize_api (s, gmax=None):
    # format an API number as one of;
    #   ddd-ddddd
    #   dd-ddd-ddddd
    #   dd-ddd-ddddd-dd
    #   dd-ddd-ddddd-dd-dd
    groupings = {
        8 : ((0,3),(3,8)),
        10 : ((0,2),(2,5),(5,10)),
        12 : ((0,2),(2,5),(5,10),(10,12)),
        14 : ((0,2),(2,5),(5,10),(10,12),(12,14)),
    }

    stripped = strip_non_digits (s)
    grouping = groupings.get(len(stripped))
    if grouping:
        if gmax is not None and gmax in range(2,6):
            maxlen = (0,0,8,10,12,14)[gmax]
            grouping = groupings.get(min(len(stripped), maxlen))
        return '-'.join([stripped[i:j] for i,j in grouping])
    return s

def normalize_state (s):
    # convert full state names to two-letter state codes
    lookup = {
        'alabama': 'AL',
        'alaska': 'AK',
        'arizona': 'AZ',
        'arkansas': 'AR',
        'california': 'CA',
        'colorado': 'CO',
        'connecticut': 'CT',
        'delaware': 'DE',
        'florida': 'FL',
        'georgia': 'GA',
        'hawaii': 'HI',
        'idaho': 'ID',
        'illinois': 'IL',
        'indiana': 'IN',
        'iowa': 'IA',
        'kansas': 'KS',
        'kentucky': 'KY',
        'louisiana': 'LA',
        'maine': 'ME',
        'maryland': 'MD',
        'massachusetts': 'MA',
        'michigan': 'MI',
        'minnesota': 'MN',
        'mississippi': 'MS',
        'missouri': 'MO',
        'montana': 'MT',
        'nebraska': 'NE',
        'nevada': 'NV',
        'new hampshire': 'NH',
        'new jersey': 'NJ',
        'new mexico': 'NM',
        'new york': 'NY',
        'north carolina': 'NC',
        'north dakota': 'ND',
        'ohio': 'OH',
        'oklahoma': 'OK',
        'oregon': 'OR',
        'pennsylvania': 'PA',
        'rhode island': 'RI',
        'south carolina': 'SC',
        'south dakota': 'SD',
        'tennessee': 'TN',
        'texas': 'TX',
        'utah': 'UT',
        'vermont': 'VT',
        'virginia': 'VA',
        'washington': 'WA',
        'west virginia': 'WV',
        'wisconsin': 'WI',
        'wyoming': 'WY'
    }
    return lookup.get(s.lower(), s)

class FracFocusParse (NrcItem):
    insert_mode = 'replace'

    seqid = SingleField (
        )
    api = KeyField (
        input_processor = MapCompose(normalize_api)
        )
    fracture_date = KeyField (
            input_processor = MapCompose(convert_fuzzy_date)
        )
    state = SingleField (
    )
    county = SingleField (
    )
    operator = SingleField ()
    well_name = SingleField ()
    latitude = SingleField (
            input_processor = MapCompose(convert_lat)
    )
    longitude = SingleField (
            input_processor = MapCompose(convert_lng)
    )
    datum = ContentField ()
    production_type = SingleField (
            input_processor = MapCompose(title_case)
    )
    true_vertical_depth = SingleField(
            input_processor = MapCompose(strip_non_digits)
    )
    total_water_volume = SingleField(
            input_processor = MapCompose(strip_non_digits)
    )

class FracFocusParseChemical (NrcItem):
    insert_mode = 'replace'

    api = KeyField (
        input_processor = MapCompose(normalize_api)
        )
    fracture_date = KeyField (
            input_processor = MapCompose(convert_fuzzy_date)
        )
    row = KeyField()
    report_seqid = ContentField ()
    trade_name = ContentField ()
    supplier = ContentField ()
    purpose = ContentField ()
    ingredients = ContentField ()
    cas_number = ContentField ()
    additive_concentration = SingleField (
            input_processor = MapCompose(extract_largest_float)
             )
    hf_fluid_concentration = SingleField (
            input_processor = MapCompose(extract_largest_float)
             )
    ingredient_weight = SingleField (
            input_processor = MapCompose(strip_non_digits)
        )
    comments = ContentField ()


class FracFocusReport (NrcItem):
    insert_mode = 'replace'

    seqid = SingleField ()
    pdf_seqid = SingleField ()
    api = KeyField ()
    fracture_date = KeyField ()
    state = SingleField ()
    county = SingleField ()
    operator = SingleField ()
    well_name = SingleField ()
    production_type = SingleField ()
    latitude = SingleField ()
    longitude = SingleField ()
    datum = ContentField ()
    true_vertical_depth = SingleField()
    total_water_volume = SingleField()
    total_water_weight = SingleField()
    total_pct_in_fluid = SingleField()
    water_pct_in_fluid = SingleField()
    total_hf_weight = SingleField()
    err_field = SingleField()
    err_code = SingleField()
    err_comment = SingleField()

class FracFocusReportChemical (NrcItem):
    insert_mode = 'replace'

    seqid = SingleField ()
    api = KeyField ()
    fracture_date = KeyField ()
    row = KeyField()
    pdf_seqid = ContentField ()
    trade_name = ContentField ()
    supplier = ContentField ()
    purpose = ContentField ()
    ingredients = ContentField ()
    cas_number = ContentField ()
    additive_concentration = SingleField ()
    hf_fluid_concentration = SingleField ()
    ingredient_weight = SingleField ()
    comments = ContentField ()
    weight = ContentField ()
    cas_type = ContentField()

