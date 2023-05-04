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

# theme
code --install-extension akamud.vscode-theme-onelight
code --install-extension helgardrichard.helium-icon-theme
code --install-extension zhuangtongfa.material-theme
code --install-extension vincentfiestada.cold-horizon-vscode

# remote
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension ms-vscode-remote.remote-ssh-edit
code --install-extension ms-vscode-remote.vscode-remote-extensionpack
code --install-extension ms-vscode.remote-explorer

# terraform
# code --install-extension 4ops.terraform
code --install-extension hashicorp.terraform
code --install-extension hashicorp.hcl
code --install-extension Infracost.infracost
code --install-extension run-at-scale.terraform-doc-snippets
code --install-extension tfsec.tfsec

# nix
code --install-extension bbenoist.Nix
code --install-extension jnoortheen.nix-ide

# github
code --install-extension GitHub.vscode-pull-request-github
code --install-extension github.vscode-github-actions

# git
# code --install-extension mhutchie.git-graph
code --install-extension qezhu.gitlink
# code --install-extension waderyan.gitblame

# markdown
code --install-extension DavidAnson.vscode-markdownlint
# code --install-extension joffreykern.markdown-toc
code --install-extension TakumiI.markdowntable
# code --install-extension yzane.markdown-pdf
code --install-extension Markwhen.markwhen

# docs
# code --install-extension bierner.markdown-mermaid
code --install-extension terrastruct.d2
code --install-extension idleberg.badges
code --install-extension idleberg.badgen

# yaml
code --install-extension hilleer.yaml-plus-json
code --install-extension redhat.vscode-yaml

# python
code --install-extension donjayamanne.python-environment-manager
code --install-extension ms-python.black-formatter
code --install-extension ms-python.isort
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ptweir.python-string-sql
code --install-extension sourcery.sourcery

# jupyter
code --install-extension ms-toolsai.jupyter
code --install-extension ms-toolsai.jupyter-keymap
code --install-extension ms-toolsai.jupyter-renderers
code --install-extension ms-toolsai.vscode-jupyter-cell-tags
code --install-extension ms-toolsai.vscode-jupyter-slideshow

# golang
code --install-extension golang.go

# docker
code --install-extension ms-azuretools.vscode-docker

# kubernetes
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools

# syntax / linters / formatters
code --install-extension gerane.Language-TodoTXT
code --install-extension Lencerf.beancount
code --install-extension zamerick.vscode-caddyfile-syntax
code --install-extension bladnman.auto-align
code --install-extension bmalehorn.vscode-fish
code --install-extension bungcip.better-toml
code --install-extension dongfg.vscode-beancount-formatter
code --install-extension dorzey.vscode-sqlfluff
code --install-extension esbenp.prettier-vscode
code --install-extension iceyer.toml-formatter
code --install-extension ms-vscode.makefile-tools
code --install-extension kdl-org.kdl

# data
code --install-extension GrapeCity.gc-excelviewer
code --install-extension RandomFractalsInc.geo-data-viewer
code --install-extension RandomFractalsInc.vscode-data-preview
code --install-extension mechatroner.rainbow-csv
code --install-extension dvirtz.parquet-viewer

# workspace
code --install-extension Gruntfuggly.todo-tree
code --install-extension leodevbro.blockman
code --install-extension johnpapa.vscode-peacock
code --install-extension ms-vscode.atom-keybindings

# devtools
code --install-extension WakaTime.vscode-wakatime
code --install-extension withfig.fig
code --install-extension amazonwebservices.aws-toolkit-vscode
code --install-extension ms-vsliveshare.vsliveshare
# code --install-extension ms-vscode.test-adapter-converter
# code --install-extension mohitsingh.repo
# code --install-extension hbenl.vscode-test-explorer

# # utilities
code --install-extension christian-kohler.path-intellisense
# code --install-extension davidfreer.go-to-character-position
code --install-extension flesler.url-encode
# code --install-extension fvclaus.sort-json-array
code --install-extension ms-vscode.wordcount
code --install-extension mushan.vscode-paste-image
code --install-extension Rubymaniac.vscode-paste-and-indent
# code --install-extension ryu1kn.partial-diff
# code --install-extension ryu1kn.text-marker
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension TabNine.tabnine-vscode
code --install-extension vsls-contrib.gistfs
code --install-extension yaruson.ascii-unicode-escape
# code --install-extension mindaro-dev.file-downloader
code --install-extension AykutSarac.jsoncrack-vscode

# # applications
# code --install-extension fabiospampinato.vscode-todo-plus

# presentations
code --install-extension marp-team.marp-vscode
# code --install-extension antfu.slidev
