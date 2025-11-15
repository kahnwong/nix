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

# gcp
set GOOGLE_APPLICATION_CREDENTIALS $HOME/.config/gcloud/application_default_credentials.json

function gcp-list-resources
    # ---- variables ----
    # $argv[1] = PROJECT_NAME
    # -------------------

    echo "Getting resources: $argv[1]"
    gcloud asset search-all-resources \
        --scope="projects/$argv[1]" \
        --page-size=500 \
        --format=json >"$argv.json"
end
