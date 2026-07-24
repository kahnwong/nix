#!/bin/bash

# coding agents
curl -fsSL https://antigravity.google/cli/install.sh | bash
curl -fsSL https://claude.ai/install.sh | bash
curl -fsSL https://cli.kiro.dev/install | bash
curl -fsSL https://pi.dev/install.sh | sh
ubi --project charmbracelet/crush --in ~/.local/bin
yarn global add opencode-ai

### pi plugins
curl -fsSL https://hypabolic.github.io/Hypa/install.sh | sh
pi install npm:@hypabolic/pi-hypa
pi install npm:@juicesharp/rpiv-ask-user-question
pi install npm:@juicesharp/rpiv-todo
pi install npm:context-mode
pi install npm:pi-mcp-adapter
pi install npm:pi-web-access

# tools
## git-ai
curl -sSL https://usegitai.com/install.sh | bash

## microsandbox
curl -fsSL https://install.microsandbox.dev | sh

## apm
curl -sSL https://aka.ms/apm-unix | sh

## codegraph
npx @colbymchenry/codegraph

# skills
git clone git@github.com:kahnwong/.agents.git ~/.agents --depth 1
npx skills add superradcompany/skills -a opencode crush claude-code pi

## per-project basis
npx skills add GoogleChrome/modern-web-guidance -a opencode crush claude-code pi
npx skills add JuliusBrussee/caveman -a opencode crush claude-code pi
android skills add --all
