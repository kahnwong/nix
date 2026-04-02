#!/bin/bash

# nix
nix flake update --experimental-features 'nix-command flakes'
./scripts/apply.sh
nix-store --gc
# nix-collect-garbage --delete-old  # only run this once in a while
# nix-store --optimize # free-up space without deleting

# fish
fisher update
./scripts/common/02-add-fish-completions.sh

# gh extensions
gh ext upgrade --all

# python
uv tool upgrade --all

# rust
rustup update

# yarn
yarn global upgrade

# flatpak
if [[ $(uname -s) == 'Linux' ]]; then
	flatpak update
	flatpak uninstall --unused
fi

# brew
if [[ $(uname -s) == 'Darwin' ]]; then
	brew upgrade --greedy
	brew autoremove
	brew cleanup
fi
