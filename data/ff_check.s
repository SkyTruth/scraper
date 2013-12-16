#/bin/bash
psql skytruth <<END
\pset t
\pset format unaligned
\pset fieldsep ' '
select 'FFS         ', count(*) from "FracFocusScrape";
select 'FFR         ', count(*) from "FracFocusReport";
select 'FFC         ', count(*) from "FracFocusReportChemical";

select 'FFR_dup     ', count(*) from ffr_dup;
select 'FFR_0line   ', count(*) from ffr_0line;
select 'FFRC_orphan ', count(*) from ffrc_orphan;
select 'FFS_wo_FFR  ', count(*) from ffs_wo_ffr;
select 'FFR_wo_FFS  ', count(*) from ffr_wo_ffs;
END

