#!/bin/bash

############################
# go
############################
# this setup doesn't require shell exec to activate project's Go version
if [[ "$1" != "update" ]]; then
	GO_VERSION="go1.27.1"
	go install "golang.org/dl/${GO_VERSION}@latest"
	"${GO_VERSION}" download
fi

############################
# cargo
############################
CARGO_NET_GIT_FETCH_WITH_CLI=true cargo install --git ssh://git@github.com/kahnwong/teapipe.git
sudo mv ~/.cargo/bin/teapipe /usr/local/bin/

############################
# android
############################
if [[ "$1" != "update" ]]; then
	sudo mkdir -p /opt/android-sdk
	sudo chown -R kahnwong:kahnwong /opt/android-sdk

	# sdkmanager --list
	sdkmanager --install "platforms;android-37.0" "build-tools;37.0.0" "platform-tools"
	sdkmanager --licenses
fi

############################
# applications - cargo
############################
cargo install --locked cargo-zigbuild
cargo install --locked cross

############################
# applications - python
############################
if [[ "$1" != "update" ]]; then
	uv tool install sisou

	if [[ $(uname -s) == 'Darwin' ]]; then
		pixi global install qgis
	fi
else
	uv tool upgrade --all
fi

####################
# git
####################
## obsolete - github ssh key is stored in encrypted config
# if [[ "$1" != "update" ]]; then
# 	# create ssh key
# 	if [ ! -f "$HOME/.ssh/github" ]; then
# 		ssh-keygen -b 2048 -t rsa -f ~/.ssh/github -q -N ""
# 	else
# 		echo "$HOME/.ssh/github already exists"
# 	fi
# fi

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
	tea login add git.karnwong.me
	tea login default git.karnwong.me
fi

####################
# executables
####################
ubi --project kahnwong/cpubench-release -e cpubench --in ~/.local/bin/ # nix shim does not support rename
sudo ubi --project kahnwong/swissknife --in /usr/local/bin/            # use this PATH so sudo can find it

# os specific apps
if [[ $(uname -s) == 'Linux' ]]; then
	ubi --project pythops/oryx --in ~/.local/bin/
	sudo ubi --project hengyoush/kyanos --in /usr/local/bin/
	sudo ubi --project murat-cileli/clyp --in /usr/local/bin/

	# garmin connect sdk
	curl -Ls https://raw.githubusercontent.com/pcolby/connectiq-sdk-manager/main/install.sh | bash -r
fi
