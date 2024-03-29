#!/bin/bash

### vscode
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt install apt-transport-https
sudo apt update
sudo apt install code -y

### applications
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub com.github.eneshecan.WhatsAppForLinux -y
flatpak install flathub com.google.Chrome -y
flatpak install flathub io.mpv.Mpv -y
flatpak install flathub org.mozilla.firefox -y
flatpak install flathub org.mozilla.Thunderbird -y
