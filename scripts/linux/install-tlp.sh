#!/bin/bash

if [ -f /etc/os-release ]; then
	source /etc/os-release

	if [ "$ID" = "ubuntu" ]; then
		sudo apt install tlp cpufrequtils -y
		sudo cp ./programs/tlp/tlp.conf /etc/tlp.conf
		sudo tlp start
	fi
fi

# not required on arm devices
