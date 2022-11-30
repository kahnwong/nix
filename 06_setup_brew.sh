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
