#!/bin/bash

sops -d ./programs/aws/config.sops >~/.aws/config
sops -d ./programs/aws/credentials.sops >~/.aws/credentials
sops -d ./programs/fish/conf.d/work.sops.fish >~/.config/fish/conf.d/work.fish
sops -d ./programs/pgconn/db.sops.yaml.txt >~/.config/pgconn/db.yaml
sops -d ./programs/ssh/config.d/homelab.sops >~/.ssh/config.d/homelab
sops -d ./programs/ssh/config.d/vps.sops >~/.ssh/config.d/vps
sops -d ./programs/ssh/config.d/work-legacy.sops >~/.ssh/config.d/work-legacy
sops -d ./programs/ssh/config.d/work.sops >~/.ssh/config.d/work
sops -d ./programs/ssh/config.sops >~/.ssh/config
sops -d ./programs/totp/totp.sops.yaml.txt >~/.config/totp/totp.yaml
sops -d ./programs/wakatime/wakatime.sops.cfg >~/.wakatime.cfg
sops -d ./scripts/vscode/config/settings.sops.json >./scripts/vscode/config/settings.json
