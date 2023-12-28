#!/bin/bash

mkdir -p ~/.aws
sops -d ./programs/aws/config.sops >~/.aws/config
sops -d ./programs/aws/credentials.sops >~/.aws/credentials

sops -d ./programs/fish/conf.d/work.sops.fish >~/.config/fish/conf.d/work.fish

mkdir -p ~/.kube
sops -d ./programs/kubectl/config.sops >~/.kube/config

mkdir -p ~/.config/pgconn
sops -d ./programs/pgconn/db.sops.yaml.txt >~/.config/pgconn/db.yaml

mkdir -p ~/.ssh/config.d
sops -d ./programs/ssh/config.d/homelab.sops >~/.ssh/config.d/homelab
sops -d ./programs/ssh/config.d/vps.sops >~/.ssh/config.d/vps
sops -d ./programs/ssh/config.d/work-legacy.sops >~/.ssh/config.d/work-legacy
sops -d ./programs/ssh/config.d/work.sops >~/.ssh/config.d/work
sops -d ./programs/ssh/config.sops >~/.ssh/config

mkdir -p ~/.config/totp
sops -d ./programs/totp/totp.sops.yaml.txt >~/.config/totp/totp.yaml

sops -d ./programs/wakatime/wakatime.sops.cfg >~/.wakatime.cfg

sops -d ./scripts/vscode/config/settings.sops.json >./scripts/vscode/config/settings.json
