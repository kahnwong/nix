#!/bin/bash

# for browser install, just in case
if [ -f /etc/os-release ]; then
	source /etc/os-release

	if [ "$ID" = "ubuntu" ]; then
		sudo apt install -y gnome-browser-connector

	elif [ "$ID" = "fedora-asahi-remix" ]; then
		sudo dnf install -y gnome-browser-connector
	fi
fi

# cli installer
uv tool install gnome-extensions-cli

# extension UUID is easier to obtain if you install via browser then run `gext` to list installed extensions
gext install \
	Bluetooth-Battery-Meter@maniacx.github.com \
	Vitals@CoreCoding.com \
	auto-move-windows@gnome-shell-extensions.gcampax.github.com \
	batime@martin.zurowietz.de \
	drive-menu@gnome-shell-extensions.gcampax.github.com \
	hotedge@jonathan.jdoda.ca \
	just-perfection-desktop@just-perfection \
	quick-sound-switcher@dustin-hawkins \
	unredirect@vaina.lt

# laptop only
if [[ $(uname -n) != 'sailfish' ]]; then
	gext install touchpad-gesture-customization@coooolapps.com
fi
