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
    /opt/homebrew/bin \
    /snap/bin \
    /usr/local/bin \
    /usr/local/sbin \
    /usr/bin \
    /usr/sbin \
    /bin \
    /sbin \
    $HOME/scripts

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

# android
set ANDROID_HOME $HOME/Android/Sdk
set ANDROID_SDK_ROOT $HOME/Android/Sdk
set PATH $PATH:$ANDROID_SDK_ROOT/tools
set PATH $PATH:$ANDROID_SDK_ROOT/platform-tools

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
# CONFIG: SHELL
####################
# editor
set EDITOR nvim

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

# direnv
direnv hook fish | source

function ls
    eza --icons -1 --group-directories-first $argv
end

function cat
    bat --theme "Monokai Extended" $argv
end

function vi
    nvim $argv
end

function tere
    set --local result (command tere $argv)
    [ -n "$result" ] && cd -- "$result"
end

function tmux
    zellij $argv
end
