# repo-switcher
function r
    set path (command repo-switcher $argv)
    if test $status -eq 0
        if hostname != "steelhead"
            idea $path &
        else
            zed $path
        end
    end
end

function rcd
    set path (command repo-switcher $argv)
    if test $status -eq 0
        cd $path
    end
end
