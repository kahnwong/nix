function weather
    curl wttr.in/Bangkok
end

function tz # <https://github.com/oz/tz>
    TZ_LIST="US/Eastern,USA - New York;US/Pacific,USA - Seattle;Europe/Amsterdam,NL - Amsterdam;Europe/Riga,LV - Riga;Europe/London,UK - London" command tz
end

function browsh
    set home_path "/home/kahnwong"
    if test (uname) = "Darwin"
        set home_path "/Users/kahnwong"
    end

    docker run -it --rm -v $home_path/.config/browsh/config.toml:/app/.config/browsh/config.toml browsh/browsh
end
