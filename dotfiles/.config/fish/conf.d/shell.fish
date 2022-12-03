function ls
    exa --icons -1 --group-directories-first $argv
end

function cat
    bat --theme "Monokai Extended" $argv
end

function tree
    broot
end

function dig
    dog $argv
end

function du
    dust $argv
end

function ps
    procs $argv
end

function vi
    nvim $argv
end

function tere
    set --local result (command tere $argv)
    [ -n "$result" ] && cd -- "$result"
end

function weather
    curl wttr.in
end

#function ping
#    gping $argv
#end

# function mping
#     host $argv | iponmap -c
# end

# function cbonsai
#   docker exec -it cbonsai cbonsai -li
# end
