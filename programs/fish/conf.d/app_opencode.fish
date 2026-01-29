function crush
    set -x AI_GATEWAY_API_KEY $(get_fish_secret AI_GATEWAY_API_KEY)
    command crush $argv
end
