function ls
    eza --icons -1 --group-directories-first $argv
end

function cat
    bat --theme "Monokai Extended" $argv
end

# function tree
#    broot
# end

function fm
    EDITOR="vi" fman --theme nord
end

function vi
    nvim $argv
end

function tere
    set --local result (command tere $argv)
    [ -n "$result" ] && cd -- "$result"
end

function tmux
    zellij $argv
end
