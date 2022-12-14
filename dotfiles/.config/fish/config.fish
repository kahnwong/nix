################
# FISH
################
# for making escape key work as meta, need to suppress it
set fish_escape_delay_ms 3000

# suppress fish_greeting message
set -g fish_greeting


################
# PATH
################
# default
set PATH \
    $HOME/.nix-profile/bin \
    $HOME/.pyenv/bin \
    $HOME/.local/bin \
    $HOME/.npm-global \
    /opt/homebrew/bin \
    /usr/local/bin \
    /usr/local/sbin \
    /usr/bin \
    /usr/sbin \
    /bin \
    /sbin

### nix
set NIX_PATH $HOME/.nix-defexpr/channels
set PATH $PATH:$HOME/.nix-profile/bin
set PATH $PATH:/nix/var/nix/profiles/default/bin/

# golang
set GOPATH ~/go
set PATH $PATH:$GOPATH/bin

# gcloud
set GOOGLE_APPLICATION_CREDENTIALS $HOME/.config/gcloud/application_default_credentials.json

# python
set -g PYENV_ROOT $HOME/.pyenv
set PYENV_VERSION 3.10.6
status is-interactive; and pyenv init --path | source
pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source

set pipenv_fish_fancy yes


################
# PROMPT
################
starship init fish | source


################
# GPG
################
set GPG_TTY tty


################
# misc
################
# function budget
#     fava -p 5004 ~/Cloud/Apps/fava/beans.beancount
# end

function brew-upgrade-cask
    brew list --cask | xargs brew upgrade --cask
end


################
# vscode
################
function rcode
    code --folder-uri=vscode-remote://ssh-remote+nuc/home/kahnwong/$argv/
end

function rcode-ts
    code --folder-uri=vscode-remote://ssh-remote+fringe-division/home/kahnwong/$argv/
end
