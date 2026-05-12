if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

set EDITOR nvim

zoxide init fish | source

alias h="habit-tracker"
alias sk="swissknife"
alias sm="article-summarizer"
alias ts="timesheet"
alias u="umamit"
alias vi="nvim"

# Auto-completions
set -l completion_commands \
    bean \
    erp \
    habit-tracker \
    swissknife \
    timesheet \
    umamit

for cmd in $completion_commands
    if command -v $cmd > /dev/null
        $cmd completion fish | source
    end
end

function ht
    habit-tracker today
end

function hw
    habit-tracker week
end

# base
function t
    topydo $argv
end

function tc
    topydo columns
end

function tsort
    topydo sort asc:context asc:project
end

# query
function tt
    topydo ls -s desc:priority,asc:context,asc:project due:"<=today"
end

function tmr
    topydo due:tomorrow
end

function tlh
    # lh = look ahead
    topydo due:"<=7d"
end

function tr
    topydo ls -s asc:context -- -@work -@recurring -@tinkering -@meet
end

function tw
    topydo @work
end

function tkr
    topydo ls -s desc:priority,asc:project @tinkering
end

# add
function tat
    topydo add due:today $argv
end

function taw
    topydo add @work $argv
end

function ut
    umamit today
end

function uw
    umamit week
end

function um
    umamit month
end

function uy
    umamit yesterday
end

function sts
    curl "http://127.0.0.1:8384/rest/db/scan?folder=$SYNCTHING_FOLDER_ID" \
        -X POST \
        -H "X-API-Key: xxxxxxx"
end
