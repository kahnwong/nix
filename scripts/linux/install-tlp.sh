#!/bin/bash

if [ -f /etc/os-release ]; then
	# shellcheck disable=SC1091
	source /etc/os-release

	if [ "$ID" = "ubuntu" ]; then
		sudo add-apt-repository ppa:linrunner/tlp
		sudo apt update

		sudo apt install cpufrequtils tlp tlp-pd tlp-rdw -y

		if [[ $(uname -n) == 'redfin' ]]; then
			sudo cp ./programs/tlp/tlp.redfin.conf /etc/tlp.conf
		elif [[ $(uname -n) == 'inu' ]]; then
			sudo cp ./programs/tlp/tlp.inu.conf /etc/tlp.conf
		fi

		sudo systemctl enable --now tlp-pd.service
		sudo tlp start
	fi
fi

# not required on arm devices
