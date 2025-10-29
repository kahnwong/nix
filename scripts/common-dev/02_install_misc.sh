#!/bin/bash

############################
# node
############################
fnm install v22.12.0
fnm default v22.12.0

############################
# go
############################
GO_VERSION="go1.25.1"
go install "golang.org/dl/${GO_VERSION}@latest"
"${GO_VERSION}" download

############################
# rust
############################
rustup default stable

############################
# applications - golang
############################
#go install github.com/ksoclabs/kbom@latest
#go install github.com/protomaps/go-pmtiles@latest
go install github.com/elliot40404/modo/cmd/modo@latest
go install github.com/fawni/def@latest
go install github.com/kahnwong/article-summarizer@latest
go install github.com/kahnwong/config-init@latest
go install github.com/kahnwong/habit-tracker@latest
go install github.com/kahnwong/invoice@latest
go install github.com/kahnwong/pgconn@latest
go install github.com/kahnwong/totp@latest
go install github.com/kahnwong/waka@latest
go install github.com/kahnwong/workspace-init@latest
go install github.com/terraform-docs/terraform-docs@latest # nix borks

## private utils
export GIT_CONFIG_GLOBAL="$HOME/.config/git/profiles/go-install"
export GOPRIVATE="github.com/kahnwong/*"

# # need to install from local because bundled assets
# go install github.com/kahnwong/thailand-train-fare-calculator@latest
go install github.com/kahnwong/gcal-tui@latest
go install github.com/kahnwong/grocery@latest
go install github.com/kahnwong/timesheet@latest
go install github.com/kahnwong/umamit@latest

############################
# applications - cargo
############################

############################
# applications - python
############################
# uv tool install nbpreview
pixi global install qgis
uv tool install "dvc[s3]"
uv tool install huggingface_hub[cli]
uv tool install pip_search
uv tool install topydo[columns]

############################
# applications - node
############################
npm set prefix ~/.npm-global
yarn global add @quasar/cli
yarn global add create-quasar
yarn global add create-slidev
yarn global add playwright-chromium

############################
# kubectl
############################
krew install images
krew install node-resource
krew install nodepools
krew install outdated
krew install status

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
gh extension install Shresht7/gh-license
gh extension install dlvhdr/gh-dash
gh extension install github/gh-models
gh extension install redraw/gh-install
gh extension install seachicken/gh-poi

# install executables via gh release
## better for .deb or tools requiring global discovery
## cons: need manual interactions
gh install domcyrus/rustnet
gh install houseabsolute/ubi
gh install kahnwong/cpubench-release
gh install murat-cileli/clyp

# install executables via ubi
ubi --project bodaay/HuggingFaceModelDownloader --in ~/.local/bin/ --rename-exe hfdownloader
ubi --project kahnwong/swissknife --in ~/.local/bin/
ubi --project mongodb/kingfisher --in ~/.local/bin/
ubi --project pythops/oryx --in ~/.local/bin/

if [[ $(uname -s) == 'Darwin' ]]; then
	gh install browsh-org/browsh
fi

echo "" # force return exit 0 so it'll continue executing downstream steps. exit 1 is from package already exists
