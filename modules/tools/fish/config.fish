####################
# FISH
####################
# for making escape key work as meta, need to suppress it
set fish_escape_delay_ms 3000

# suppress fish_greeting message
set -g fish_greeting

####################
# PATH
####################
# default
set PATH \
    $HOME/.nix-profile/bin \
    $HOME/.pyenv/bin \
    $HOME/.local/bin \
    $HOME/.npm-global/bin \
    $HOME/.krew/bin \
    /opt/homebrew/bin \
    /usr/local/bin \
    /usr/local/sbin \
    /usr/bin \
    /usr/sbin \
    /bin \
    /sbin

####################
# CONFIG: MISC
####################
# flatpak on linux
set XDG_DATA_DIRS $HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:$XDG_DATA_DIRS

# gpg
set GPG_TTY tty

####################
# CONFIG: CLOUD
####################
# gcloud
set GOOGLE_APPLICATION_CREDENTIALS $HOME/.config/gcloud/application_default_credentials.json

####################
# CONFIG: RUNTIME
####################
# golang
set GOPATH ~/go
set PATH $PATH:$GOPATH/bin

# nix
set NIX_PATH $HOME/.nix-defexpr/channels
set PATH $PATH:$HOME/.nix-profile/bin
set PATH $PATH:/nix/var/nix/profiles/default/bin/

# python
set -g PYENV_ROOT $HOME/.pyenv
set PYENV_VERSION 3.11.3
status is-interactive; and pyenv init --path | source
pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source

set pipenv_fish_fancy yes

####################
# PROMPT
####################
starship init fish | source
