#!/bin/bash

# ---- variables ----
# $1 = PROJECT_NAME
# -------------------

echo "Getting resources: $1"
gcloud asset search-all-resources \
	--scope="projects/$1" \
	--page-size=500 \
	--format=json >"$1.json"
