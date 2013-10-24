from scrapy.spider import BaseSpider
from scrapy.selector import HtmlXPathSelector
from scrapy.item import Item, Field

import csv
import StringIO
import datetime
import shapely.geometry
import shapely.wkt


class ViirsSpider(BaseSpider):
    name = "viirs"
    start_urls = ["http://www.ngdc.noaa.gov/dmsp/data/viirs_fire/viirs_html/download_viirs_fire.html"]

    def parse(self, response):
        baseurl = os.path.dirname(self.start_urls)

        hxs = HtmlXPathSelector(response)

        res = []
        for entry in hxs.select("//ul[@class='treeview']/li/ul/li"):
            date = entry.select("text()[1]").extract()[0]
            url = entry.select("a[text()='CSV']/@href").extract()[0]

            # Americans using a sane date format... who would have thought? YearMonthDay (but no separator)
            date = datetime.datetime(int(date[0:4]), int(date[4:6]), int(date[6:8]))
            
            # This won't work on Windows... but whatever, too much work to do "by hand"
            url = os.path.normpath(os.path.join(baseurl, url))

            req = scrapy.http.Request(url, callback=self.parse_csv)
            req.meta['date'] = date
            res.append(req)

        return res
    
    def parse_csv(self, response):
        date = response.meta['date']

        rows = iterator(csv.reader(StringIO.StringIO(response.body)))
        
        header = rows.next()

        fields = dict((name, Field()) for name in header
                      if name not in ("Lon_GMTCO", "Lat_GMTCO"))
        fields["Coord_GMTCO"] = Field()
        Detection = type(Item)("Detection", (Item,), fields)

        res = []
        for row in rows:
            row = dict(zip(header, row))
            # Here however, they've decided to use a random date format...
            row["Date_Proc"] = datetime.datetime.strptime(row["Date_Proc"], "%d-%b-%Y %H:%M:%S")
            row["Coord_GMTCO"] = shapely.geometry.Point(row["Lon_GMTCO"], row["Lat_GMTCO"])
            del row["Lon_GMTCO"]
            del row["Lat_GMTCO"]
            res.append(Detection(row))

        return res
