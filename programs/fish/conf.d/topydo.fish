function t
    topydo $argv
end

function tt
    topydo due:"<=today"
end

function tat
    topydo add due:today $argv
end

function tr
    topydo ls -s asc:context -- -@work -@recurring -@tinkering -@meet
end

function tw
    topydo @work
end

function taw
    topydo add @work $argv
end

function tkr
    topydo @tinkering
end

function tc
    topydo columns
end
