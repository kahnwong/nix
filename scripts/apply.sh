#!/bin/bash

if [[ $(uname -s) == 'Darwin' ]]; then
	nix build '.#homeManagerConfigurations.macbookMain.system'
	sudo ./result/activate

elif [[ $(uname -s) == 'Linux' ]]; then
	case "${HOSTNAME:-$(hostname)}" in
	steelhead)
		config="main-arm"
		;;
	demo)
		config="demo"
		;;
	*)
		config="main"
		;;
	esac

	nix build ".#homeManagerConfigurations.${config}.activationPackage"

	./result/activate
fi
