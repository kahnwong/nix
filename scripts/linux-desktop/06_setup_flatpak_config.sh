#!/bin/bash

if [[ "$1" == "backup" ]]; then
	cp -r ~/.local/share/flatpak/overrides/* ./programs/flatpak/
else
	cp -r ./programs/flatpak/* ~/.local/share/flatpak/overrides/
fi
