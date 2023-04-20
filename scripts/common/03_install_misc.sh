#!/bin/bash

export PATH=$PATH:$HOME/.nix-profile/bin

############################
# applications - node
############################
npm set prefix ~/.npm-global
npm install -g @jaebradley/wakatime-cli

############################
# applications - golang
############################
go install github.com/nore-dev/fman@latest
go install github.com/spectralops/senv@latest
go install github.com/yitsushi/totp-cli@latest

############################
# python - pyenv
############################
### pyenv
curl https://pyenv.run | bash

export PATH=$PATH:$HOME/.pyenv/bin
export PYTHON_VERSION="3.10.8"
pyenv install -s $PYTHON_VERSION
pyenv global $PYTHON_VERSION

############################
# applications - python
############################
pipx install nbpreview
pipx install pip_search

####################
# git
####################
# create ssh key
if [ ! -f "$HOME/.ssh/github" ]; then
	ssh-keygen -b 2048 -t rsa -f ~/.ssh/github -q -N ""
else
	echo "$HOME/.ssh/github already exists"
fi

# gh-cli extensions
gh auth login
gh extension install dlvhdr/gh-dash
gh extension install kawarimidoll/gh-graph
gh extension install mislav/gh-branch
gh extension install seachicken/gh-poi
gh extension install geoffreywiseman/gh-actuse
gh extension install stoe/gh-report
gh extension install hectcastro/gh-metrics
gh extension install rsese/gh-actions-status

echo "" # force return exit 0 so it'll continue executing downstream steps. exit 1 is from package is already existed
