#/bin/bash
psql skytruth <<END
\pset t
\pset format unaligned
\pset fieldsep ' '
select 'FFS         ', count(*) as FFS from "FracFocusScrape";
select 'FFR         ', count(*) as FFR from "FracFocusReport";
select 'FFC         ', count(*) as FFRC from "FracFocusReportChemical";

select 'FFR_dup     ', count(*) as FFR_dup from ffr_dup;
select 'FFR_0line   ', count(*) as FFR_0line from ffr_0line;
select 'FFRC_orphan ', count(*) as FFRC_orphan from ffrc_orphan;
select 'FFS_wo_FFR  ', count(*) as FFScrape_wo_report from ffscrape_wo_report;
select 'FFR_wo_FFS  ', count(*) as FFReport_wo_scrape from ffreport_wo_scrape;
END

