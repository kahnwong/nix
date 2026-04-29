# browsh
switch (uname)
    case Linux
        function browsh
            docker run -it --rm -v "$HOME/.config/browsh/config.toml:/app/.config/browsh/config.toml" browsh/browsh
        end
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

# date
function d-iso-8601
    set -l value "$(date +%Y-%m-%d)"
    echo $value
    echo $value | copy
end
