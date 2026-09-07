#!/bin/bash

# ---- variables ----
# $1 = REPO_NAME
# -------------------

gh repo edit "kahnwong/$1" --visibility private --accept-visibility-change-consequences
gh repo archive "kahnwong/$1" --yes
gh transfer "kahnwong/$1" kahnwong-archive
