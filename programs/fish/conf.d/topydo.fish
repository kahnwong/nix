function t
    topydo $argv
end

function tt
    topydo due:"<=today"
end

function tr
    topydo ls -s asc:context -- -@work -@recurring -@quarterly-sync
end

function tw
    topydo @work
end

function tkr
    topydo @tinkering
end

function tc
    topydo columns
end
