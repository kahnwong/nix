#!/bin/bash

export PATH=$PATH:$HOME/.nix-profile/bin

### python
curl https://pyenv.run | bash

export PATH=$PATH:$HOME/.pyenv/bin
export PYTHON_VERSION="3.10.8"
pyenv install -s $PYTHON_VERSION
pyenv global $PYTHON_VERSION

### npm
npm set prefix ~/.npm-global

### packages
npm install -g @jaebradley/wakatime-cli
go install github.com/nore-dev/fman@latest
go install github.com/yitsushi/totp-cli@latest
pipx install nbpreview
pipx install pip_search

### set fish colors
fish -c "set fish_color_autosuggestion '555'  'brblack'"
fish -c "set fish_color_cancel -r"
fish -c "set fish_color_command blue"
fish -c "set fish_color_comment red"
fish -c "set fish_color_cwd green"
fish -c "set fish_color_cwd_root red"
fish -c "set fish_color_end green"
fish -c "set fish_color_error brred"
fish -c "set fish_color_escape brcyan"
fish -c "set fish_color_history_current --bold"
fish -c "set fish_color_host normal"
fish -c "set fish_color_host_remote yellow"
fish -c "set fish_color_normal normal"
fish -c "set fish_color_operator brcyan"
fish -c "set fish_color_param cyan"
fish -c "set fish_color_quote yellow"
fish -c "set fish_color_redirection 'cyan'  '--bold'"
fish -c "set fish_color_search_match --background=111"
fish -c "set fish_color_selection 'white'  '--bold'  '--background=brblack'"
fish -c "set fish_color_status red"
fish -c "set fish_color_user brgreen"
fish -c "set fish_color_valid_path --underline"
fish -c "set fish_pager_color_completion normal"
fish -c "set fish_pager_color_description 'B3A06D'  'yellow'  '-i'"
fish -c "set fish_pager_color_prefix 'cyan'  '--bold'  '--underline'"
fish -c "set fish_pager_color_progress 'brwhite'  '--background=cyan'"
fish -c "set fish_pager_color_selected_background -r"
