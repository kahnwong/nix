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

brew tap homebrew/cask-versions
brew tap homebrew/cask-drivers
