#!/bin/bash

# aws
mkdir -p ~/.aws
sops -d ./programs/aws/config.sops >~/.aws/config
sops -d ./programs/aws/credentials.sops >~/.aws/credentials

# fish
cp -r ./programs/fish/secrets ~/.config/fish/

# k8s
mkdir -p ~/.kube
sops -d ./programs/kubectl/config.sops.yaml >~/.kube/config

# ssh
mkdir -p ~/.ssh/config.d
sops -d ./programs/ssh/config.d/homelab.sops >~/.ssh/config.d/homelab
sops -d ./programs/ssh/config.d/vps.sops >~/.ssh/config.d/vps
# sops -d ./programs/ssh/config.d/work-legacy.sops >~/.ssh/config.d/work-legacy
# sops -d ./programs/ssh/config.d/work.sops >~/.ssh/config.d/work
sops -d ./programs/ssh/config.sops >~/.ssh/config

# timesheet
mkdir -p ~/.config/timesheet
sops -d ./programs/timesheet/config.sops.yaml >~/.config/timesheet/config.yaml
## replace path
if [[ $(uname -s) == 'Linux' ]]; then
	sed -i.bak 's#/Users/kahnwong/Apps#/home/kahnwong/Apps#' ~/.config/timesheet/config.yaml
fi

# wakatime
sops -d ./programs/wakatime/wakatime.sops.cfg >~/.wakatime.cfg

# workspace-init
mkdir -p ~/.config/workspace-init
sops -d ./programs/workspace-init/config.sops.yaml >~/.config/workspace-init/config.yaml

# gcal-tui
mkdir -p ~/.config/gcal-tui
sops -d ./programs/gcal-tui/config.sops.yaml >~/.config/gcal-tui/config.yaml

# media-discord-rpc
mkdir -p ~/.config/media-discord-rpc
sops -d ./programs/media-discord-rpc/config.sops.yaml >~/.config/media-discord-rpc/config.yaml

# gh-dash
mkdir -p ~/.config/gh-dash
sops -d ./programs/gh-dash/config.sops.yml >~/.config/gh-dash/config.yml

# fleet-dashboard
mkdir -p ~/.config/fleet-dashboard
sops -d ./programs/fleet-dashboard/config.sops.yaml >~/.config/fleet-dashboard/config.yaml

## vscode
#sops -d ./scripts/vscode/config/settings.sops.json >./scripts/vscode/config/settings.json

# qalc
# # add dummy file so it can write config
mkdir -p ~/.config/qalculate/
touch ~/.config/qalculate/qalc.cfg
