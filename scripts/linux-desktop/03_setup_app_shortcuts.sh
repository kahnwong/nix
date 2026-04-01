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

## ------ YubiKey Manager ------
#cat <<EOF >"$HOME/.local/share/applications/YubiKey Manager.desktop"
#[Desktop Entry]
#Version=1.0
#Type=Application
#Name=YubiKey Manager
#GenericName=YubiKey Manager
#Exec=sudo /usr/local/bin/yubikey-manager-qt-latest-linux.AppImage
#StartupNotify=true
#Categories=Utilities;
#Icon=/home/kahnwong/.local/fleet/icons/yubikey-manager.png
#EOF

cp ./programs/applications/*.desktop "$HOME/.local/share/applications/"

# ------ reload ------
update-desktop-database ~/.local/share/applications/
