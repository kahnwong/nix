######################
# crush
######################
function crush
    set -x AI_GATEWAY_API_KEY $(get_fish_secret AI_GATEWAY_API_KEY)
    command crush $argv
end

######################
# workmkux
######################
function workmux
    set -x ZELLIJ true # so workmux picks up zellij on default
    command workmux $argv
end

# ######################
# # copilot
# ######################
# function copilot
#     set -x COPILOT_PROVIDER_BASE_URL $(get_fish_secret COPILOT_PROVIDER_BASE_URL)
#     set -x COPILOT_PROVIDER_TYPE openai
#     set -x COPILOT_PROVIDER_API_KEY $(get_fish_secret AI_GATEWAY_API_KEY)
#     set -x COPILOT_MODEL claude-sonnet-4-6
#     command copilot $argv
# end

######################
# short commands
######################
function fetch-response
    curl -s -X POST $(get_fish_secret AI_GATEWAY_BASE_URL)/responses \
      -H "Authorization: Bearer "$(get_fish_secret AI_GATEWAY_API_KEY) \
      -H "Content-Type: application/json" \
      -d "{
            \"model\": \"auto\",
            \"input\": \"$argv[2] $argv[1]\",
            \"stream\": false
          }" | jq -r .output[0].content[0].text | glow -
end

function a # ask - coding mode
    fetch-response "you should provide code snippet without explanation" "$argv"
end

# normal
function as # ask - short answer
    fetch-response "you should provide answer within a few sentences" "$argv"
end
