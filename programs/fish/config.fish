####################
# FISH
####################
# for making escape key work as meta, need to suppress it
set fish_escape_delay_ms 3000

# suppress fish_greeting message
set -g fish_greeting

# clipboard alias
alias copy 'fish_clipboard_copy'
alias paste 'fish_clipboard_paste'

####################
# PATHS
####################
# default
set PATH \
    $HOME/.nix-profile/bin \
    $HOME/.local/bin \
    $HOME/.npm-global/bin \
    $HOME/.krew/bin \
    $HOME/.cargo/bin \
    $HOME/.pixi/bin \
    $HOME/.local/share/JetBrains/Toolbox/apps/intellij-idea-ultimate/bin \
    /Applications/IntelliJ\ IDEA.app/Contents/MacOS \
    /opt/homebrew/bin \
    /snap/bin \
    /usr/local/bin \
    /usr/local/sbin \
    /usr/bin \
    /usr/sbin \
    /bin \
    /sbin \
    $HOME/scripts

# flatpak on linux
set XDG_DATA_DIRS $HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:$XDG_DATA_DIRS

####################
# CONFIG: RUNTIMES
####################
# golang
set GOPATH ~/go
set PATH $PATH:$GOPATH/bin

function go-build
    CGO_ENABLED=0 go build -ldflags="-s -w" .
end

# nix
set NIX_PATH $HOME/.nix-defexpr/channels
set PATH $PATH:$HOME/.nix-profile/bin
set PATH $PATH:/nix/var/nix/profiles/default/bin/

# node
alias nvm="fnm"
if type -p fnm > /dev/null; fnm env --use-on-cd --shell fish | source; end

# python
set UV_CACHE_DIR ~/.cache/uv

function uv-init
    uv python pin 3.13
    uv init --package --author-from git --no-description
    uv venv
end

####################
# CONFIG: EDITORS
####################
# zed
switch (uname)
    case Linux
        alias zed="/var/lib/flatpak/exports/bin/dev.zed.Zed"
end
