#!/bin/bash

# aws
mkdir -p ~/.aws
sops -d ./programs/aws/config.sops >~/.aws/config
sops -d ./programs/aws/credentials.sops >~/.aws/credentials

# fish
sops -d ./programs/fish/conf.d/work.sops.fish >~/.config/fish/conf.d/work.fish

# k8s
mkdir -p ~/.kube
sops -d ./programs/kubectl/config.sops >~/.kube/config

# ssh
mkdir -p ~/.ssh/config.d
sops -d ./programs/ssh/config.d/homelab.sops >~/.ssh/config.d/homelab
sops -d ./programs/ssh/config.d/vps.sops >~/.ssh/config.d/vps
# sops -d ./programs/ssh/config.d/work-legacy.sops >~/.ssh/config.d/work-legacy
# sops -d ./programs/ssh/config.d/work.sops >~/.ssh/config.d/work
sops -d ./programs/ssh/config.sops >~/.ssh/config

# timesheet
mkdir -p ~/.config/timesheet
sops -d ./programs/timesheet/config.sops.ini.txt >~/.config/timesheet/config.ini
## replace path
if [[ $(uname -s) == 'Linux' ]]; then
	sed -i.bak 's#/Users/kahnwong/Cloud#/opt/syncthing/cloud#' ~/.config/timesheet/config.ini
fi

# wakatime
sops -d ./programs/wakatime/wakatime.sops.cfg >~/.wakatime.cfg

# workspace-init
mkdir -p ~/.config/workspace-init
sops -d ./programs/workspace-init/config.sops.yaml >~/.config/workspace-init/config.yaml

## vscode
#sops -d ./scripts/vscode/config/settings.sops.json >./scripts/vscode/config/settings.json
