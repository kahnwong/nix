#!/bin/bash

# nix
nix flake update --experimental-features 'nix-command flakes'
./scripts/apply.sh
nix-store --gc
# nix-collect-garbage --delete-old  # only run this once in a while

# fish
fisher update
./scripts/common/02_add_fish_completions.sh

# gh extensions
gh ext upgrade --all

# brew
if [[ $(uname -s) == 'Darwin' ]]; then
	brew upgrade --greedy
	brew autoremove
	brew cleanup
fi

# rust
rustup update

# flatpak
if [[ $(uname -s) == 'Linux' ]]; then
	flatpak update
	flatpak uninstall --unused
fi
