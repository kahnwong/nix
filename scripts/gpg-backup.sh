#!/bin/bash

# ref: <https://serverfault.com/questions/86048/how-to-backup-gpg>

mkdir -p gpg
ID=karn@karnwong.me
gpg --export --armor "$ID" >"gpg/$ID.pub"
gpg --export-secret-keys --armor "$ID" >"gpg/$ID.priv"
gpg --export-secret-subkeys --armor "$ID" >"gpg/$ID.sub_priv"
gpg --export-ownertrust >"gpg/ownertrust.txt"
