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
# CONFIG: EDITORS
####################
# zed
switch (uname)
    case Linux
        alias zed="/var/lib/flatpak/exports/bin/dev.zed.Zed"
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

# direnv
direnv hook fish | source

# # atuin
# # atuin init fish | source
# # # see <https://github.com/atuinsh/atuin/issues/2940>
# atuin init fish | sed "s/-k up/up/g" | source

# mcfly
mcfly init fish | source
set MCFLY_KEY_SCHEME vim

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

###############################
# APPS: Completions + Alias
###############################
# pgconn
if type -p pgconn > /dev/null; pgconn completion fish | source; end

# totp
if type -p totp > /dev/null; totp completion fish | source; end

# swissknife
alias sk="swissknife"
if type -p swissknife > /dev/null; sk completion fish | source; end

# timesheet
alias ts="timesheet"
if type -p timesheet > /dev/null; ts completion fish | source; end

# config-init
alias ci="config-init"
if type -p config-init > /dev/null; ci completion fish | source; end

# article-summarizer
alias sm="article-summarizer"

# erp
if type -p erp > /dev/null; erp completion fish | source; end

# media-discord-rpc
alias d="media-discord-rpc"
if type -p media-discord-rpc > /dev/null; d completion fish | source; end

# habit-tracker
if type -p habit-tracker > /dev/null; habit-tracker completion fish | source; end
alias h="habit-tracker"

# thailand-train-fare-calculator
if type -p thailand-train-fare-calculator > /dev/null; thailand-train-fare-calculator completion fish | source; end

# gcal-tui
alias c="gcal-tui"

# bean-add
if type -p bean-add > /dev/null; bean-add completion fish | source; end
alias ba="bean-add"

# umamit
if type -p umamit > /dev/null; umamit completion fish | source; end
alias u="umamit"
