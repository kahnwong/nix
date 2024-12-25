#!/bin/bash

# ------ Flameshot ------
# <https://flameshot.org/docs/guide/key-bindings/#on-ubuntu-and-other-gnome-based-distros>
# export via: `dconf dump / | sed -n '/\[org.gnome.settings-daemon.plugins.media-keys/,/^$/p' > custom-shortcuts.conf`

dconf load / <programs/gnome/custom-shortcuts.conf
