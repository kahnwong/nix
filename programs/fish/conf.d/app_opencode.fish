set -gx AI_GATEWAY_API_KEY $(get_fish_secret AI_GATEWAY_API_KEY)

function crush
    command crush $argv
end
