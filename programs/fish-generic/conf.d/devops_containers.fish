# k8s
function k
    kubectl $argv
end

# docker
function docker-up
    docker compose down
    docker compose build
    docker compose up
end

function docker-rmi
    docker images | grep $argv | awk '{print $3}' | xargs docker rmi
end
