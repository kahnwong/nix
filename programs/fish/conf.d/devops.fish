# caddy
function caddy-serve
    echo "Serving at http://localhost:3000"
    caddy file-server --listen 0.0.0.0:3000
end

# ntfy
function ntfy
    curl -d "Task completed" $(get_fish_secret NTFY_TOPIC)
end

# scratch workspace
function firecrack
    ssh -t kubevirt-ubuntu-r440 firecrack start
end
