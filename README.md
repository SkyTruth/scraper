# SkyTruth Web Scraper Tool

## Installation ##

sudo apt-get install python-dateutil python-scrapy python-psycopg2 python-xlrd python-pdfminer python-beautifulsoup python-feedparser python-setupdoc postgis

git clone git@github.com:SkyTruth/FTutils.git
cd FTUtils
python setup.py install
cd ..
rm FTUtils -rf

git clone git@github.com:SkyTruth/fracfocustools.git
cd fracfocustools
python setup.py install
cd ..
rm fracfocustools -rf



mysql -u root -p <<EOF
create database scraper_db;
grant all on scraper_db.* to 'scraper'@'localhost' identified by 'password';
FLUSH PRIVILEGES;
EOF

mysql -u scraper -p scraper_db < schema/mysql.sql 



su - postgres
createuser scraper
createdb scraper_db
psql scraper_db <<EOF
grant all on database scraper_db to scraper;
alter role scraper with password 'password';
CREATE EXTENSION hstore;
EOF

psql scraper_db -f /usr/share/postgresql/9.1/contrib/postgis-1.5/postgis.sql
psql scraper_db -f /usr/share/postgresql/9.1/contrib/postgis-1.5/spatial_ref_sys.sql 

psql scraper_db <<EOF
select postgis_lib_version();
GRANT ALL ON geometry_columns TO PUBLIC;
GRANT ALL ON spatial_ref_sys TO PUBLIC;
GRANT ALL ON geography_columns TO PUBLIC;
EOF

# copy schema/pgsql.sql to somewhere where the user postgres can read it first, like /tmp or something
psql scraper_db < schema/pgsql.sql
