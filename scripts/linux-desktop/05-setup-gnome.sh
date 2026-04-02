#!/bin/bash

if [[ "$1" == "backup" ]]; then
	dconf dump / | sed -n '/\[org.gnome.desktop.input-sources/,/^$/p' >programs/gnome/config/input-sources.conf
	dconf dump / | sed -n '/\[org.gnome.desktop.peripherals.tablets/,/^$/p' >programs/gnome/config/wacom.conf
	dconf dump / | sed -n '/\[org.gnome.desktop.wm.keybindings/,/^$/p' >programs/gnome/config/wm-keybindings.conf
	dconf dump / | sed -n '/\[org.gnome.settings-daemon.plugins.media-keys/,/^$/p' >programs/gnome/config/custom-shortcuts.conf
	dconf dump / | sed -n '/\[org.gnome.shell.extensions.auto-move-windows/,/^$/p' >programs/gnome/config/auto-move-windows.conf
	dconf dump / | sed -n '/\[org.gnome.shell.extensions.tiling-assistant/,/^$/p' >programs/gnome/config/tiling-assistant-shortcuts.conf
	dconf read /org/gnome/shell/favorite-apps >programs/gnome/config/gnome-shell-favorites.conf
else
	dconf load / <programs/gnome/config/auto-move-windows.conf
	dconf load / <programs/gnome/config/custom-shortcuts.conf
	dconf load / <programs/gnome/config/input-sources.conf
	dconf load / <programs/gnome/config/tiling-assistant-shortcuts.conf
	dconf load / <programs/gnome/config/wacom.conf
	dconf load / <programs/gnome/config/wm-keybindings.conf
	dconf write /org/gnome/shell/favorite-apps "$(cat programs/gnome/config/gnome-shell-favorites.conf)"
fi
