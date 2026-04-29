# repo-switcher
function r
    argparse 'n' -- $argv
    or return

    set -l path (command repo-switcher $argv)
    test $status -eq 0; or return

    if set -q _flag_n # cd into project
        cd $path
    else # open in IDE
        idea $path &
    end
end
