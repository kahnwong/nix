#!/bin/bash

export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
export PATH=$PATH:/nix/var/nix/profiles/default/bin/
export PATH=$PATH:$HOME/.nix-profile/bin
# export NIXPKGS_ALLOW_INSECURE=1

ln -s "$PWD"/* ~/.config/nixpkgs

if [ -f ".env" ]; then
	source .env
else
	echo ".env doesn't exist! Please create .env and populate variables."
	exit 1
fi

home-manager switch

nvim --headless +PlugInstall +qall
fish -c "fisher update"
