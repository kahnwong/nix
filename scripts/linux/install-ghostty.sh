#!/bin/bash

if [ -f /etc/os-release ]; then
	source /etc/os-release

	if [ "$ID" = "ubuntu" ]; then
		# <https://github.com/mkasberg/ghostty-ubuntu>
		sudo add-apt-repository ppa:mkasberg/ghostty-ubuntu
		sudo apt update
		sudo apt install ghostty

	elif [ "$ID" = "fedora-asahi-remix" ]; then
		sudo dnf copr enable scottames/ghostty
		sudo dnf install ghostty
	fi
fi

# disable welcome message for fish shell on mac
# <https://stackoverflow.com/questions/15769615/remove-last-login-message-for-new-tabs-in-terminal>
if [[ $(uname -s) == 'Darwin' ]]; then
	touch ~/.hushlogin
fi
