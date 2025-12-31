#!/bin/bash

############################
# node
############################
NODE_VERSION="v24.12.0"
fnm install "$NODE_VERSION"
fnm default "$NODE_VERSION"

############################
# go
############################
GO_VERSION="go1.25.4"
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
go install github.com/kahnwong/article-summarizer@latest
go install github.com/kahnwong/config-init@latest
go install github.com/kahnwong/habit-tracker@latest
go install github.com/kahnwong/invoice@latest
go install github.com/kahnwong/pgconn@latest
go install github.com/kahnwong/totp@latest
go install github.com/kahnwong/waka@latest
go install github.com/kahnwong/workspace-init@latest

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
cargo install --locked cargo-zigbuild
cargo install --locked cross

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

# gitlab
glab auth login

# install executables via gh release
## better for .deb or tools requiring global discovery
## cons: need manual interactions

# install executables via ubi
echo "Installing ubi. On darwin you need to install homebrew beforehand, then re-run this"
curl --silent --location \
	https://raw.githubusercontent.com/houseabsolute/ubi/master/bootstrap/bootstrap-ubi.sh |
	sudo sh

ubi --project bodaay/HuggingFaceModelDownloader --in ~/.local/bin/ --rename-exe hfdownloader
ubi --project charmbracelet/crush --in ~/.local/bin
ubi --project crate-ci/typos --in ~/.local/bin/
ubi --project elliot40404/modo --in ~/.local/bin/
ubi --project fawni/def --in ~/.local/bin/
ubi --project kahnwong/cpubench-release -e cpubench --in ~/.local/bin/
ubi --project mongodb/kingfisher --in ~/.local/bin/
ubi --project terraform-docs/terraform-docs --in ~/.local/bin/ # nix borks
ubi --project yt-dlp/yt-dlp --in ~/.local/bin/                 # nix still doesn't support latest version

## os specific apps
if [[ $(uname -s) == 'Linux' ]]; then
	ubi --project pythops/oryx --in ~/.local/bin/
elif [[ $(uname -s) == 'Darwin' ]]; then
	gh install browsh-org/browsh
fi

## these need sudo
if [[ $(uname -s) == 'Linux' ]]; then
	UBI_INSTALL_PATH="/usr/bin/"
	sudo ubi --project murat-cileli/clyp --in "$UBI_INSTALL_PATH"
elif [[ $(uname -s) == 'Darwin' ]]; then
	UBI_INSTALL_PATH="/usr/local/bin/"
fi
sudo ubi --project domcyrus/rustnet --in "$UBI_INSTALL_PATH"
sudo ubi --project imsnif/bandwhich --in "$UBI_INSTALL_PATH"
sudo ubi --project kahnwong/swissknife --in "$UBI_INSTALL_PATH"

echo "" # force return exit 0 so it'll continue executing downstream steps. exit 1 is from `gh ext install` package already exists
