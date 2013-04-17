# -*- coding: utf-8 -*-
"""
Created on Tue Apr 16 13:56:52 2013

@author: Craig
"""

# standard modules
import logging
import os.path
from datetime import date

# site modules

# local modules
from DBS3 import DBS3_session

# CONSTANTS

# SQL strings
sql_temp_join_table = """
DROP TABLE IF EXISTS "TEMP_FracFocus_join";
--CREATE  TABLE "TEMP_FracFocus_join" AS
CREATE TEMP TABLE "TEMP_FracFocus_join" AS
    SELECT  r.seqid AS r_seqid,
            r.pdf_seqid,
            r.api,
            r.fracture_date,
            COALESCE(r.state, ''::character varying) AS state,
            COALESCE(r.county, ''::character varying) AS county,
            COALESCE(r.operator, ''::character varying) AS operator,
            COALESCE(r.well_name, ''::character varying) AS well_name,
            COALESCE(r.production_type, ''::character varying)
                    AS production_type,
            COALESCE(r.latitude, NULL::double precision) AS latitude,
            COALESCE(r.longitude, NULL::double precision) AS longitude,
            COALESCE(r.datum, ''::character varying) AS datum,
            COALESCE(r.true_vertical_depth, NULL::double precision)
                    AS true_vertical_depth,
            COALESCE(r.total_water_volume, NULL::double precision)
                    AS total_water_volume,
            COALESCE(r.published, NULL::timestamp without time zone)
                    AS published,
            c.seqid AS c_seqid,
            --c.pdf_seqid AS c_pdf_seqid,
            c.api AS c_api,
            c.fracture_date AS c_fracture_date,
            c."row",
            COALESCE(c.trade_name, ''::character varying) AS trade_name,
            COALESCE(c.supplier, ''::character varying) AS supplier,
            COALESCE(c.purpose, ''::character varying) AS purpose,
            COALESCE(c.ingredients, ''::character varying) AS ingredients,
            COALESCE(c.cas_number, ''::character varying) AS cas_number,
            COALESCE(c.additive_concentration, NULL::double precision)
                    AS additive_concentration,
            COALESCE(c.hf_fluid_concentration, NULL::double precision)
                    AS hf_fluid_concentration,
            COALESCE(c.comments, ''::character varying) AS comments,
            COALESCE(c.cas_type, ''::character varying) AS cas_type
    FROM "FracFocusReport" r
         JOIN "FracFocusReportChemical" c
         ON ((r.pdf_seqid = c.pdf_seqid))
    WHERE r.published < date_trunc('month'::text, now())
          and extract(year from r.published) = %s
;
"""

# VIEW "EXPORT_FracFocusReport"
sql_FracFocusReport = """
SELECT
        seqid as r_seqid,
        pdf_seqid,
        api,
        fracture_date,
        state,
        county,
        operator,
        well_name,
        production_type,
        latitude,
        longitude,
        datum,
        true_vertical_depth,
        total_water_volume,
        published
--FROM "TEMP_FracFocus_join"
FROM "FracFocusReport"
WHERE published < date_trunc('month'::text, now())
      and extract(year from published) = %s
;
"""

# VIEW "EXPORT_FracFocusChemical"
sql_FracFocusChemical = """
SELECT
        c_seqid,
        pdf_seqid,
        api,
        fracture_date,
        "row",
        trade_name,
        supplier,
        purpose,
        ingredients,
        cas_number,
        additive_concentration,
        hf_fluid_concentration,
        comments,
        cas_type
FROM "TEMP_FracFocus_join"
;
--%s
"""

# VIEW "EXPORT_FracFocusCombined"
sql_FracFocusCombined = """
SELECT
        r_seqid,
        pdf_seqid,
        api,
        fracture_date,
        state,
        county,
        operator,
        well_name,
        production_type,
        latitude,
        longitude,
        datum,
        true_vertical_depth,
        total_water_volume,
        published,
        c_seqid,
        "row",
        trade_name,
        supplier,
        purpose,
        ingredients,
        cas_number,
        additive_concentration,
        hf_fluid_concentration,
        comments,
        cas_type
FROM "TEMP_FracFocus_join"
;
--%s
"""

# Job list
# (s3name, sql_string)
JOBLIST = [("FracFocusReport", sql_FracFocusReport),
           ("FracFocusChemical", sql_FracFocusChemical),
           ("FracFocusCombined", sql_FracFocusCombined),
          ]


def main():
    session = DBS3_session()
    session.argparser.add_argument(
            "--year",
            dest='year',
            default = None,
            help='The year for which data is exported, '
                 'defaults to the year of the prior month')

    args = session.parse_args()
    if args.year is None:
        today = date.today()
        args.year = today.year if today.month > 1 else today.year-1

    loglevel = logging.DEBUG if args.verbose else logging.INFO
    logging.basicConfig(level=loglevel)
    logging.debug("args: %s"%(args,))


    try:
        # create temporary join table
        session.submitSQL(sql_temp_join_table%args.year)
        for (s3Name, query) in JOBLIST:
            fname = "%s_%s"%(args.year, s3Name)
            fpath = session.query_to_file(query%args.year, fname)
            s3Name = os.path.basename(fpath)
            if args.compress:
                s3Name += '.zip'
            session.ship_file(fpath,
                              args.compress,
                              args.bucketname,
                              s3Name,
                              args.public)
    finally:
        session.close()

if __name__ == "__main__":
    main()

