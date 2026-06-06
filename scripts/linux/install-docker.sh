#!/bin/bash

if [ -f /etc/os-release ]; then
	source /etc/os-release

	if [ "$ID" = "ubuntu" ]; then

		# <https://docs.docker.com/engine/install/ubuntu/>

		# Add Docker's official GPG key:
		sudo apt-get update
		sudo apt-get install ca-certificates curl
		sudo install -m 0755 -d /etc/apt/keyrings
		sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
		sudo chmod a+r /etc/apt/keyrings/docker.asc

		# Add the repository to Apt sources:
		# shellcheck disable=SC1091
		echo \
			"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
          $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |
			sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
		sudo apt-get update

		sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

	elif [ "$ID" = "fedora-asahi-remix" ]; then
		sudo dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo

		sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
		sudo systemctl enable --now docker
	fi
fi

sudo usermod -aG docker "$USER"
