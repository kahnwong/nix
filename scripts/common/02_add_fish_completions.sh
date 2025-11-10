#!/bin/bash

mkdir temp
cd temp || exit

git clone --depth 1 -b master https://github.com/fish-shell/fish-shell.git
mkdir -p ~/.config/fish/completions
mv fish-shell/share/completions/*.fish ~/.config/fish/completions/
rm ~/.config/fish/completions/git.fish
cp ./programs/fish/completions/garmin-tui.fish ~/.config/fish/completions/

cd .. || exit
rm -rf temp

## docker
wget --backups 0 -P ~/.config/fish/completions https://raw.githubusercontent.com/docker/cli/master/contrib/completion/fish/docker.fish

## brew
wget --backups 0 -P ~/.config/fish/completions https://raw.githubusercontent.com/Homebrew/brew/master/completions/fish/brew.fish
