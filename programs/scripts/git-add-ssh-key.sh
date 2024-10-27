#!/bin/bash

if [[ $(uname -s) == 'Darwin' ]]; then
	ssh-add --apple-use-keychain ~/.ssh/github_signing_key.pem
	ssh-add --apple-use-keychain ~/.ssh/gitea_signing_key.pem

elif [[ $(uname -s) == 'Linux' ]]; then
	# ssh-agent fish # only required if sometimes ssh version borks
	ssh-add ~/.ssh/github_signing_key.pem
	ssh-add ~/.ssh/gitea_signing_key.pem
fi
