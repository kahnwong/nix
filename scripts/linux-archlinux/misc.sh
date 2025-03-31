#!/bin/bash

# setup ssh-agent: <https://github.com/White-Oak/arch-setup-for-dummies/blob/master/setting-up-ssh-agent.md>
sudo pacman -S openssh
systemctl --user enable --now ssh-agent
set -x SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

# apps
sudo pacman -S xclip
sudo pacman -S ghostty
