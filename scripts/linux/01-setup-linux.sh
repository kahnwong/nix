#!/bin/bash

if [ -f /etc/os-release ]; then
	# shellcheck disable=SC1091
	source /etc/os-release
	if [ "$ID" = "ubuntu" ]; then
		sudo apt install libfuse2t64 wl-clipboard -y
		sudo apt install flatpak -y
		flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	elif [ "$ID" = "fedora" ] && [ "$VARIANT_ID" = "asahi" ]; then
		sudo dnf install 'libgexiv2.so.2()(64bit)'
	fi
fi
