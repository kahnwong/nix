#!/bin/bash

if [ -f /etc/os-release ]; then
	# shellcheck disable=SC1091
	source /etc/os-release

	if [ "$ID" = "ubuntu" ]; then
		wget -q -O- https://raw.githubusercontent.com/bankjaneo/caprine/facebook-migrate/packages/deb/addRepo.sh | sudo bash

	elif [ "$ID" = "fedora-asahi-remix" ]; then
		open https://github.com/bankjaneo/caprine/releases
	fi
fi
