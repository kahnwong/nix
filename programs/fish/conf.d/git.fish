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

function gc
    git commit -m $argv
end

function gca
    git commit --amend
end

function gp
    git push
end

function gl
    git pull
end

function gd
    git diff
end

# ---- diffs ---- #
function gds
    git diff --staged
end

function gdl
    git diff HEAD~1..HEAD
end

function diff
    difft $argv
end

# ---- pre-commit ---- #
function p
    pre-commit $argv
end

# ---- changelog ---- #
function grc
    git cliff --unreleased --tag $argv
end
