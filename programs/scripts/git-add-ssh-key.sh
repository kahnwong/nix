#!/bin/bash

if [[ $(uname -s) == 'Darwin' ]]; then
	ssh-add --apple-use-keychain ~/.ssh/github_signing_key.pem
	ssh-add --apple-use-keychain ~/.ssh/forgejo_signing_key.pem

elif [[ $(uname -s) == 'Linux' ]]; then
	ssh-agent fish
	ssh-add ~/.ssh/github_signing_key.pem
	ssh-add ~/.ssh/forgejo_signing_key.pem
fi
