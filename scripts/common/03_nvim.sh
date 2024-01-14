#!/bin/bash

git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

nvim
mkdir -p ~/.config/nvim/lua/custom/configs

rm -rf ~/.config/nvim/lua/custom
cp -r "$(pwd)/scripts/common/nvchad/custom" ~/.config/nvim/lua/
