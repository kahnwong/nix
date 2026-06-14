#!/bin/bash

curl -fsSL https://claude.ai/install.sh | bash
curl -fsSL https://cli.kiro.dev/install | bash
#curl -fsSL https://gh.io/copilot-install | bash
ubi --project charmbracelet/crush --in ~/.local/bin
curl -fsSL https://antigravity.google/cli/install.sh | bash
yarn global add opencode-ai

# git-ai
curl -sSL https://usegitai.com/install.sh | bash

# skills
npx skills add JuliusBrussee/caveman -a opencode crush claude-code
npx skills add GoogleChrome/modern-web-guidance -a opencode crush claude-code
npx @colbymchenry/codegraph
android skills add --all
