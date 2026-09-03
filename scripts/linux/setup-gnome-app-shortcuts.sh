#!/bin/bash

# check chrome profile path via `chrome://version` -> `Profile Path`

# copy icons
mkdir -p ~/.local/fleet/icons
rsync -a --delete ./programs/gnome/icons/* ~/.local/fleet/icons/

cp ./programs/gnome/applications/*.desktop "$HOME/.local/share/applications/"
## remove official intellij idea shortcut - uuid makes it hard to sync config
rm ~/.local/share/applications/jetbrains-idea-*.desktop

# chrome isn't available on linux/arm64, so we use chromium instead
if [ -f /etc/os-release ]; then
	# shellcheck disable=SC1091
	source /etc/os-release

	if [ "$ID" = "fedora-asahi-remix" ]; then
		mv "$HOME/.local/share/applications/LINE Chat.asahi.desktop" "$HOME/.local/share/applications/LINE Chat.desktop"
	fi
fi

# ------ reload ------
update-desktop-database ~/.local/share/applications/
