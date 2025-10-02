# # croc
# function croc
#     if test "$argv[1]" = "send"
#         command croc --pass $(get_fish_secret CROC_PASS) --relay "$(get_fish_secret CROC_ENDPOINT)" $argv
#     else if test "$argv[1]" = "receive"
#         CROC_SECRET="$argv[2]" command croc --pass $(get_fish_secret CROC_PASS) --relay "$(get_fish_secret CROC_ENDPOINT)"
#     else
#         command croc $argv
#     end
# end

# picoshare
function picoshare-upload -a path -a url
    set -l url "$(echo $url | sed 's#/g/#/api/guest/#g')"
    curl -F "file=@$path" $url
end

# sendme
function sendme
    if test "$argv[1]" = "send" -o "$argv[1]" = "receive"
        set -l new_argv $argv[1] "--relay" "$(get_fish_secret IROH_RELAY_ENDPOINT)" $argv[2..-1]
        command sendme $new_argv
        return 0
    end
    command sendme $argv
end
