#!/bin/bash

# nix
nix flake update
./scripts/apply.sh
nix-store --gc # cleanup garbage collection

# fish
fisher update
./scripts/common/02_add_fish_completions.sh

# brew
if [[ $(uname -s) == 'Darwin' ]]; then
	brew upgrade --greedy
	brew autoremove
	brew cleanup
fi

# flatpak
if [[ $(uname -s) == 'Linux' ]]; then
	flatpak update
	flatpak uninstall --unused
fi
