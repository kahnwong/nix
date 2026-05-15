# repo-switcher
function r
    set path (command repo-switcher $argv)
    if test $status -eq 0
        idea $path &
    end
end

function rcd
    set path (command repo-switcher $argv)
    if test $status -eq 0
        cd $path
    end
end
