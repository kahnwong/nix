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

function gmr
    git checkout $argv
    git rebase master
    git checkout master
    git merge $argv
end

function gmrm
    git checkout $argv
    git rebase main
    git checkout main
    git merge $argv
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
function gr
    export release_tag=$(svu next)
    git cliff --unreleased --tag $release_tag > changelog.md
    gh release create $release_tag -F changelog.md
    rm changelog.md
end
