#!/bin/bash

ARCHIVE_FILE="$(pwd)/programs/ssh/keys/ssh-keys.zip"

sops -d "$ARCHIVE_FILE.sops" >"$ARCHIVE_FILE"
unzip "$ARCHIVE_FILE" -d ~/.ssh/
rm -f "$ARCHIVE_FILE"
