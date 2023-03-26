#!/bin/bash

export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
export PATH=$PATH:/nix/var/nix/profiles/default/bin/
export PATH=$PATH:$HOME/.nix-profile/bin
# export NIXPKGS_ALLOW_INSECURE=1

mkdir -p "$HOME/.config/home-manager"
ln -s "$PWD"/* "$HOME/.config/home-manager"

if [ -f ".env" ]; then
	source .env
else
	echo ".env doesn't exist! Please create .env and populate variables."
	exit 1
fi

home-manager switch

# these stay here because their source config is populated via nix
### fish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fish -c "fisher update"

### nvim
nvim --headless +PlugInstall +qall
