# caddy
function caddy-serve
    caddy file-server --listen 0.0.0.0:3000
end

# ntfy
function ntfy
    curl -d "Task completed" $(get_fish_secret NTFY_TOPIC)
end

# security
function sbom
    syft scan dir:.
end

function vuln
    grype dir:.
end

# terraform
function tf
  tofu $argv
end

function tfcost
    infracost breakdown --path .
end

function tfcost-html
    infracost breakdown \
        --format html \
        --out-file infracost-report.html \
        --usage-file /tmp/ignore.yml \
        --sync-usage-file \
        --path .
end

function tfdocs
    terraform-docs markdown table --html=false --anchor=false --output-file README.md --output-mode inject .
end

# scratch workspace
function firecrack
    ssh -t kubevirt-ubuntu-r440 firecrack start
end
