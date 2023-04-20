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
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish
fish -c "fisher install franciscolourenco/done"
fish -c "fisher install jethrokuan/z"
fish -c "fisher install jorgebucaran/autopair.fish"
fish -c "fisher install jorgebucaran/fisher"
fish -c "fisher install jorgebucaran/nvm.fish"
fish -c "fisher install meaningful-ooo/sponge"
fish -c "fisher install patrickf1/colored_man_pages.fish"

### nvim
nvim --headless +PlugInstall +qall
