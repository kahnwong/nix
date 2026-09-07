#!/bin/bash

# ----- Control Android Audio Playback -----
sudo apt install playerctl pipewire-audio-client-libraries -y

mkdir -p ~/.config/systemd/user && cat <<'EOF' >~/.config/systemd/user/mpris-proxy.service
[Unit]
Description=Forward Bluetooth Media Controls to MPRIS
After=bluetooth.target

[Service]
Type=simple
ExecStart=/usr/bin/mpris-proxy
Restart=on-failure

[Install]
WantedBy=default.target
EOF

systemctl --user enable --now mpris-proxy # test via `playerctl play-pause`

# ----- MPV Gnome Integration -----
sudo apt install mpv-mpris

mkdir -p ~/.config/mpv && cat <<'EOF' >~/.config/mpv/mpv.conf
script-opts=mpris-enable=yes
EOF

# ----- mprisence -----
## <https://github.com/lazykern/mprisence>
DEB_URL=$(curl -s https://api.github.com/repos/lazykern/mprisence/releases/latest | jq -r '.assets[] | select(.name | endswith("_amd64.deb")) | .browser_download_url') &&
	wget -O /tmp/mprisence_latest.deb "$DEB_URL" &&
	sudo apt install /tmp/mprisence_latest.deb &&
	rm /tmp/mprisence_latest.deb

systemctl --user enable --now mprisence.service

mkdir -p ~/.config/mprisence && cat <<'EOF' >~/.config/mprisence/config.toml
[player]
[player.Jellyfin]
ignore = false
EOF
