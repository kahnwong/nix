#!/bin/bash

git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

nvim
cp "$(pwd)/scripts/common/nvchad/overrides.lua" ~/.config/nvim/lua/custom/configs/overrides.lua
cp "$(pwd)/scripts/common/nvchad/chadrc.lua" ~/.config/nvim/lua/custom/chadrc.lua
cp "$(pwd)/scripts/common/nvchad/plugins.lua" ~/.config/nvim/lua/custom/plugins.lua
