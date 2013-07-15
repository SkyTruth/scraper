
pg_dump --data-only -Upostgres \
    -t"\"BotTask\"" \
    -t"\"BotTaskParams\"" \
    -t"\"FeedSource\"" \
    -t"\"RssFeed\"" \
    -t"\"NrcUnits\"" \
    -t"\"NrcMaterials\"" \
    -t"\"NrcScraperTarget\"" \
    skytruth

