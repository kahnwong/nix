########################
# CONTAINERS: K8S
########################
function k
    kubectl $argv
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

########################
# SYSTEM: NETWORKING
########################
function dig
    doggo $argv
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
