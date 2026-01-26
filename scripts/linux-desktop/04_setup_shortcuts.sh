#!/bin/bash

# ------ Flameshot ------
# <https://flameshot.org/docs/guide/key-bindings/#on-ubuntu-and-other-gnome-based-distros>

# ------ shortcuts ------
# export via: `dconf dump / | sed -n '/\[org.gnome.settings-daemon.plugins.media-keys/,/^$/p' > programs/gnome/custom-shortcuts.conf`
dconf load / <programs/gnome/custom-shortcuts.conf

# ------ tiling assistant shortcuts ------
# export via: `dconf dump / | sed -n '/\[org.gnome.shell.extensions.tiling-assistant/,/^$/p' > programs/gnome/tiling-assistant-shortcuts.conf`
dconf load / <programs/gnome/tiling-assistant-shortcuts.conf
