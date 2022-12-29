#!/bin/bash

####################
# prep mac
####################
if [[ $(uname -s) == 'Darwin' ]]; then
	echo "========== Installing xcode cli development tools =========="
	xcode-select --install

	if [[ $(uname -m) == 'arm64' ]]; then
		echo "========== Installing rosetta =========="
		/usr/sbin/softwareupdate --install-rosetta --agree-to-license
	fi
fi

####################
# prep debian
####################
if [[ $(uname -s) == 'Linux' ]]; then
	echo "========== Installing build tools =========="
	sudo apt-get install build-essential g++ gcc libbz2-dev libc-dev liblzma-dev libncurses5-dev \
		libncursesw5-dev libreadline-dev libsqlite3-dev libssl-dev libxml2-dev libxslt1-dev \
		llvm make tk-dev xz-utils zlib1g-dev \
		-y
fi

####################
# create ssh key
####################
if [ ! -f "$HOME/.ssh/github" ]; then
	ssh-keygen -b 2048 -t rsa -f ~/.ssh/github -q -N ""
else
	echo "$HOME/.ssh/github already exists"
fi

####################
# fisher
####################
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

####################
# setup nix
####################
sh <(curl -L https://nixos.org/nix/install) --daemon

export PATH=$PATH:/nix/var/nix/profiles/default/bin/

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

# temporary since during init only bash/zsh shell is available
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}

nix-shell '<home-manager>' -A install

rm ~/.config/nixpkgs/home.nix
