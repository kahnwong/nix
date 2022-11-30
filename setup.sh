#!/bin/bash

####################
# setup brew
####################
if [[ $(uname -s) == 'Darwin' ]]; then
	echo "========== Installing xcode cli development tools =========="
	xcode-select --install

	if [[ $(uname -m) == 'arm64' ]]; then
		echo "========== Installing rosetta =========="
		/usr/sbin/softwareupdate --install-rosetta --agree-to-license

		echo "========== Set Homebrew path =========="
		export PATH=$PATH:/opt/homebrew/bin
	fi

	if [[ $(uname -m) == 'x86_64' ]]; then
		echo "========== Set Homebrew path =========="
		grep -rl --exclude=\*.{sh,md} '/opt/homebrew/bin' ./ | xargs sed -i "" 's/\/opt\/homebrew\/bin/\/usr\/local\/bin/g'
		export PATH=$PATH:/usr/local/bin
	fi

	echo "========== Installing Homebrew =========="
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	sudo chown -R "$(whoami)" "$(brew --prefix)"/*
fi

####################
# setup nix
####################
sh <(curl -L https://nixos.org/nix/install) --daemon

if [[ $(uname -s) == 'Darwin' ]]; then
	export PATH=$PATH:/nix/var/nix/profiles/default/bin/
fi

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

# temporary since during init only bash/zsh shell is available
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}

nix-shell '<home-manager>' -A install

rm ~/.config/nixpkgs/home.nix
ln -s "$PWD"/* ~/.config/nixpkgs
