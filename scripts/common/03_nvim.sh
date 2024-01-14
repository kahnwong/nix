#!/bin/bash

git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

nvim
mkdir -p ~/.config/nvim/lua/custom/configs
cp "$(pwd)/scripts/common/nvchad/overrides.lua" ~/.config/nvim/lua/custom/configs/overrides.lua
cp "$(pwd)/scripts/common/nvchad/lspconfig.lua" ~/.config/nvim/lua/custom/configs/lspconfig.lua
cp "$(pwd)/scripts/common/nvchad/chadrc.lua" ~/.config/nvim/lua/custom/chadrc.lua
cp "$(pwd)/scripts/common/nvchad/plugins.lua" ~/.config/nvim/lua/custom/plugins.lua
cp "$(pwd)/scripts/common/nvchad/highlights.lua" ~/.config/nvim/lua/custom/highlights.lua
cp "$(pwd)/scripts/common/nvchad/mappings.lua" ~/.config/nvim/lua/custom/mappings.lua
