#!/bin/bash

# check chrome profile path via `chrome://version` -> `Profile Path`

# copy icons
mkdir -p ~/.local/fleet/icons
cp -r ./scripts/linux-desktop/icons/* ~/.local/fleet/icons/

# ------ LINE ------
cat <<EOF >"$HOME/.local/share/applications/LINE Chat.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Name=LINE
GenericName=LINE Chat
Exec=flatpak run com.google.Chrome --app="chrome-extension://ophjlpahpchlmihnnnihgmmeilfjmjjc/index.html" --profile-directory="Default"
StartupNotify=true
Categories=Social;
Icon=/home/kahnwong/.local/fleet/icons/line.png
EOF

# ------ Docs ------
cat <<EOF >"$HOME/.local/share/applications/Docs.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Name=Docs
GenericName=Docs
Exec=open https://docs.karnwong.me
Icon=/home/kahnwong/.local/fleet/icons/docs.png
StartupNotify=false
Categories=Productivity;
EOF

# ------ Memos ------
cat <<EOF >"$HOME/.local/share/applications/Memos.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Name=Memos
GenericName=Memos
Exec=open https://memos.karnwong.me
Icon=/home/kahnwong/.local/fleet/icons/memos.png
StartupNotify=false
Categories=Productivity;
EOF

# ------ Messenger ------
cat <<EOF >"$HOME/.local/share/applications/Messenger.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Name=Messenger
GenericName=Messenger
Exec=open https://messenger.com
StartupNotify=true
Categories=Social;
Icon=/home/kahnwong/.local/fleet/icons/messenger.png
EOF

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

# ------ foobar2000 ------
cat <<EOF >"$HOME/.local/share/applications/foobar2000.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Name=foobar2000
GenericName=foobar2000
Exec=flatpak run org.winehq.Wine "/home/kahnwong/.var/app/org.winehq.Wine/data/wine/drive_c/Program Files (x86)/foobar2000/foobar2000.exe"
StartupNotify=true
Categories=Multimedia;
Icon=/home/kahnwong/.local/fleet/icons/foobar2000.png
EOF

# ------ reload ------
update-desktop-database ~/.local/share/applications/
