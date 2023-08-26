########################
# CONTAINERS: DOCKER
########################
function docker-rmi
    docker images | grep $argv | awk '{print $3}' | xargs docker rmi
end

########################
# CONTAINERS: K8S
########################
function k
    kubectl $argv
end

############################
# IDE: VSCODE
############################
function rcode
    code --folder-uri=vscode-remote://ssh-remote+nuc/home/kahnwong/$argv/
end

########################
# INFRA: GCP
########################
function gcp-resources-list
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
function terraformer-init
    terraform state replace-provider -auto-approve registry.terraform.io/-/aws hashicorp/aws && terraform init
end

function tf-cost
    infracost breakdown --path .
end

function tf-cost-html
    infracost breakdown \
        --format html \
        --out-file infracost-report.html \
        --usage-file /tmp/ignore.yml \
        --sync-usage-file \
        --path .
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
    dog $argv
end

function ping
    gping $argv
end

function geoping
    curl -s "https://geonet.shodan.io/api/geoping/$argv" | jq 'sort_by(.avg_rtt) | .[] | {"city": .from_loc.city, "response_time":.avg_rtt}'
end

function geodns
    curl -s "https://geonet.shodan.io/api/geodns/$argv" | jq '.[] | {"city": .from_loc.city, "value":.answers[].value}'
end

########################
# UTILITIES
########################
function upload-picoshare -a path -a url
    set -l url "$(echo $url | sed 's#/g/#/api/guest/#g')"
    curl -F "file=@$path" $url
end
