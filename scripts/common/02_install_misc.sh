#!/bin/bash

export PATH=$PATH:$HOME/.nix-profile/bin

############################
# python - pyenv
############################
### pyenv
curl https://pyenv.run | bash

export PATH=$PATH:$HOME/.pyenv/bin
export PYTHON_VERSION="3.11.3"
pyenv install -s $PYTHON_VERSION
pyenv global $PYTHON_VERSION

############################
# applications - golang
############################
go install github.com/peterldowns/nix-search-cli/cmd/nix-search@latest
go install github.com/saltfishpr/redis-viewer@latest

############################
# applications - node
############################
npm set prefix ~/.npm-global
npm install -g @jaebradley/wakatime-cli

############################
# applications - python
############################
pipx install nbpreview
pipx install pip_search
pipx install dvc[s3]
pipx install topydo[columns]

############################
# kubectl
############################
krew install nodepools
krew install status
krew install outdated
krew install images

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
