# golang
function go-build
    CGO_ENABLED=0 go build -ldflags="-s -w" .
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

# s3
function r2
    aws --endpoint-url $(get_fish_secret R2_ENDPOINT) --profile r2 $argv
end

function garage
    # https://github.com/boto/boto3/issues/4392#issuecomment-2868118431
    set -gx AWS_REQUEST_CHECKSUM_CALCULATION when_required
    set -gx AWS_RESPONSE_CHECKSUM_VALIDATION when_required
    aws --endpoint-url $(get_fish_secret GARAGE_ENDPOINT) --profile garage $argv
end

function garage-internal
    aws --endpoint-url $(get_fish_secret GARAGE_ENDPOINT_INTERNAL) --profile garage $argv
end
