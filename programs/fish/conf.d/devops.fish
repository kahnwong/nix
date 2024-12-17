########################
# CONTAINERS: K8S
########################
function k
    kubectl $argv
end

############################
# IDE: VSCODE
############################
function ,rcode
    code --folder-uri=vscode-remote://ssh-remote+nuc/home/kahnwong/$argv/
end

########################
# INFRA: GCP
########################
function ,gcp-list-resources
    # $argv = project_name

    echo "getting resources: $argv"
    gcloud asset search-all-resources \
        --scope=projects/$argv \
        --page-size=500 \
        --format=json >$argv.json
end


########################
# INFRA: TERRAFORM
########################
function tf
    terraform $argv
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
