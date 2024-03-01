#!/bin/bash

ARCHIVE_FILE="$(pwd)/programs/ssh/keys/ssh-keys.zip"

mkdir programs/ssh/keys/temp
cd programs/ssh/keys/temp &&
	cp ~/.ssh/*.pem . &&
	zip "$ARCHIVE_FILE" ./* &&
	cd .. && rm -rf temp

sops -e "$ARCHIVE_FILE" >"$ARCHIVE_FILE.sops"
rm -f "$ARCHIVE_FILE"
