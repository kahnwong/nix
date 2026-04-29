function cpubench
    CPUBENCH_API_KEY="$(get_fish_secret CPUBENCH_API_KEY)" command cpubench $argv
end

function retrooo
    RETROOO_API_KEY="$(get_fish_secret RETROOO_API_KEY)" command retrooo $argv
end

function weather
    curl wttr.in/Bangkok
end

function tz # <https://github.com/oz/tz>
    TZ_LIST="US/Eastern,USA - New York;US/Pacific,USA - Seattle;Europe/Amsterdam,NL - Amsterdam;Europe/London,UK - London" command tz
end

function pop
    set -x RESEND_API_KEY $(get_fish_secret POP_RESEND_API_KEY)
    set -x POP_FROM $(get_fish_secret POP_EMAIL_FROM)
    command pop $argv
end
