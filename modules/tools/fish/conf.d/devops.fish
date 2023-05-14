################
# docker
################
function docker-rmi
    docker images | grep $argv | awk '{print $3}' | xargs docker rmi
end

################
# terraform
################
function terraformer-init
    terraform state replace-provider -auto-approve registry.terraform.io/-/aws hashicorp/aws && terraform init
end

function tf-cost
    infracost breakdown \
        --format html \
        --out-file infracost-report.html \
        --usage-file /tmp/ignore.yml \
        --sync-usage-file \
        --path .
end

################
# gcp
################
function gcp-resources-list
    echo "getting resources: $argv"
    gcloud asset search-all-resources \
        --scope=projects/$argv \
        --page-size=500 \
        --format=json \
            > $argv.json
end

################
# networking
################
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

################
# system
################
function ps
    procs $argv
end
