#!/bin/bash

# check chrome profile path via `chrome://version` -> `Profile Path`

# copy icons
mkdir -p ~/.local/fleet/icons
cp -r ./scripts/linux-desktop/icons/* ~/.local/fleet/icons/

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

cp ./programs/applications/*.desktop "$HOME/.local/share/applications/"

# ------ reload ------
update-desktop-database ~/.local/share/applications/
