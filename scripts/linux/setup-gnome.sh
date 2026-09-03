#!/bin/bash

if [[ "$1" == "backup" ]]; then
	dconf dump / | sed -n '/\[org.gnome.desktop.input-sources/,/^$/p' >programs/gnome/config/input-sources.conf
	dconf dump / | sed -n '/\[org.gnome.desktop.peripherals.tablets/,/^$/p' >programs/gnome/config/wacom.conf
	dconf dump / | sed -n '/\[org.gnome.desktop.wm.keybindings/,/^$/p' >programs/gnome/config/wm-keybindings.conf
	dconf dump / | sed -n '/\[org.gnome.settings-daemon.plugins.media-keys/,/^$/p' >programs/gnome/config/custom-shortcuts.conf
	dconf dump / | sed -n '/\[org.gnome.shell.extensions.auto-move-windows/,/^$/p' >programs/gnome/config/auto-move-windows.conf
	dconf dump / | sed -n '/\[org.gnome.shell.extensions.tiling-assistant/,/^$/p' >programs/gnome/config/tiling-assistant-shortcuts.conf
	dconf read /org/gnome/shell/favorite-apps >programs/gnome/config/gnome-shell-favorites.conf

	# laptop only
	if [[ "$(hostname)" != "sailfish" ]]; then
		dconf dump / | sed -n '/\[org.gnome.shell.extensions.touchpad-gesture-customization/,/^$/p' >programs/gnome/config/touchpad-gesture-customization.conf
	fi
else # apply config
	dconf load / <programs/gnome/config/auto-move-windows.conf
	dconf load / <programs/gnome/config/input-sources.conf
	dconf load / <programs/gnome/config/tiling-assistant-shortcuts.conf
	dconf load / <programs/gnome/config/wacom.conf
	dconf load / <programs/gnome/config/wm-keybindings.conf

	# custom shortcuts
	CUSTOM_SHORTCUTS_CONFIG_FILE="programs/gnome/config/custom-shortcuts.conf"
	if [[ "$(hostname)" == "sailfish" ]]; then
		sed 's/QT_QPA_PLATFORM=wayland//g' "$CUSTOM_SHORTCUTS_CONFIG_FILE" | dconf load /
	else
		dconf load / <"$CUSTOM_SHORTCUTS_CONFIG_FILE"
		dconf load / <programs/gnome/config/touchpad-gesture-customization.conf
	fi

	# favorite apps
	if [[ "$(hostname)" == "sailfish" ]]; then
		dconf write /org/gnome/shell/favorite-apps "$(sed 's#firefox.desktop#firefox-nightly.desktop#g' programs/gnome/config/gnome-shell-favorites.conf)"
	elif [[ "$(hostname)" == "steelhead" ]]; then
		dconf write /org/gnome/shell/favorite-apps "$(sed \
			-e 's#firefox.desktop#org.mozilla.firefox.desktop#g' \
			-e 's#discord.desktop#dev.vencord.Vesktop.desktop#g' \
			-e 's#org.mozilla.thunderbird_esr.desktop#net.thunderbird.Thunderbird.desktop#g' \
			-e 's#intellij.desktop#dev.zed.Zed.desktop#g' \
			programs/gnome/config/gnome-shell-favorites.conf)"
	else
		dconf write /org/gnome/shell/favorite-apps "$(cat programs/gnome/config/gnome-shell-favorites.conf)"
	fi

	# remap keys on apple devices
	if [[ "$(hostname)" == "steelhead" ]]; then
		dconf write /org/gnome/desktop/input-sources/xkb-options "['altwin:swap_lalt_lwin']"
	fi
fi
