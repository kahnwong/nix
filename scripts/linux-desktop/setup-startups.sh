#!/bin/bash

mkdir -p "$HOME/.config/autostart"
cp -r ./programs/gnome/autostart/*.desktop "$HOME/.config/autostart/"

# exclude if not pc
if [[ $(uname -n) != 'sailfish' ]]; then
	rm "$HOME/.config/autostart/rustdesk.desktop"
	rm "$HOME/.config/autostart/steam.desktop"
fi
