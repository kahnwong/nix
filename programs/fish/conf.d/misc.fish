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

# pop
set -gx RESEND_API_KEY $(get_fish_secret POP_RESEND_API_KEY)
set -gx POP_FROM $(get_fish_secret POP_EMAIL_FROM)

# syncthing
function sts
    switch (hostname)
        case Karn-MBP3.local
            set SYNCTHING_API_KEY SYNCTHING_API_KEY_M3
            set SYNCTHING_FOLDER_ID ku6v2-jkm7y
        case sailfish
            set SYNCTHING_API_KEY SYNCTHING_API_KEY_SAILFISH
            set SYNCTHING_FOLDER_ID ku6v2-jkm7y
        case redfin
            set SYNCTHING_API_KEY SYNCTHING_API_KEY_REDFIN
            set SYNCTHING_FOLDER_ID ku6v2-jkm7y
        case pi4
            set SYNCTHING_API_KEY SYNCTHING_API_KEY_PI4
            set SYNCTHING_FOLDER_ID ku6v2-jkm7y
    end

    curl "http://127.0.0.1:8384/rest/db/scan?folder=$SYNCTHING_FOLDER_ID" \
        -X POST \
        -H "X-API-Key: $(get_fish_secret $SYNCTHING_API_KEY)"
end

# notes
function np
    cd ~/Apps/notes/notes-personal/ || exit
    vi "+:NvimTreeToggle"
end

function nw
    cd ~/Apps/notes/notes-work/ || exit
    vi "+:NvimTreeToggle"
end
