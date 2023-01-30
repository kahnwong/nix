#!/bin/bash

sops -e .env >.enc.env

cd dotfiles || exit
sops -e .aws/config >.aws/config.sops
sops -e .aws/credentials >.aws/credentials.sops
sops -e .config/fish/conf.d/work.fish >.config/fish/conf.d/work.sops.fish
sops -e .config/sops/age/keys.txt >.config/sops/age/keys.sops.txt
sops -e .ssh/config >.ssh/config.sops
sops -e .wakatime.cfg >wakatime.sops.cfg

cd ../config/vscode || exit
sops -e settings.json >settings.sops.json
