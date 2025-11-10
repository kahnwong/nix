#!/bin/bash

ARCHIVE_FILE="$(pwd)/programs/ssh/keys/ssh-keys.zip"

mkdir programs/ssh/keys/temp
cd programs/ssh/keys/temp &&
	find ~/.ssh -maxdepth 1 -type f ! -name "config" ! -name "authorized_keys" ! -name "known_hosts" -exec cp {} . \; &&
	zip "$ARCHIVE_FILE" ./* &&
	cd .. && rm -rf temp

sops -e "$ARCHIVE_FILE" >"$ARCHIVE_FILE.sops"
rm -f "$ARCHIVE_FILE"
