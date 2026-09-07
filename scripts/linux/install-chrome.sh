#!/bin/bash

cd /tmp || exit 1
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

# HW acceleration
if [[ $(uname -n) == 'redfin' ]]; then
	sudo apt update
	sudo apt install mesa-va-drivers vainfo -y
fi

# .desktop file source: `/usr/share/applications/google-chrome.desktop`
# edited to support HW acceleration launch flags, see `setup-app-shortcuts.sh`
# check via chrome://gpu
