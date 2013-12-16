
    CREATE VIEW FFR_dup as
    select r2.* from "FracFocusReport" r1
        inner join "FracFocusReport" r2
        on r1.api = r2.api and
           r1.fracture_date = r2.fracture_date and
           r1.seqid < r2.seqid;

    CREATE VIEW FFR_0line as
    select r.* from "FracFocusReport" r
        left join (
            select count(*), pdf_seqid
            from "FracFocusReportChemical"
            group by pdf_seqid
         ) c
         on r.pdf_seqid = c.pdf_seqid
    where c.pdf_seqid is NULL;

    CREATE VIEW FFRC_orphan as
    select c.* from "FracFocusReportChemical" c
        left join "FracFocusReport" r
        on c.pdf_seqid = r.pdf_seqid
    where r.pdf_seqid is NULL;

    CREATE VIEW FFScrape_wo_report as
    select s.* from "FracFocusScrape" s
        left join "FracFocusReport" r
        on s.seqid = r.pdf_seqid
    where r.seqid is NULL;

    CREATE VIEW FFReport_wo_scrape as
    select r.* from "FracFocusReport" r
        left join "FracFocusScrape" s
        on r.pdf_seqid = s.seqid
    where s.seqid is NULL;

