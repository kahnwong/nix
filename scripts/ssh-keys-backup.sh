#!/bin/bash

ARCHIVE_FILE="$(pwd)/programs/ssh/keys/ssh-keys.zip"

cd ~/.ssh &&
	fd pem --max-depth 1 | xargs zip "$ARCHIVE_FILE"

sops -e "$ARCHIVE_FILE" >"$ARCHIVE_FILE.sops"

rm -f "$ARCHIVE_FILE"
