#!/bin/bash

sops -d .enc.env >.env

cd dotfiles || exit
sops -d .aws/config.sops >.aws/config
sops -d .aws/credentials.sops >.aws/credentials
sops -d .config/fish/conf.d/work.sops.fish >.config/fish/conf.d/work.fish
sops -d .config/sops/age/keys.sops.txt >.config/sops/age/keys.txt
sops -d .ssh/config.sops >.ssh/config
sops -d wakatime.sops.cfg >.wakatime.cfg

cd ../config/vscode || exit
sops -d settings.sops.json >settings.json
