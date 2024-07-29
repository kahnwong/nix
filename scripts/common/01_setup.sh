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
	echo "========== Installing build tools and other essentials =========="
	sudo apt-get install make curl wget ntfs-3g \
		-y
fi

####################
# setup nix
####################
sh <(curl -L https://nixos.org/nix/install) --daemon

export PATH=$PATH:/nix/var/nix/profiles/default/bin/

# temporary since during init only bash/zsh shell is available
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
export PATH=$PATH:/nix/var/nix/profiles/default/bin/
export PATH=$PATH:$HOME/.nix-profile/bin
# export NIXPKGS_ALLOW_INSECURE=1

chmod +x ./scripts/apply.sh
./scripts/apply.sh

# these stay here because their source config is populated via nix
### fish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish
fish -c "fisher install franciscolourenco/done"
fish -c "fisher install jorgebucaran/autopair.fish"
fish -c "fisher install jorgebucaran/fisher"
fish -c "fisher install jorgebucaran/nvm.fish"
fish -c "fisher install meaningful-ooo/sponge"
fish -c "fisher install patrickf1/colored_man_pages.fish"
fish -c "fisher install danhper/fish-ssh-agent"

#### nvim
#nvim --headless +PlugInstall +qall
git clone https://github.com/kahnwong/nvchad-starter.git ~/.config/nvim --depth 1
