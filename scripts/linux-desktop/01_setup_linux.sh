#!/bin/bash

# sudo apt install fuse -y # installing this after flatpak seems to bork flatpak, which requires a flatpak reinstall - it can bork gdm
sudo apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
