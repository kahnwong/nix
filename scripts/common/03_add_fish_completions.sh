#!/bin/bash

mkdir temp
cd temp || exit

git clone --depth 1 -b master https://github.com/fish-shell/fish-shell.git
mkdir -p ~/.config/fish/completions
mv fish-shell/share/completions/*.fish ~/.config/fish/completions/

cd .. || exit
rm -rf temp
