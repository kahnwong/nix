#!/bin/bash

if [ -f /etc/os-release ]; then
	# shellcheck disable=SC1091
	source /etc/os-release

	if [ "$ID" = "ubuntu" ]; then
		sudo add-apt-repository ppa:linrunner/tlp
		sudo apt update

		sudo apt install cpufrequtils tlp tlp-pd tlp-rdw -y

		case "$(uname -n)" in
		redfin | inu | ika)
			sudo cp "./programs/tlp/tlp.$(uname -n).conf" /etc/tlp.conf
			;;
		esac

		sudo systemctl enable --now tlp-pd.service
		sudo tlp start
	fi
fi

# not required on arm devices
