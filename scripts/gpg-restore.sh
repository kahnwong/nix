#!/bin/bash

# ref: <https://serverfault.com/questions/86048/how-to-backup-gpg>

mkdir -p gpg
ID=karn@karnwong.me

gpg --import "gpg/$ID.pub"
gpg --import "gpg/$ID.priv"
gpg --import "gpg/$ID.sub_priv"
gpg --import-ownertrust "gpg/ownertrust.txt"

gpg --edit-key "$ID"

echo "Type following after accessing gpg shell"
echo "gpg> trust"
echo "Your decision? 5"
