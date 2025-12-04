# sendme
function sendme
    if test "$argv[1]" = "send" -o "$argv[1]" = "receive"
        set -l new_argv $argv[1] "--relay" "$(get_fish_secret IROH_RELAY_ENDPOINT)" $argv[2..-1]
        command sendme $new_argv
        return 0
    end
    command sendme $argv
end
