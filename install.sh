#!/bin/bash

nix-env -iA nixpkgs.tldr

# data
nix-env -iA nixpkgs.visidata
nix-env -iA nixpkgs.sqlfluff

# docker
nix-env -iA nixpkgs.ctop
nix-env -iA nixpkgs.dive
nix-env -iA nixpkgs.lazydocker

# security
nix-env -iA nixpkgs.trivy
nix-env -iA nixpkgs.trufflehog

# terraform
nix-env -iA nixpkgs.terraform
nix-env -iA nixpkgs.terraform-docs
nix-env -iA nixpkgs.terraformer
nix-env -iA nixpkgs.tflint
nix-env -iA nixpkgs.tfsec

# git
nix-env -iA nixpkgs.pre-commit
nix-env -iA nixpkgs.gh
nix-env -iA nixpkgs.git
nix-env -iA nixpkgs.delta
nix-env -iA nixpkgs.gitleaks

# python
nix-env -iA nixpkgs.black
nix-env -iA nixpkgs.pipenv

#         - pipx
#         - pyenv
#         - pyenv-virtualenv
#         - pyenv-which-ext

# shell
nix-env -iA nixpkgs.fish
nix-env -iA nixpkgs.starship

# k8s
nix-env -iA nixpkgs.helm
nix-env -iA nixpkgs.kubectl



#    ### ds & ml
#         - apache-spark


#       ### git
#         - git-xargs


#       ### golang
#         - golangci-lint

#       ### utilities
#         - aria2
#         - bat
#         - btop
#         - colordiff
#         - curl
#         - difftastic
#         - dog
#         - duf
#         - dust
#         - exa
#         - fd
#         - fx
#         - fzf
#         - glow
#         - gping
#         - graphviz
#         - htop
#         - httpie
#         - jq
#         - markdownlint-cli
#         - ncdu
#         - procs
#         - ripgrep
#         - rsync
#         - sops
#         - tere
#         - thefuck
#         - tldr
#         - tree
#         - watch
#         - wget
#         - yq
#         - yt-dlp
#       ### node
#         - node
#         - npm
#       ### misc
#         - awscli
#         - bitwarden-cli
#         - caddy
#         - geckodriver
#         - hugo
#         - java
#         - k6
#         - mas
#         - mpv
#         - neovim
#         - shellcheck
#         - docker-credential-helper-ecr
#         - shfmt
#         - task
#         - tmux

#       npm_packages:
#         - "@jaebradley/wakatime-cli"
#         - iponmap
#         - markdown-link-check

#       python_modules:
#         - nbpreview
#         - topydo
#         - topydo[columns]
#         - trufflehog
#         - pgcli
#         - pgcli[sshtunnel]
