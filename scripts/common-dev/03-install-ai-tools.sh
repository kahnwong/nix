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
## caveman
claude plugin marketplace add JuliusBrussee/caveman
claude plugin install caveman@caveman

npx skills add JuliusBrussee/caveman -a opencode
