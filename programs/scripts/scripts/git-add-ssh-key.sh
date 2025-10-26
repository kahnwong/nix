#!/bin/bash

if [[ $(uname -s) == 'Darwin' ]]; then
	ssh-add --apple-use-keychain ~/.ssh/github-signing-key.pem

elif [[ $(uname -s) == 'Linux' ]]; then
	if [ -z "$SSH_AUTH_SOCK" ]; then
		eval "$(ssh-agent -s)"
	fi

	# ssh-agent fish # only required if sometimes ssh version borks
	ssh-add ~/.ssh/github-signing-key.pem
fi
