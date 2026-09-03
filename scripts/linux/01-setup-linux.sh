#!/bin/bash

if [ -f /etc/os-release ]; then
	# shellcheck disable=SC1091
	source /etc/os-release
	if [ "$ID" = "ubuntu" ]; then
		sudo apt install libfuse2t64 -y
		sudo apt install flatpak -y
		flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	fi
fi
