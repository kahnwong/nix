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
# PATH
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
alias nvm="fnm"
if type -p fnm > /dev/null; fnm env --use-on-cd --shell fish | source; end

# python
set UV_CACHE_DIR ~/.cache/uv

# IDE -- only when using intellij from snap
# switch (uname)
#     case Linux
#         alias idea="intellij-idea-ultimate"
# end

# zed
switch (uname)
    case Linux
        alias zed="/var/lib/flatpak/exports/bin/dev.zed.Zed"
end

# podman
switch (uname)
    case Darwin
        function docker
            podman $argv
        end

        # https://github.com/jesseduffield/lazydocker/issues/4#issuecomment-2594808943
        function lazydocker
            DOCKER_HOST="unix://$(podman machine inspect --format '{{.ConnectionInfo.PodmanSocket.Path}}')" "$HOME/.nix-profile/bin/lazydocker"
        end
end

####################
# CONFIG: TOOLS
####################
# editor
set EDITOR nvim

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

# direnv
direnv hook fish | source

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

# umami
if type -p umami > /dev/null; umami completion fish | source; end

# media-discord-rpc
alias d="media-discord-rpc"
if type -p media-discord-rpc > /dev/null; d completion fish | source; end

# habit-tracker
alias h="habit-tracker"
if type -p habit-tracker > /dev/null; h completion fish | source; end

####################
# CONFIG: GCP
####################
set GOOGLE_APPLICATION_CREDENTIALS $HOME/.config/gcloud/application_default_credentials.json
