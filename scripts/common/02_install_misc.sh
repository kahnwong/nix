#!/bin/bash

export PATH=$PATH:$HOME/.nix-profile/bin

####################
# git
####################
# create ssh key
if [ ! -f "$HOME/.ssh/github" ]; then
	ssh-keygen -b 2048 -t rsa -f ~/.ssh/github -q -N ""
else
	echo "$HOME/.ssh/github already exists"
fi

echo "" # force return exit 0 so it'll continue executing downstream steps. exit 1 is from package is already existed
