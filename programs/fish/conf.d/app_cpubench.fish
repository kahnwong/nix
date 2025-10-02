function cpubench
    CPUBENCH_API_KEY="$(get_fish_secret CPUBENCH_API_KEY)" command cpubench $argv
end
