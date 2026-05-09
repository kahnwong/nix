function dig
    doggo $argv
end

function oryx
    sudo /home/kahnwong/.local/bin/oryx
end

function bandwhich
    sudo /home/kahnwong/.nix-profile/bin/bandwhich
end

function ping
    gping $argv
end

# ssh
function sshx
    command sshx --server $(get_fish_secret SSHX_ENDPOINT) --shell fish
end

# find process name from port
function pid-from-port
    switch (uname)
        case Linux
            sudo lsof -i :$argv
    end
end
