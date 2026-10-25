# zellij
function zellij_update_tabname --on-variable PWD
    if set -q ZELLIJ
        set -l current_dir $PWD
        if test "$current_dir" = "$HOME"
            set current_dir "~"
        else
            set current_dir (basename "$current_dir")
        end
        nohup zellij action rename-tab "$current_dir" >/dev/null 2>&1
    end
end

function tal
    zellij attach $(zellij ls -s -n | head -1)
end

# repo-switcher
function r
    set path (command repo-switcher $argv)
    if test $status -eq 0
        read -l -P "Launch IDE? [y/N] " launch_ide
        if string match -qir '^(y|yes)$' -- "$launch_ide"
            if test "$hostname" != "steelhead"; and test "$hostname" != "ika"
                idea $path &
            else
                zed $path
            end
        end

        cd $path
        # zellij --layout two_panes_vertical
        zellij --session $(zellij ls -s -n | head -1) action new-tab --layout two_panes_vertical --cwd $path --name $(basename $path) > /dev/null
    end
end
