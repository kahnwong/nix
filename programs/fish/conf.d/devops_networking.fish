function dig
    doggo $argv
end

function oryx
    sudo /home/kahnwong/.local/bin/oryx
end

function ping
    gping $argv
end

# ssh
function sshx
    command sshx --server $(get_fish_secret SSHX_ENDPOINT) --shell fish
end
