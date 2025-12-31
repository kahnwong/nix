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
