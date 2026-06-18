#!/bin/bash

# check chrome profile path via `chrome://version` -> `Profile Path`

# copy icons
mkdir -p ~/.local/fleet/icons
cp -r ./programs/gnome/icons/* ~/.local/fleet/icons/

## ------ Facebook ------
#cat <<EOF >"$HOME/.local/share/applications/Facebook.desktop"
#[Desktop Entry]
#Version=1.0
#Type=Application
#Name=Facebook
#GenericName=Facebook
#Exec=flatpak run com.google.Chrome https://facebook.com
#StartupNotify=true
#Categories=Social;
#Icon=/home/kahnwong/.local/fleet/icons/facebook.svg
#EOF

cp ./programs/gnome/applications/*.desktop "$HOME/.local/share/applications/"

# chrome isn't available on linux/arm64, so we use chromium instead

if [ -f /etc/os-release ]; then
	source /etc/os-release

	if [ "$ID" = "fedora-asahi-remix" ]; then
		mv "$HOME/.local/share/applications/LINE Chat.asahi.desktop" "$HOME/.local/share/applications/LINE Chat.desktop"
	fi
fi

# ------ reload ------
update-desktop-database ~/.local/share/applications/
