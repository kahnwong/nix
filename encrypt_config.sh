#!/bin/bash

cd dotfiles || exit
sops -e .wakatime.cfg >wakatime.sops.cfg
sops -e .ssh/config >.ssh/config.sops
sops -e .config/fish/conf.d/work.fish >.config/fish/conf.d/work.sops.fish
sops -e .aws/config >.aws/config.sops
sops -e .aws/credentials >.aws/credentials.sops
sops -e settings.json >settings.sops.json
