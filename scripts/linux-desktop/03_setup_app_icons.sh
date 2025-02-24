#!/bin/bash

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
Exec=/var/lib/flatpak/exports/bin/com.google.Chrome --app="chrome-extension://ophjlpahpchlmihnnnihgmmeilfjmjjc/index.html"
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
