if type -p umamit > /dev/null; umamit completion fish | source; end
alias u="umamit"

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
