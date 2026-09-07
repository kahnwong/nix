#!/bin/bash

mkdir -p "$HOME/.config/autostart"
cp -r ./programs/gnome/autostart/*.desktop "$HOME/.config/autostart/"

# exclude if not pc
if [[ $(uname -n) != 'sailfish' ]]; then
	rm "$HOME/.config/autostart/rustdesk.desktop"
	rm "$HOME/.config/autostart/steam.desktop"
fi

# pc uses nightly, laptops use normal edition
if [[ $(uname -n) == 'sailfish' ]]; then
	rm "$HOME/.config/autostart/firefox.desktop"
else
	rm "$HOME/.config/autostart/firefox-nightly.desktop"
fi

# official Discord client isn't available on arm64
if [[ $(uname -m) == 'x86_64' ]]; then
	rm "$HOME/.config/autostart/dev.vencord.Vesktop.desktop"
elif [[ $(uname -m) == 'arm64' ]]; then
	rm "$HOME/.config/autostart/discord.desktop"
fi
