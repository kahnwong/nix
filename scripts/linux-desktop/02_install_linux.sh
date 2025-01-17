#!/bin/bash

# ### vscode
# sudo apt-get install wget gpg
# wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
# sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
# sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
# rm -f packages.microsoft.gpg
#
# sudo apt install apt-transport-https
# sudo apt update
# sudo apt install code -y

### applications
sudo apt install file-roller -y
sudo apt install dolphin -y
sudo apt install xclip -y
sudo snap install intellij-idea-ultimate --classic
sudo snap install mpv

# flatpak install flathub com.usebottles.bottles -y
# flatpak install flathub dev.skynomads.Seabird
# flatpak install flathub io.mpv.Mpv -y
# flatpak install flathub org.mozilla.firefox -y  # already installed via snap by default
flatpak install flathub com.calibre_ebook.calibre -y
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub com.dropbox.Client -y
flatpak install flathub com.github.IsmaelMartinez.teams_for_linux -y
flatpak install flathub com.github.eneshecan.WhatsAppForLinux -y
flatpak install flathub com.github.hluk.copyq -y
flatpak install flathub com.github.iwalton3.jellyfin-media-player -y
flatpak install flathub com.github.jeromerobert.pdfarranger -y
flatpak install flathub com.github.johnfactotum.Foliate -y
flatpak install flathub com.github.qarmin.czkawka -y
flatpak install flathub com.github.ransome1.sleek -y
flatpak install flathub com.github.tchx84.Flatseal -y
flatpak install flathub com.github.zocker_160.SyncThingy -y
flatpak install flathub com.google.Chrome -y
flatpak install flathub com.heroicgameslauncher.hgl -y
flatpak install flathub com.sindresorhus.Caprine -y
flatpak install flathub com.transmissionbt.Transmission -y
flatpak install flathub dev.k8slens.OpenLens -y
flatpak install flathub io.github.TransmissionRemoteGtk -y
flatpak install flathub io.github.ciromattia.kcc -y
flatpak install flathub io.github.dweymouth.supersonic -y
flatpak install flathub io.github.flattool.Warehouse -y
flatpak install flathub io.github.sigmasd.stimulator -y
flatpak install flathub io.gitlab.adhami3310.Impression -y
flatpak install flathub io.kinvolk.Headlamp -y
flatpak install flathub md.obsidian.Obsidian -y
flatpak install flathub org.audacityteam.Audacity -y
flatpak install flathub org.fkoehler.KTailctl -y
flatpak install flathub org.flameshot.Flameshot -y
flatpak install flathub org.gpodder.gpodder -y
flatpak install flathub org.kde.konsole -y
flatpak install flathub org.kde.okular -y
flatpak install flathub org.mozilla.Thunderbird -y
