#!/bin/bash

ARCHIVE_FILE="$(pwd)/programs/ssh/keys/ssh-keys.zip"

if [[ "$1" == "backup" ]]; then
	mkdir programs/ssh/keys/temp
	cd programs/ssh/keys/temp &&
		find ~/.ssh -maxdepth 1 -type f ! -name "*.pub" ! -name "config" ! -name "authorized_keys" ! -name "developer_key" ! -name "environment" ! -name "known_hosts" -exec cp {} . \; &&
		zip "$ARCHIVE_FILE" ./* &&
		cd .. && rm -rf temp

	sops -e "$ARCHIVE_FILE" >"$ARCHIVE_FILE.sops"
	rm -f "$ARCHIVE_FILE"
else
	sops -d "$ARCHIVE_FILE.sops" >"$ARCHIVE_FILE"
	unzip "$ARCHIVE_FILE" -d ~/.ssh/
	rm -f "$ARCHIVE_FILE"
fi
