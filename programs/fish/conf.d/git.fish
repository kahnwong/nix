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
    git commit -nm $argv
end

function gca
    git commit --amend -n
end

function gp
    git push
end

function gl
    git pull
end

# ---- merge ---- #
function gmr
    git checkout $argv
    git rebase master
    git checkout master
    git merge $argv
    git branch -D $argv
end

function gmrm
    git checkout $argv
    git rebase main
    git checkout main
    git merge $argv
end

# ---- diffs ---- #
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

# ---- utils ---- #
function p
    prek $argv
end

function gr
    git cliff --unreleased --tag $argv > changelog.md
    gh release create $argv -F changelog.md
    rm changelog.md
end

function glicense
    gh license create mit --author "Karn Wong <karn@karnwong.me>"
end
