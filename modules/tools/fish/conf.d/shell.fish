function ls
    exa --icons -1 --group-directories-first $argv
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

function weather
    curl wttr.in
end

function tmux
    zellij $argv
end

function zip-compress
    bash -c 'for i in *.txt; do zip -rm `basename $i .txt`.zip $i; done'
end

function code-to-image
    silicon --from-clipboard -l rs --to-clipboard --theme "OneHalfDark"
end
