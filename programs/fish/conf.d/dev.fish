# repo-switcher
function r
    set path (command repo-switcher $argv)
    if test $status -eq 0
        read -l -P "Launch IDE? [y/N] " launch_ide
        if string match -qir '^(y|yes)$' -- "$launch_ide"
            if test "$hostname" != "steelhead"; or test "$hostname" != "ika"
                idea $path &
            else
                zed $path
            end
        end

        cd $path
    end
end
