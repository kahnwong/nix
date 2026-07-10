#!/bin/bash

curl -fsSL https://apt.gitcomet.dev/gitcomet-archive-keyring.gpg | sudo tee /usr/share/keyrings/gitcomet-archive-keyring.gpg >/dev/null
curl -fsSL https://apt.gitcomet.dev/gitcomet.sources | sudo tee /etc/apt/sources.list.d/gitcomet.sources >/dev/null
sudo apt update
sudo apt install gitcomet -y
