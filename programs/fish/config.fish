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
    $HOME/.local/share/nvm/v18.19.0/bin \
    $HOME/.nix-profile/bin \
    $HOME/.pyenv/bin \
    $HOME/.local/bin \
    $HOME/.npm-global/bin \
    $HOME/.krew/bin \
    /Applications/IntelliJ\ IDEA.app/Contents/MacOS \
    /opt/homebrew/bin \
    /usr/local/bin \
    /usr/local/sbin \
    /usr/bin \
    /usr/sbin \
    /bin \
    /sbin \
    $HOME/scripts

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

# node
set -xU nvm_default_version v18.19.0

# python
set PYENV_VERSION 3.11.3
if type -p pyenv > /dev/null; pyenv init - | source; end
status --is-interactive; and if type -p pyenv > /dev/null; pyenv virtualenv-init - | source; end
set pipenv_fish_fancy yes

####################
# CONFIG: TOOLS
####################
# flatpak on linux
set XDG_DATA_DIRS $HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:$XDG_DATA_DIRS

# fzf
export FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git -o -name cache -o -name dist \) -prune -o -print'

# gpg
set GPG_TTY tty

# starship
starship init fish | source

# zoxide
zoxide init fish | source

# mcfly
mcfly init fish | source
set MCFLY_KEY_SCHEME vim

# pgconn
if type -p pgconn > /dev/null; pgconn completion fish | source; end

# totp
if type -p totp > /dev/null; totp completion fish | source; end

# swissknife
if type -p swissknife > /dev/null; swissknife completion fish | source; end

####################
# CONFIG: GCP
####################
set GOOGLE_APPLICATION_CREDENTIALS $HOME/.config/gcloud/application_default_credentials.json
