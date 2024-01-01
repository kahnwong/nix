#!/bin/bash

infracost breakdown \
	--format html \
	--out-file infracost-report.html \
	--usage-file /tmp/ignore.yml \
	--sync-usage-file \
	--path .
