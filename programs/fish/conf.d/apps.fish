# ---- gcal-tui ----
function ct
    gcal-tui today
end

function cw
    gcal-tui week
end

function cn
    gcal-tui next-meeting
end


# ---- genai ----
function crush
    set -x AI_GATEWAY_API_KEY $(get_fish_secret AI_GATEWAY_API_KEY)
    command crush $argv
end

function workmux
    set -x ZELLIJ true # so workmux picks up zellij on default
    command workmux $argv
end

# ---- habit-tracker ----
function ht
    habit-tracker today
end

function hw
    habit-tracker week
end

# ---- umamit ----
function ut
    umamit today
end

function uy
    umamit yesterday
end

function uw
    umamit week
end

function um
    umamit month
end

# ---- misc ----
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
