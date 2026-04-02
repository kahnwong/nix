#!/bin/bash

# for browser install, just in case
sudo apt install -y gnome-browser-connector
# cli installer
uv tool install gnome-extensions-cli

# extension UUID is easier to obtain if you install via browser then run `gext` to list installed extensions
gext install \
	auto-move-windows@gnome-shell-extensions.gcampax.github.com \
	hotedge@jonathan.jdoda.ca \
	just-perfection-desktop@just-perfection \
	unredirect@vaina.lt

# laptop only
if [[ $(uname -n) != 'sailfish' ]]; then
	gext install touchpad-gesture-customization@coooolapps.com
fi
