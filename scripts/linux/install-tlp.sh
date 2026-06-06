#!/bin/bash

if [ -f /etc/os-release ]; then
	source /etc/os-release

	if [ "$ID" = "ubuntu" ]; then
		sudo add-apt-repository ppa:linrunner/tlp
		sudo apt update

		sudo apt install cpufrequtils tlp tlp-pd tlp-rdw -y

		if [[ $(uname -n) == 'redfin' ]]; then
			sudo cp ./programs/tlp/tlp.redfin.conf /etc/tlp.conf
		fi

		sudo systemctl enable --now tlp-pd.service
		sudo tlp start
	fi
fi

# not required on arm devices
