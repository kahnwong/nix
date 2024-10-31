#!/bin/bash

############################
# node
############################
fnm install v20.17.0
fnm default v20.17.0

############################
# go
############################
go install golang.org/dl/go1.23.2@latest
go1.23.2 download

############################
# rust
############################
rustup default stable

############################
# python - pyenv
############################
### pyenv
curl https://pyenv.run | bash

export PATH=$PATH:$HOME/.pyenv/bin
export PYTHON_VERSION="3.12.6"
pyenv install -s $PYTHON_VERSION
pyenv global $PYTHON_VERSION

############################
# applications - golang
############################
go install github.com/GoogleCloudPlatform/cloud-sql-proxy/v2@latest
go install github.com/fawni/def@latest
go install github.com/kahnwong/article-summarizer@latest
go install github.com/kahnwong/config-init@latest
go install github.com/kahnwong/pgconn@latest
go install github.com/kahnwong/swissknife@latest
go install github.com/kahnwong/timesheet@latest
go install github.com/kahnwong/workspace-init@latest
go install github.com/kahnwong/totp@latest
go install github.com/kahnwong/waka@latest
go install github.com/ksoclabs/kbom@latest
go install github.com/nore-dev/fman@latest
go install github.com/peterldowns/nix-search-cli/cmd/nix-search@latest
go install github.com/protomaps/go-pmtiles@latest
go install github.com/saltfishpr/redis-viewer@latest

############################
# applications - cargo
############################
cargo install imgcatr

############################
# applications - python
############################
# uv tool install nbpreview
uv tool install pip_search
uv tool install "dvc[all]"
uv tool install nbstripout
uv tool install topydo[columns]
uv tool install poetry
uv tool install poetry-plugin-export

############################
# applications - node
############################
npm set prefix ~/.npm-global
npm install -g yarn

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
gh extension install Shresht7/gh-license
gh extension install davidraviv/gh-clean-branches

echo "" # force return exit 0 so it'll continue executing downstream steps. exit 1 is from package already exists
