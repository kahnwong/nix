#!/bin/bash

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
EOF

# ------ Kitty ------
# <https://sw.kovidgoyal.net/kitty/binary/#desktop-integration-on-linux>
# Create symbolic links to add kitty and kitten to PATH (assuming ~/.local/bin is in
# your system-wide PATH)
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
# Place the kitty.desktop file somewhere it can be found by the OS
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
# If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
# Update the paths to the kitty and its icon in the kitty desktop file(s)
sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
# Make xdg-terminal-exec (and hence desktop environments that support it use kitty)
echo 'kitty.desktop' >~/.config/xdg-terminals.list
