function gg
    git log --graph --oneline --all
end

function gf
    git fetch --all --prune
end

function gs
    git status
end

function ga
    git add -p
end

function gp
    git push
end

function gd
    git diff
end

function gds
    git diff --staged
end

function gdl
    git diff HEAD~1..HEAD
end

function diff
    difft $argv
end

function p
    pre-commit
end
