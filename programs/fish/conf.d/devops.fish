########################
# CONTAINERS
########################
function k
    kubectl $argv
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

# ############################
# # IDE: VSCODE
# ############################
# function ,rcode
#     code --folder-uri=vscode-remote://ssh-remote+nuc/home/kahnwong/$argv/
# end

########################
# INFRA: TERRAFORM
########################
function tf
  tofu $argv
end

########################
# SYSTEM
########################
function ps
    procs $argv
end

function sampler
    command sampler -c ~/.config/sampler/config.yaml
end

function bandwhich
    set binary_path "/home/kahnwong/.nix-profile/bin/bandwhich"
    if test (uname) = "Darwin"
        set binary_path "/Users/kahnwong/.nix-profile/bin/bandwhich"
    end

    sudo $binary_path
end

########################
# SYSTEM: NETWORKING
########################
function dig
    doggo $argv
end

function oryx
    sudo /home/kahnwong/.local/bin/oryx
end

function ping
    gping $argv
end

########################
# UTILITIES
########################
function ,picoshare-upload -a path -a url
    set -l url "$(echo $url | sed 's#/g/#/api/guest/#g')"
    curl -F "file=@$path" $url
end
