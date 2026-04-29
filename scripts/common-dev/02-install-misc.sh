#!/bin/bash

############################
# go
############################
if [[ "$1" != "update" ]]; then
	GO_VERSION="go1.26.2"
	go install "golang.org/dl/${GO_VERSION}@latest"
	"${GO_VERSION}" download
fi

############################
# rust
############################
if [[ "$1" != "update" ]]; then
	rustup default stable
else
	rustup update
fi

############################
# mise
############################
mise use -g node@24
mise use -g opentofu@latest
mise use -g terraform@latest

############################
# applications - golang
############################
#go install github.com/ksoclabs/kbom@latest
#go install github.com/protomaps/go-pmtiles@latest
go install github.com/kahnwong/article-summarizer@latest
go install github.com/kahnwong/config-init@latest
go install github.com/kahnwong/erp@latest
go install github.com/kahnwong/habit-tracker@latest
go install github.com/kahnwong/invoice@latest
go install github.com/kahnwong/pgconn@latest
go install github.com/kahnwong/repo-switcher@latest
go install github.com/kahnwong/totp@latest
go install github.com/kahnwong/waka@latest
go install github.com/kahnwong/workspace-init@latest
go install github.com/spf13/cobra-cli@latest

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
if [[ "$1" != "update" ]]; then
	# uv tool install nbpreview
	uv tool install "dvc[s3]"
	uv tool install huggingface_hub[cli]
	uv tool install magika
	uv tool install pip_search
	uv tool install topydo[columns]

	if [[ $(uname -s) == 'Darwin' ]]; then
		pixi global install qgis
	fi
else
	uv tool upgrade --all
fi

############################
# applications - node
############################
if [[ "$1" != "update" ]]; then
	npm set prefix ~/.npm-global
	yarn global add @quasar/cli
	yarn global add create-quasar
	yarn global add create-slidev
	yarn global add md-to-pdf
	yarn global add playwright-chromium
else
	yarn global upgrade
fi

############################
# kubectl
############################
krew install crd-wizard
krew install images
krew install node-resource
krew install nodepools
krew install outdated
krew install status

############################
# helm
############################
helm plugin install https://github.com/databus23/helm-diff

####################
# git
####################
if [[ "$1" != "update" ]]; then
	# create ssh key
	if [ ! -f "$HOME/.ssh/github" ]; then
		ssh-keygen -b 2048 -t rsa -f ~/.ssh/github -q -N ""
	else
		echo "$HOME/.ssh/github already exists"
	fi
fi

# gh-cli extensions
if [[ "$1" != "update" ]]; then
	gh auth login
	gh config set git_protocol ssh -h github.com

	gh extension install Shresht7/gh-license
	gh extension install dlvhdr/gh-dash
	gh extension install github/gh-models
	gh extension install redraw/gh-install
	gh extension install seachicken/gh-poi
else
	gh ext upgrade --all
fi

# gitlab
if [[ "$1" != "update" ]]; then
	glab auth login
fi

# forgejo
if [[ "$1" != "update" ]]; then
	tea login
	tea login default git.karnwong.me
fi

####################
# executables
####################
echo "Installing ubi. On darwin you need to install homebrew beforehand, then re-run this"
curl --silent --location \
	https://raw.githubusercontent.com/houseabsolute/ubi/master/bootstrap/bootstrap-ubi.sh |
	sudo sh

ubi --project AlexsJones/llmfit --in ~/.local/bin/
ubi --project bodaay/HuggingFaceModelDownloader --in ~/.local/bin/ --rename-exe hfdownloader
ubi --project elliot40404/modo --in ~/.local/bin/
ubi --project fawni/def --in ~/.local/bin/
ubi --project kahnwong/cpubench-release -e cpubench --in ~/.local/bin/
ubi --project mongodb/kingfisher --in ~/.local/bin/
ubi --project yt-dlp/yt-dlp --in ~/.local/bin/ # nix still doesn't support latest version

sudo ubi --project domcyrus/rustnet --in /usr/local/bin/
sudo ubi --project kahnwong/swissknife --in /usr/local/bin/

gh install mmcdole/kino

# os specific apps
if [[ $(uname -s) == 'Linux' ]]; then
	ubi --project pythops/oryx --in ~/.local/bin/
	sudo ubi --project hengyoush/kyanos --in /usr/local/bin/
	sudo ubi --project murat-cileli/clyp --in /usr/local/bin/

	# garmin connect sdk
	curl -Ls https://raw.githubusercontent.com/pcolby/connectiq-sdk-manager/main/install.sh | bash -r
elif [[ $(uname -s) == 'Darwin' ]]; then
	gh install browsh-org/browsh
fi

# only on laptop
if [[ $(uname -n) != 'sailfish' ]]; then
	ubi --project jordond/jolt --in ~/.local/bin/
fi
