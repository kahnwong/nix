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

# cli
brew install mas
brew install mpv
brew install wkhtmltopdf

# communication
brew install --cask adium
brew install --cask discord-canary
brew install --cask microsoft-teams
brew install --cask slack
brew install --cask whatsapp
brew install --cask zoom

# data
brew install apache-spark

# utilities
# brew install --cask angry-ip-scanner
brew install --cask alfred
brew install --cask appcleaner
brew install --cask balenaetcher
brew install --cask bitwarden
brew install --cask cheatsheet
# brew install --cask clocker
brew install --cask coconutbattery
brew install --cask dozer
brew install --cask eul
brew install --cask flameshot
brew install --cask hot
brew install --cask kap
brew install --cask keepassxc
brew install --cask keepingyouawake
brew install --cask maccy
brew install --cask mactracker
brew install --cask meetingbar
brew install --cask michaelvillar-timer
brew install --cask muzzle
brew install --cask numi
brew install --cask shifty
brew install --cask spectacle
brew install --cask stats
brew install --cask the-unarchiver
brew install --cask tyke
brew install --cask yubico-yubikey-manager

# applications
brew install --cask calibre
brew install --cask cron
brew install --cask dropbox
brew install --cask fbreader
brew install --cask firefox
brew install --cask firefox-nightly
brew install --cask google-chrome
brew install --cask iina
brew install --cask jellyfin-media-player
brew install --cask macdown
brew install --cask miro
brew install --cask nextcloud
brew install --cask notion
brew install --cask pocket-casts
brew install --cask protonvpn
brew install --cask simple-comic
brew install --cask sleek
# brew install --cask spotify
brew install --cask standard-notes
brew install --cask syncthing
brew install --cask tad
brew install --cask todoist
brew install --cask todotxt
brew install --cask transmission-remote-gui
brew install --cask xnviewmp
# brew install --cask qgis

# database
brew install --cask db-browser-for-sqlite
brew install --cask mongodb-compass
brew install --cask datagrip

# quick look
brew install --cask syntax-highlight
brew install --cask jupyter-notebook-viewer
brew install --cask qlmarkdown

# dev tools
brew install --cask devdocs
brew install --cask devtoys
brew install --cask docker
brew install --cask fig
brew install --cask fork
brew install --cask gitup
brew install --cask httpie
brew install --cask intellij-idea
brew install --cask iterm2
brew install --cask microsoft-remote-desktop
brew install --cask openlens
brew install --cask postman
brew install --cask tailscale
brew install --cask visual-studio-code
brew install padok-team/tap/tfautomv

# peripheral software
brew install --cask logitech-options
brew install --cask logi-options-plus
brew install --cask logitech-camera-settings

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
