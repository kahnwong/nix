#!/bin/bash
if [[ $(uname -m) == 'arm64' ]]; then
	echo "========== Set Homebrew path =========="
	export PATH=$PATH:/opt/homebrew/bin
fi

if [[ $(uname -m) == 'x86_64' ]]; then
	echo "========== Set Homebrew path =========="
	export PATH=$PATH:/usr/local/bin
fi

echo "========== Installing Homebrew =========="
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sudo chown -R "$(whoami)" "$(brew --prefix)"/*

echo "================================= Install brew apps ================================="
brew tap homebrew/cask-versions
brew tap homebrew/cask-drivers

# communication
brew install --cask --no-quarantine adium
brew install --cask --no-quarantine whatsapp

# data
brew install apache-spark

# utilities
# brew install --cask --no-quarantine angry-ip-scanner
brew install --cask --no-quarantine alfred
brew install --cask --no-quarantine appcleaner
brew install --cask --no-quarantine balenaetcher
brew install --cask --no-quarantine bitwarden
brew install --cask --no-quarantine cheatsheet
brew install --cask --no-quarantine clocker
brew install --cask --no-quarantine coconutbattery
brew install --cask --no-quarantine dozer
brew install --cask --no-quarantine eul
brew install --cask --no-quarantine flameshot
brew install --cask --no-quarantine hot
brew install --cask --no-quarantine kap
brew install --cask --no-quarantine keepingyouawake
brew install --cask --no-quarantine maccy
brew install --cask --no-quarantine mactracker
brew install --cask --no-quarantine meetingbar
brew install --cask --no-quarantine michaelvillar-timer
brew install --cask --no-quarantine muzzle
brew install --cask --no-quarantine numi
brew install --cask --no-quarantine shifty
brew install --cask --no-quarantine spectacle
brew install --cask --no-quarantine stats
brew install --cask --no-quarantine the-unarchiver
brew install --cask --no-quarantine tyke

# applications
brew install --cask --no-quarantine calibre
brew install --cask --no-quarantine dropbox
brew install --cask --no-quarantine fbreader
brew install --cask --no-quarantine firefox
brew install --cask --no-quarantine firefox-nightly
brew install --cask --no-quarantine google-chrome
brew install --cask --no-quarantine iina
brew install --cask --no-quarantine jellyfin-media-player
brew install --cask --no-quarantine macdown
brew install --cask --no-quarantine miro
brew install --no-quarantine mpv
brew install --cask --no-quarantine nextcloud
brew install --cask --no-quarantine notion
brew install --cask --no-quarantine protonvpn
brew install --cask --no-quarantine simple-comic
brew install --cask --no-quarantine sleek
# brew install --cask --no-quarantine spotify
brew install --cask --no-quarantine standard-notes
brew install --cask --no-quarantine syncthing
brew install --cask --no-quarantine tad
brew install --cask --no-quarantine todoist
brew install --cask --no-quarantine todotxt
brew install --cask --no-quarantine transmission-remote-gui
brew install --cask --no-quarantine xnviewmp
# brew install --cask --no-quarantine qgis

# database
brew install --cask --no-quarantine db-browser-for-sqlite
brew install --cask --no-quarantine mongodb-compass

# quick look
brew install --cask --no-quarantine syntax-highlight
brew install --cask --no-quarantine jupyter-notebook-viewer
brew install --cask --no-quarantine qlmarkdown

# dev tools
brew install --cask --no-quarantine devdocs
brew install --cask --no-quarantine devtoys
brew install --cask --no-quarantine docker
brew install --cask --no-quarantine fig
brew install --cask --no-quarantine fork
brew install --cask --no-quarantine gitup
brew install --cask --no-quarantine lens
brew install --cask --no-quarantine microsoft-remote-desktop
brew install --cask --no-quarantine tailscale

# peripheral software
brew install --cask --no-quarantine logitech-options
brew install --cask --no-quarantine logi-options-plus
brew install --cask --no-quarantine logitech-camera-settings

# misc
brew install mas

echo "================================= Install App Store applications ================================="
mas install 1176895641 # spark
mas install 1423210932 # flow - focus & pomodoro timer
mas install 1451685025 # wireguard
mas install 539883307  # LINE
mas install 568494494  # pocket
# mas install 1274495053 # microsoft todo

echo "================================= Set configs ================================="

### vscode config
cp ./dotfiles/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
cp ./dotfiles/settings.json ~/Library/Application\ Support/Code/User/settings.json

### macos config

# "General: Expand save and print panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# "General: Save to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# "General: Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# "Typing: Disable smart quotes and dashes as they cause problems when typing code"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# "Typing: Disable press-and-hold for keys in favor of key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# "Finder: Show status bar and path bar"
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true

# "Finder: Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# "Finder: Show the ~/Library folder"
chflags nohidden ~/Library

# "Security: Disable OSX app security check"
sudo spctl --master-disable
