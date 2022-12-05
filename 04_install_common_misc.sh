#!/bin/bash

### python
curl https://pyenv.run | bash

export PATH=$PATH:$HOME/.pyenv/bin
pyenv install -s 3.10.8

### npm
npm set prefix ~/.npm-global

### packages
npm install -g @jaebradley/wakatime-cli
go install github.com/nore-dev/fman@latest

### pip
pipx install nbpreview
