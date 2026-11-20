#!/bin/bash

if [ -f /etc/os-release ]; then
	# shellcheck disable=SC1091
	source /etc/os-release

	if [ "$ID" = "ubuntu" ]; then
		sudo apt update && sudo apt install extrepo -y
		sudo extrepo enable librewolf && sudo extrepo update librewolf
		sudo apt update && sudo apt install librewolf -y

	elif [ "$ID" = "fedora-asahi-remix" ]; then
		sudo dnf config-manager addrepo --from-repofile=https://repo.librewolf.net/librewolf.repo
		sudo dnf install librewolf -y
	fi
fi
