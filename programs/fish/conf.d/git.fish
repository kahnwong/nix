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

function ,git-add-ssh-agent
    ssh-add --apple-use-keychain ~/.ssh/github_signing_key
    ssh-add --apple-use-keychain ~/.ssh/forgejo_signing_key
end

function ,init-pre-commit
    cp ~/.pre-commit-config.yaml .
    chmod 644 .pre-commit-config.yaml
end
