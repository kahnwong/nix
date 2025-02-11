#!/bin/bash

echo "================================= Install brew apps ================================="

# browser
brew install --cask firefox
brew install --cask firefox-nightly
brew install --cask google-chrome

# cli
brew install mas
brew install mpv

# cloud storage
brew install --cask dropbox
brew install --cask syncthing

# communication
brew install --cask adium
brew install --cask discord
brew install --cask messenger
brew install --cask microsoft-teams
brew install --cask slack
brew install --cask thunderbird
brew install --cask whatsapp
brew install --cask zoom

# data
# brew install --cask qgis
brew install --cask tad
brew install apache-spark

# dev tools
# brew install --cask mongodb-compass
# brew install --cask devtoys
# brew install --cask docker
brew install --cask fork
brew install --cask ghostty
brew install --cask intellij-idea
# brew install --cask kitty
brew install --cask microsoft-remote-desktop
brew install --cask tailscale
brew install --cask visual-studio-code
brew install kui

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
brew install --cask notion-calendar
brew install --cask loom
brew install --cask macdown
brew install --cask obsidian
brew install --cask sleek
#brew install --cask todoist
brew install --cask todotxt

# utilities
# brew install --cask hiddenbar
# brew install --cask protonvpn
# brew install --cask spectacle
# brew install --cask stats
brew install --cask alfred
brew install --cask angry-ip-scanner
brew install --cask anydesk
brew install --cask appcleaner
brew install --cask balenaetcher
brew install --cask bitwarden
brew install --cask cheatsheet
brew install --cask coconutbattery
brew install --cask flameshot
brew install --cask hot
brew install --cask kap
brew install --cask keepingyouawake
brew install --cask maccy
#brew install --cask michaelvillar-timer
brew install --cask mullvadvpn
brew install --cask raspberry-pi-imager
brew install --cask shifty
brew install --cask the-unarchiver
brew install --cask tyke
brew install --cask yubico-authenticator
brew install --cask yubico-yubikey-manager
brew install ical-buddy
brew install jordanbaird-ice

# peripheral software
brew install --cask linearmouse
brew install --cask logitech-camera-settings
brew install --cask logitech-g-hub

echo "================================= Install App Store applications ================================="
mas install 1176895641 # spark
# mas install 1423210932 # flow - focus & pomodoro timer
mas install 1451685025 # wireguard
mas install 539883307  # LINE
mas install 568494494  # pocket
