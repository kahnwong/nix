#!/bin/bash

mkdir -p "$HOME/.config/autostart"

# ------ Dropbox ------
cat <<EOF >"$HOME/.config/autostart/com.dropbox.Client.desktop"
[Desktop Entry]
Type=Application
Exec=/var/lib/flatpak/exports/bin/com.dropbox.Client
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=dropbox
Name=dropbox
Comment[en_US]=
Comment=
EOF

# ------ CopyQ ------
# On Wayland, add prefix `env QT_QPA_PLATFORM=xcb`
cat <<EOF >"$HOME/.config/autostart/com.github.hluk.copyq.desktop"
[Desktop Entry]
Type=Application
Exec=env QT_QPA_PLATFORM=xcb /var/lib/flatpak/exports/bin/com.github.hluk.copyq --start-server toggle
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=copyq
Name=copyq
Comment[en_US]=
Comment=
EOF

# ------ Syncthing ------
cat <<EOF >"$HOME/.config/autostart/com.github.zocker_160.SyncThingy.desktop"
[Desktop Entry]
Type=Application
Name=com.github.zocker_160.SyncThingy
Exec=flatpak run --command=SyncThingy com.github.zocker_160.SyncThingy
X-Flatpak=com.github.zocker_160.SyncThingy
EOF

