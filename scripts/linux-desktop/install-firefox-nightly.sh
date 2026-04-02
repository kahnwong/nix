#!/bin/bash

wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | gpg --dearmor | sudo tee /etc/apt/keyrings/packages.mozilla.org.gpg >/dev/null
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.gpg] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list >/dev/null
sudo apt update
sudo apt install firefox-nightly -y
