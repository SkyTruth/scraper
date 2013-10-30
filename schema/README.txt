To create a clean database matching the skytruth schemas:
    1. delete existing database 'skytruth'
    2. create empty database 'skytruth', owner 'postgres'
    3. change the owner of the public schema to 'scraper'
    3. add schema 'scraper', owner 'scraper'
    4. Open query tool and load and execute file
       C:\Program Files\PostgreSQL\9.1\share\contrib\postgis-2.0\postgis.sql
       or equivalent.
    4a. ditto spatial_ref_sys.sql (same directory)
    5. Execute the latest pg-scraper-schema-v#.#.#.sql
       psql -Upostgres skytruth < pg-scraper-schema-v1.0.3.sql
    6. Execute the latest ../data/pg-scraper-admindata-v#.#.#.sql
       psql -Upostgres skytruth pg-scraper-admindata-v1.0.3.sql

If you change the schema
    1. generate a new schema file by running
       schema/dump_scraper_schema.s > pg-scraper-schema.v1.0.#.sql

If you add a table to the database,
    1. Add the table name to the list of tables in schema/dump_scraper_schema.s
    2. If the table has an autoincrement field then add its sequencer table
       name to the dump_scraper_schema.s table list as well.
    3. Create a separate sql (eg, NewTable.sql) that creates just that table.
       This can be done by extracting the table creation code from the
       full schema file created above (but only after the above 2 changes
       are made, so do steps 1 & 2, then generate the full schema, then
       do step 3).

If you change the admin data (eg. BotTaskParams)
    1. generate a new admindata file by running:
       data/dump_scraper-admindata.s > pg-scraper-admindata-v1.0.#.sql

If you add a scraper to the system,
    1. Add a file 'data/NewScraper.sql' that makes all necessary changes
       to the admin data for the new scraper.  This can be done by editing
       the data/pg-scraper-admindata.v1.0.#.sql file.

