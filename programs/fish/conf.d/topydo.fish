function t
    topydo $argv
end

function tt
    topydo due:"<=today"
end

function tr
    topydo ls -- -@recurring
end

function tw
    topydo @work
end

function tc
    topydo columns
end
