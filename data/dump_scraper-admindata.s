
pg_dump --data-only \
    -t"\"BotTask\"" \
    -t"\"BotTaskParams\"" \
    -t"\"FeedSource\"" \
    -t"\"RssFeed\"" \
    -t"\"NrcUnits\"" \
    -t"\"NrcMaterials\"" \
    -t"\"NrcScraperTarget\"" \
    -t"\"FeedSource\"" \
    -tfeedsource \
    skytruth

