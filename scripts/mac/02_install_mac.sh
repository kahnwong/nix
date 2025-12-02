#!/bin/bash

echo "================================= Install brew apps ================================="

# browser
brew install --cask firefox
brew install --cask firefox-nightly
brew install --cask google-chrome
# brew install --cask microsoft-edge

# cli
brew install mas
brew install mpv

# cloud storage
brew install --cask syncthing

# communication
# brew install --cask adium
# brew install --cask microsoft-teams
# brew install --cask slack
brew install --cask discord
brew install --cask element
brew install --cask thunderbird
brew install --cask zoom

# data
brew install --cask tad
brew install apache-spark

# dev tools
# brew install --cask docker
# brew install --cask mongodb-compass
brew install --cask fork
brew install --cask ghostty
brew install --cask intellij-idea
brew install --cask tailscale
brew install --cask zed

## podman
brew install --cask podman-desktop
brew install podman
brew install podman-compose

## freelens
brew tap freelensapp/tap
brew install --cask freelens

# entertainment
brew install --cask calibre
brew install --cask fbreader
brew install --cask iina
brew install --cask jellyfin-media-player
brew install --cask simple-comic
brew install --cask transmission-remote-gui
brew install --cask xnviewmp

# quick look
brew install --cask syntax-highlight
brew install --cask jupyter-notebook-viewer
brew install --cask qlmarkdown

# productivity
brew install --cask macdown
brew install --cask notion-calendar
brew install --cask obsidian
brew install --cask sleek
brew install --cask todoist
brew install --cask todotxt
brew install lihaoyun6/tap/quickrecorder

# utilities
# brew install ical-buddy
brew install --cask alfred
brew install --cask angry-ip-scanner
brew install --cask anydesk
brew install --cask appcleaner
brew install --cask balenaetcher
brew install --cask bitwarden
brew install --cask cheatsheet
brew install --cask coconutbattery
brew install --cask flameshot
brew install --cask keepingyouawake
brew install --cask maccy
brew install --cask mullvadvpn
brew install --cask raspberry-pi-imager
brew install --cask rustdesk
brew install --cask spectacle
brew install --cask the-unarchiver
brew install --cask tyke
brew install --cask yubico-authenticator
brew install --cask yubico-yubikey-manager
uv tool install brew-cleaner

# peripheral software
brew install --cask linearmouse
# brew install --cask logitech-camera-settings
# brew install --cask logitech-g-hub

echo "================================= Install App Store applications ================================="
mas install 1176895641 # spark
mas install 1451685025 # wireguard
mas install 539883307  # LINE
