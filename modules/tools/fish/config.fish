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
    $HOME/.fig/bin \
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
# CONFIG: RUNTIME
####################
# nix
set NIX_PATH $HOME/.nix-defexpr/channels
set PATH $PATH:$HOME/.nix-profile/bin
set PATH $PATH:/nix/var/nix/profiles/default/bin/

####################
# PROMPT
####################
starship init fish | source
