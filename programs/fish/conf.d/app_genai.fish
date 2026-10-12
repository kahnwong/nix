######################
# crush
######################
function crush
    set -x AI_GATEWAY_API_KEY $(get_fish_secret AI_GATEWAY_API_KEY)
    command crush $argv
end

######################
# workmux
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
