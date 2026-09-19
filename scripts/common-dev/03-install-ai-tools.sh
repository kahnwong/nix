#!/bin/bash

# coding agents
curl -fsSL https://cli.kiro.dev/install | bash
curl -fsSL https://opencode.ai/install | bash
curl -fsSL https://pi.dev/install.sh | sh
ubi --project charmbracelet/crush --in ~/.local/bin

### pi plugins
curl -fsSL https://hypabolic.github.io/Hypa/install.sh | sh
pi install npm:@hypabolic/pi-hypa
pi install npm:@juicesharp/rpiv-ask-user-question
pi install npm:@juicesharp/rpiv-todo
pi install npm:context-mode
pi install npm:pi-mcp-adapter
pi install npm:pi-web-access

# tools
curl -fsSL https://install.microsandbox.dev | sh
curl -fsSL https://raw.githubusercontent.com/raine/workmux/main/scripts/install.sh | bash
curl -sSL https://usegitai.com/install.sh | bash
npx @colbymchenry/codegraph

curl -fsSL https://raw.githubusercontent.com/rtk-ai/rtk/refs/heads/master/install.sh | sh
rtk init -g --agent pi

# skills
if [ -d "$HOME/.agents" ]; then git -C "$HOME/.agents" pull; else git clone git@github.com:kahnwong/.agents.git "$HOME/.agents" --depth 1; fi
npx skills add JetBrains/go-modern-guidelines -g -a opencode crush pi
npx skills add mattpocock/skills --skill grill-me -g -a opencode crush pi
npx skills add superradcompany/skills -g -a opencode crush pi

### per-project basis
#npx skills add GoogleChrome/modern-web-guidance -a opencode crush pi
#npx skills add JuliusBrussee/caveman -a opencode crush pi
#android skills add --all
