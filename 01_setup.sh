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
# create ssh key
####################
if [ ! -f "$HOME/.ssh/github" ]; then
	ssh-keygen -b 2048 -t rsa -f ~/.ssh/github -q -N ""
else
	echo "$HOME/.ssh/github already exists"
fi

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
