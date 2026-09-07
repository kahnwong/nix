#!/bin/bash

export NIXPKGS_ALLOW_UNFREE=1
export NIXPKGS_ALLOW_INSECURE=1

if [[ $(uname -s) == 'Darwin' ]]; then
	nix build '.#homeManagerConfigurations.macbookMain.system' --experimental-features 'nix-command flakes' --impure
	sudo ./result/activate

elif [[ $(uname -s) == 'Linux' ]]; then
	case "${HOSTNAME:-$(hostname)}" in
	steelhead)
		config="base-arm"
		;;
	demo)
		config="demo"
		;;
	*)
		config="base"
		;;
	esac

	nix build ".#homeManagerConfigurations.${config}.activationPackage" \
		--experimental-features 'nix-command flakes' \
		--impure

	./result/activate
fi
