# repo-switcher
function r
    set path (command repo-switcher $argv)
    if test $status -eq 0
        if test "$hostname" != "steelhead"
            idea $path &
        else
            zed $path
        end

        cd $path
    end
end
