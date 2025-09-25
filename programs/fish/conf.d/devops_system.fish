function ps
    procs $argv
end

function sampler
    command sampler -c ~/.config/sampler/config.yaml
end

function bandwhich
    set binary_path "/home/kahnwong/.nix-profile/bin/bandwhich"
    if test (uname) = "Darwin"
        set binary_path "/Users/kahnwong/.nix-profile/bin/bandwhich"
    end

    sudo $binary_path
end
