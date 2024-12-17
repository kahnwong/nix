#!/bin/bash

# ---- variables ----
# $1 = ORG_NAME
# -------------------

gh api \
	-H "Accept: application/vnd.github+json" \
	-H "X-GitHub-Api-Version: 2022-11-28" \
	"/orgs/$1/repos" | jq -r '.[].name' | sort
