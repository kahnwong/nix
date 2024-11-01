function t
    topydo $argv
end

function td
    topydo due:"<=today"
end

function tr
    topydo ls -s asc:context -- -@work -@recurring -@quarterly-sync
end

function tw
    topydo @work
end

function tt
    topydo @tinkering
end

function tc
    topydo columns
end
