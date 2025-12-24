#!/bin/bash

echo "========== Set Homebrew path =========="
if [[ $(uname -m) == 'arm64' ]]; then
	export PATH=$PATH:/opt/homebrew/bin
elif [[ $(uname -m) == 'x86_64' ]]; then
	export PATH=$PATH:/usr/local/bin
fi

echo "========== Installing Homebrew =========="
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sudo chown -R "$(whoami)" "$(brew --prefix)"/*

echo "================================= Set configs ================================="
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
