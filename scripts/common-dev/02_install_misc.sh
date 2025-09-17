#!/bin/bash

############################
# node
############################
fnm install v22.12.0
fnm default v22.12.0

############################
# go
############################
go install golang.org/dl/go1.25.1@latest
go1.25.1 download

############################
# rust
############################
rustup default stable

############################
# applications - golang
############################
#go install github.com/ksoclabs/kbom@latest
#go install github.com/protomaps/go-pmtiles@latest
go install github.com/GoogleCloudPlatform/cloud-sql-proxy/v2@latest
go install github.com/ayoisaiah/f2/v2/cmd/f2@latest
go install github.com/caarlos0/svu/v3@latest
go install github.com/charmbracelet/mods@latest
go install github.com/elliot40404/modo/cmd/modo@latest
go install github.com/fawni/def@latest
go install github.com/kahnwong/article-summarizer@latest
go install github.com/kahnwong/config-init@latest
go install github.com/kahnwong/habit-tracker@latest
go install github.com/kahnwong/invoice@latest
go install github.com/kahnwong/pgconn@latest
go install github.com/kahnwong/swissknife@latest
go install github.com/kahnwong/totp@latest
go install github.com/kahnwong/waka@latest
go install github.com/kahnwong/workspace-init@latest
go install github.com/peterldowns/nix-search-cli/cmd/nix-search@latest
go install github.com/sinclairtarget/git-who@latest

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
cargo install --locked --git https://github.com/j178/prek
cargo install mcat
cargo install mdsf --locked
cargo install sendme
cargo install somo

############################
# applications - python
############################
# uv tool install nbpreview
pixi global install qgis
uv tool install "dvc[s3]"
uv tool install beancount
uv tool install beanquery
uv tool install https://github.com/superstarryeyes/lue
uv tool install nbstripout
uv tool install pip_search
uv tool install topydo[columns]
## for mdsf
uv tool install beautysh
uv tool install usort

############################
# applications - node
############################
npm set prefix ~/.npm-global
yarn global add @google/gemini-cli
yarn global add @quasar/cli
yarn global add create-quasar
yarn global add create-slidev
yarn global add markdown-link-check
yarn global add playwright-chromium
yarn global add prettier

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
gh extension install davidraviv/gh-clean-branches
gh extension install dlvhdr/gh-dash
gh extension install https://github.com/github/gh-models
gh extension install kawarimidoll/gh-graph
gh extension install mislav/gh-branch
gh extension install redraw/gh-install
gh extension install seachicken/gh-poi

## adhoc - trufflehog can now be installed via gh extension
# git clone https://github.com/trufflesecurity/trufflehog.git /tmp/trufflehog-src
# cd /tmp/trufflehog-src || exit
# go install
# rm -rf /tmp/trufflehog-src
# cd - || exit

#gh install trufflesecurity/trufflehog
gh install bodaay/HuggingFaceModelDownloader
gh install mongodb/kingfisher
gh install murat-cileli/clyp
gh install pythops/oryx

echo "" # force return exit 0 so it'll continue executing downstream steps. exit 1 is from package already exists
