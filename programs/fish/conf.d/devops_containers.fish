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
    docker images | grep $argv | awk '{print $2}' | xargs docker rmi
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
