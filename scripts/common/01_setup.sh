#!/bin/bash

####################
# prep debian
####################
if [[ $(uname -s) == 'Linux' ]]; then
	echo "========== Installing build tools and other essentials =========="
	sudo apt-get install make curl wget ntfs-3g \
		-y
fi

####################
# setup nix
####################
sh <(curl -L https://nixos.org/nix/install) --daemon

export PATH=$PATH:/nix/var/nix/profiles/default/bin/

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --add https://nixos.org/channels/nixpkgs-unstable unstable
nix-channel --update

# temporary since during init only bash/zsh shell is available
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
export PATH=$PATH:/nix/var/nix/profiles/default/bin/
export PATH=$PATH:$HOME/.nix-profile/bin
# export NIXPKGS_ALLOW_INSECURE=1

rm -f ~/.config/home-manager/home.nix

mkdir -p "$HOME/.config/home-manager"
ln -s "$PWD"/* "$HOME/.config/home-manager"

if [ -f ".env" ]; then
	source .env
else
	echo ".env doesn't exist! Please create .env and populate variables."
	exit 1
fi

nix-shell '<home-manager>' -A install
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
