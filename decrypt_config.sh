#!/bin/bash

cd dotfiles || exit
sops -d wakatime.sops.cfg >.wakatime.cfg
sops -d .ssh/config.sops >.ssh/config
sops -d .config/fish/conf.d/work.sops.fish >.config/fish/conf.d/work.fish
sops -d .aws/config.sops >.aws/config
sops -d .aws/credentials.sops >.aws/credentials
