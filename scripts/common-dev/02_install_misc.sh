#!/bin/bash

############################
# node
############################
nvm install v18.19.0

############################
# python - pyenv
############################
### pyenv
curl https://pyenv.run | bash

export PATH=$PATH:$HOME/.pyenv/bin
export PYTHON_VERSION="3.11.8"
pyenv install -s $PYTHON_VERSION
pyenv global $PYTHON_VERSION

############################
# applications - golang
############################
go install github.com/GoogleCloudPlatform/cloud-sql-proxy/v2@latest
go install github.com/fawni/def@latest
go install github.com/kahnwong/pgconn@latest
go install github.com/kahnwong/swissknife@latest
go install github.com/kahnwong/timesheet@latest
go install github.com/kahnwong/totp@latest
go install github.com/ksoclabs/kbom@latest
go install github.com/nore-dev/fman@latest
go install github.com/peterldowns/nix-search-cli/cmd/nix-search@latest
go install github.com/saltfishpr/redis-viewer@latest
go install github.com/techygrrrl/timerrr@latest

############################
# applications - cargo
############################
cargo install imgcatr

############################
# applications - python
############################
if [[ $(uname -s) == 'Linux' ]]; then
	sudo apt install pipx -y
elif [[ $(uname -s) == 'Darwin' ]]; then
	brew install pipx
fi
pipx ensurepath

pipx install nbpreview
pipx install pip_search
pipx install dvc[all]
pipx install topydo[columns]

pipx install poetry
pipx inject poetry poetry-plugin-export

############################
# applications - node
############################
nvm use v18.19.0

npm set prefix ~/.npm-global
npm install -g yarn
npm install -g @jaebradley/wakatime-cli
npm install -g markdownlint-cli

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
gh config set git_protocol ssh -h github.com
gh extension install dlvhdr/gh-dash
gh extension install kawarimidoll/gh-graph
gh extension install mislav/gh-branch
gh extension install seachicken/gh-poi
gh extension install geoffreywiseman/gh-actuse
gh extension install stoe/gh-report
gh extension install hectcastro/gh-metrics
gh extension install rsese/gh-actions-status

echo "" # force return exit 0 so it'll continue executing downstream steps. exit 1 is from package already exists
