#!/bin/bash

# ------ Flameshot ------
# <https://flameshot.org/docs/guide/key-bindings/#on-ubuntu-and-other-gnome-based-distros>

# ------ shortcuts ------
# export via: `dconf dump / | sed -n '/\[org.gnome.settings-daemon.plugins.media-keys/,/^$/p' > programs/gnome/custom-shortcuts.conf`
dconf load / <programs/gnome/custom-shortcuts.conf

# ------ tiling assistant shortcuts ------
# export via: `dconf dump / | sed -n '/\[org.gnome.shell.extensions.tiling-assistant/,/^$/p' > programs/gnome/tiling-assistant-shortcuts.conf`
dconf load / <programs/gnome/tiling-assistant-shortcuts.conf

# ------ languages ------
# export via: `dconf dump / | sed -n '/\[org.gnome.desktop.wm.keybindings/,/^$/p' > programs/gnome/wm-keybindings.conf`
dconf load / <programs/gnome/wm-keybindings.conf

# export via: `dconf dump / | sed -n '/\[org.gnome.desktop.input-sources/,/^$/p' > programs/gnome/input-sources.conf`
dconf load / <programs/gnome/input-sources.conf

# ------ wacom ------
# export via: `dconf dump / | sed -n '/\[org.gnome.desktop.peripherals.tablets/,/^$/p' > programs/gnome/wacom.conf`
dconf load / <programs/gnome/wacom.conf
