#!/bin/bash

# 'live' is "0" to see commands (default), "1" to execute commands with '-l'
live="0"
state="37"
if [ "$1" = "-l" ]
then
	live="1"
	shift
fi
if [ "$1" = "-s" ]
then
	state=$2
	shift
	shift
fi

if [ $live = "1" ]
then
	curl="curl"
else
	curl="echo curl"
fi

if [ $# -gt 1 ]
then
	scraper="$1"
	sequence="$2"
elif [ $# -gt 0 ]
then
	scraper="$1"
	sequence="0"
	echo "Defaulting to sequence 0 (primary scrapers)"
else
	sequence="-1"
	scraper="none"
	echo "No arguments found."
	echo "usage: $0 [-l] [-s #] <scraper> [<sequence>]"
	echo "    -l : a live run, commands will be executed."
        echo "         Otherwise commands will only be printed."
	echo "    -s # : set the FracFocus state by number."
	echo "           default is 37 (Pennsylvania)."
	echo "    <scraper> : in 'all' 'Cogis' 'Nrc' 'PA' 'WV' 'Frac' 'Usha'"
	echo "    <sequence> : in 0-6, default is 0"
	exit
fi

if [ $live = "1" ]
then
	echo "Executing test: scraper $scraper, sequence $sequence ..."
	sleep 3
	echo "Go" 
fi

# PRIMARY SCRAPERS
if [ $sequence -eq 0 ]
then
	if [ $scraper = "all" ] || [ $scraper = "Cogis" ]
	then
$curl http://localhost:6800/schedule.json -d project=default -d spider=CogisScraper
$curl http://localhost:6800/schedule.json -d project=default -d spider=CogisSpillScraper
	fi

	if [ $scraper = "all" ] || [ $scraper = "Nrc" ]
	then
$curl http://localhost:6800/schedule.json -d project=default -d spider=NrcScraper
	fi

	if [ $scraper = "all" ] || [ $scraper = "PA" ]
	then
$curl http://localhost:6800/schedule.json -d project=default -d spider=PAPermitScraper
$curl http://localhost:6800/schedule.json -d project=default -d spider=PASpudScraper
$curl http://localhost:6800/schedule.json -d project=default -d spider=PAViolationScraper
	fi

	if [ $scraper = "all" ] || [ $scraper = "WV" ]
	then
$curl http://localhost:6800/schedule.json -d project=default -d spider=WVPermitScraper
	fi

	if [ $scraper = "all" ] || [ $scraper = "Frac" ]
	then
$curl http://localhost:6800/schedule.json -d project=default -d spider=FracFocusScraper -d state=$state
	fi

	if [ $scraper = "all" ] || [ $scraper = "Usha" ]
	then
$curl http://localhost:6800/schedule.json -d project=default -d spider=UshahidiPublisherTest
	fi

fi

# SECONDARY SCRAPERS
if [ $scraper = "all" ] || [ $scraper = "Cogis" ]
then
	if [ $sequence -eq 1 ]
	then
$curl http://localhost:6800/schedule.json -d project=default -d spider=CogisLocator
$curl http://localhost:6800/schedule.json -d project=default -d spider=CogisSpillLocator
	fi
fi

if [ $scraper = "all" ] || [ $scraper = "Nrc" ]
then
	if [ $sequence -eq 1 ]
	then
$curl http://localhost:6800/schedule.json -d project=default -d spider=NrcMaterialsScraper
$curl http://localhost:6800/schedule.json -d project=default -d spider=NrcFullReportScraper
	fi

	if [ $sequence -eq 2 ]
	then
$curl http://localhost:6800/schedule.json -d project=default -d spider=NrcExtractor
	fi

	if [ $sequence -eq 3 ]
	then
$curl http://localhost:6800/schedule.json -d project=default -d spider=NrcGeocoder
	fi

	if [ $sequence -eq 4 ]
	then
$curl http://localhost:6800/schedule.json -d project=default -d spider=NrcAnalyzer
	fi

	if [ $sequence -eq 5 ]
	then
$curl http://localhost:6800/schedule.json -d project=default -d spider=NrcTagger
	fi

	if [ $sequence -eq 6 ]
	then
$curl http://localhost:6800/schedule.json -d project=default -d spider=NrcFeedGenerator
	fi
fi

if [ $scraper = "all" ] || [ $scraper = "Frac" ]
then
	if [ $sequence -eq 1 ]
	then
$curl http://localhost:6800/schedule.json -d project=default -d spider=FracFocusPDFDownloader
	fi

	if [ $sequence -eq 2 ]
	then
$curl http://localhost:6800/schedule.json -d project=default -d spider=FracFocusPDFParser
	fi

	if [ $sequence -eq 3 ]
	then
curl http://localhost:6800/schedule.json -d project=default -d spider=FracFocusAnalyzer
	fi

	if [ $sequence -eq 4 ]
	then
$curl http://localhost:6800/schedule.json -d project=default -d spider=FracFocusFeedGenerator
	fi
fi

