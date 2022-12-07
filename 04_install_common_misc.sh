#!/bin/bash

export PATH=$PATH:$HOME/.nix-profile/bin

### python
curl https://pyenv.run | bash

export PATH=$PATH:$HOME/.pyenv/bin
export PYTHON_VERSION="3.10.8"
pyenv install -s $PYTHON_VERSION
pyenv global $PYTHON_VERSION

### npm
npm set prefix ~/.npm-global

### packages
npm install -g @jaebradley/wakatime-cli
go install github.com/nore-dev/fman@latest
go install github.com/yitsushi/totp-cli@latest
pipx install nbpreview
