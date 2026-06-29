#!/bin/bash

# <https://mullvad.net/en/download/vpn/linux>

if [ -f /etc/os-release ]; then
	source /etc/os-release

	if [ "$ID" = "ubuntu" ]; then
		sudo curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc https://repository.mullvad.net/deb/mullvad-keyring.asc
		echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$(dpkg --print-architecture)] https://repository.mullvad.net/deb/stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/mullvad.list

		sudo apt update
		sudo apt install mullvad-vpn
	elif [ "$ID" = "fedora-asahi-remix" ]; then
		sudo dnf config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo
		sudo dnf config-manager --add-repo https://repository.mullvad.net/rpm/stable/mullvad.repo

		sudo dnf install mullvad-vpn
	fi
fi
