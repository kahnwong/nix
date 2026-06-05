#!/bin/bash

if [ -f /etc/os-release ]; then
	source /etc/os-release

	if [ "$ID" = "ubuntu" ]; then
		sudo apt install tlp cpufrequtils -y

		if [[ $(uname -n) == 'redfin' ]]; then
			sudo cp ./programs/tlp/tlp.redfin.conf /etc/tlp.conf
		fi

		sudo tlp start
	fi
fi

# not required on arm devices
