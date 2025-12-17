#!/bin/bash

sudo apt install pcscd -y
sudo wget -P /usr/local/bin https://developers.yubico.com/yubikey-manager-qt/Releases/yubikey-manager-qt-latest-linux.AppImage
sudo chmod +x /usr/local/bin/yubikey-manager-qt-latest-linux.AppImage
