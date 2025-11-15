#!/bin/bash

if [ -z "$SSH_AUTH_SOCK" ]; then
	eval "$(ssh-agent -s)"
fi

ssh-add ~/.ssh/github-signing-key

# # on tahoe it looks like `--apple-use-keychain` flat is no longer required
# ssh-add --apple-use-keychain ~/.ssh/github-signing-key
