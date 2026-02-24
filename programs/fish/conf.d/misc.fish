# utils
function weather
    curl wttr.in/Bangkok
end

function tz # <https://github.com/oz/tz>
    TZ_LIST="US/Eastern,USA - New York;US/Pacific,USA - Seattle;Europe/Amsterdam,NL - Amsterdam;Europe/Riga,LV - Riga;Europe/London,UK - London" command tz
end

switch (uname)
    case Linux
        function browsh
            docker run -it --rm -v "$HOME/.config/browsh/config.toml:/app/.config/browsh/config.toml" browsh/browsh
        end
end

function cpubench
    CPUBENCH_API_KEY="$(get_fish_secret CPUBENCH_API_KEY)" command cpubench $argv
end

function fcat
     if test "$argv[2]" = "-p"
        fd $argv | xargs cat
     else
        fd $argv | xargs bat
     end
end

function fvi
    fd $argv | xargs vi
end

# pop
function pop
    set -x RESEND_API_KEY $(get_fish_secret POP_RESEND_API_KEY)
    set -x POP_FROM $(get_fish_secret POP_EMAIL_FROM)
    command pop $argv
end

# syncthing
function sts
    switch (hostname)
        case Karn-MBP3.local
            set SYNCTHING_API_KEY SYNCTHING_API_KEY_M3
        case sailfish
            set SYNCTHING_API_KEY SYNCTHING_API_KEY_SAILFISH
        case redfin
            set SYNCTHING_API_KEY SYNCTHING_API_KEY_REDFIN
        case inu
            set SYNCTHING_API_KEY SYNCTHING_API_KEY_INU
    end

    curl "http://127.0.0.1:8384/rest/db/scan?folder=$SYNCTHING_FOLDER_ID" \
        -X POST \
        -H "X-API-Key: $(get_fish_secret $SYNCTHING_API_KEY)"
end

# notes
function n
    cd ~/Git/kahnwong/notes/notes-personal/ || exit
    vi "+:NvimTreeToggle"
end

# date
function d-iso-8601
    set -l value "$(date +%Y-%m-%d)"
    echo $value
    echo $value | copy
end

# lemonade
function llm
    /usr/local/bin/lemonade-server serve & /usr/local/share/lemonade-server/app/lemonade
end

# repo-switcher
function r
    set path (command repo-switcher $argv)
    if test $status -eq 0
        cd $path
    end
end
