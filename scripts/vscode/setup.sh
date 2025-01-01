#!/bin/bash

### config
if [[ $(uname -s) == 'Darwin' ]]; then
	export KEYBINDING_LOCATION="$HOME/Library/Application Support/Code/User/keybindings.json"
	export SETTING_LOCATION="$HOME/Library/Application Support/Code/User/settings.json"
else
	export KEYBINDING_LOCATION="$HOME/.config/Code/User/keybindings.json"
	export SETTING_LOCATION="$HOME/.config/Code/User/settings.json"
fi

cp ./scripts/vscode/config/keybindings.json "$KEYBINDING_LOCATION"
cp ./scripts/vscode/config/settings.json "$SETTING_LOCATION"

### extensions
export PATH=$PATH:$HOME/.nix-profile/bin

# dev tools
#code --install-extension bbenoist.Nix
#code --install-extension bmalehorn.vscode-fish
#code --install-extension DavidAnson.vscode-markdownlint
#code --install-extension dorzey.vscode-sqlfluff
#code --install-extension esbenp.prettier-vscode
#code --install-extension flesler.url-encode
#code --install-extension gerane.Language-TodoTXT
#code --install-extension github.vscode-github-actions
#code --install-extension GitHub.vscode-pull-request-github
#code --install-extension golang.go
#code --install-extension googlecloudtools.cloudcode
#code --install-extension hilleer.yaml-plus-json
#code --install-extension idleberg.badgen
#code --install-extension idleberg.badges
#code --install-extension jnoortheen.nix-ide
#code --install-extension kdl-org.kdl
code --install-extension Markwhen.markwhen
#code --install-extension marp-team.marp-vscode
#code --install-extension ms-azuretools.vscode-docker
#code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
#code --install-extension redhat.vscode-yaml
#code --install-extension shakram02.bash-beautify
#code --install-extension sourcegraph.cody-ai
#code --install-extension TabNine.tabnine-vscode
#code --install-extension TakumiI.markdowntable
#code --install-extension tamasfe.even-better-toml
#code --install-extension Terrastruct.d2
#code --install-extension vsls-contrib.gistfs
code --install-extension WakaTime.vscode-wakatime
#code --install-extension yaruson.ascii-unicode-escape
#code --install-extension zamerick.vscode-caddyfile-syntax

## IDE
#code --install-extension bladnman.auto-align
#code --install-extension christian-kohler.path-intellisense
#code --install-extension Gruntfuggly.todo-tree
#code --install-extension leodevbro.blockman
#code --install-extension mechatroner.rainbow-csv
#code --install-extension ms-vscode-remote.remote-ssh
#code --install-extension ms-vscode-remote.vscode-remote-extensionpack
#code --install-extension ms-vscode.atom-keybindings
#code --install-extension ms-vscode.remote-explorer
#code --install-extension ms-vscode.remote-server
#code --install-extension mushan.vscode-paste-image
#code --install-extension vscodevim.vim

## python
#code --install-extension donjayamanne.python-environment-manager
#code --install-extension magicstack.MagicPython
#code --install-extension ms-python.black-formatter
#code --install-extension ms-python.isort
#code --install-extension ms-python.python
#code --install-extension ms-python.vscode-pylance
#code --install-extension ms-toolsai.jupyter
#code --install-extension ptweir.python-string-sql

## terraform
#code --install-extension 4ops.terraform
#code --install-extension hashicorp.hcl
#code --install-extension hashicorp.terraform
#code --install-extension Infracost.infracost
#code --install-extension tfsec.tfsec
#
## theme
#code --install-extension GitHub.github-vscode-theme
#code --install-extension PKief.material-icon-theme
#code --install-extension akamud.vscode-theme-onelight
#code --install-extension antfu.theme-vitesse
#code --install-extension garytyler.darcula-pycharm
#code --install-extension sourcegraph.vscode-sourcegraph-theme
#code --install-extension vincentfiestada.cold-horizon-vscode
#code --install-extension zhuangtongfa.material-theme
