{ config, pkgs, ... }:

{
  home.username = "$USER"; # change me
  home.homeDirectory = "/home/$USER"; # change me: linux version
  # home.homeDirectory = "/Users/$USER"; # change me: mac version

  home.stateVersion = "22.05";

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
  # programs.fish.enable = true;
  # programs.vscode.enable = true;

  # configurations
  home.file.".config/fish/config.fish".source = ./dotfiles/.config/fish/config.fish;
  home.file.".config/fish/conf.d/work.fish".source = ./dotfiles/.config/fish/conf.d/work.fish;
  home.file.".config/fish/functions/fuck.fish".source = ./dotfiles/.config/fish/functions/fuck.fish;
  home.file.".config/fish/functions/pip.fish".source = ./dotfiles/.config/fish/functions/pip.fish;
  home.file.".config/fish/conf.d/00_fig_pre.fish".source = ./dotfiles/.config/fish/conf.d/00_fig_pre.fish;
  home.file.".config/fish/conf.d/99_fig_post.fish".source = ./dotfiles/.config/fish/conf.d/99_fig_post.fish;

  home.file.".config/starship.toml".source = ./dotfiles/.config/starship.toml;

  home.file.".topydo".source = ./dotfiles/.topydo;
  home.file.".topydo_columns ".source = ./dotfiles/.topydo_columns;

  home.file.".wakatime.cfg".source = ./dotfiles/.wakatime.cfg;

  home.file.".config/nvim/init.vim".source = ./dotfiles/.config/nvim/init.vim;

  home.file.".ssh/config".source = ./dotfiles/.ssh/config;

  home.file.".aws/config".source = ./dotfiles/.aws/config;
  home.file.".aws/credentials".source = ./dotfiles/.aws/credentials;

  home.file.".pyenv/version".source = ./dotfiles/.pyenv/version;

  home.packages = with pkgs;
    let
      # Packages to always install.
      common = [
        # shell
        fish
        starship
        tmux

        # build env
        openssl
        zlib
        readline

        # downloaders
        yt-dlp
        aria
        wget

        # networking
        curl
        dogdns
        gping
        httpie

        # utilities
        bat
        btop
        colordiff
        difftastic
        du-dust
        duf
        exa
        fd
        fzf
        graphviz
        htop
        ncdu
        procs
        ripgrep
        rsync
        sops
        tere
        thefuck
        tldr
        tree
        watch

        # git
        delta
        gh
        git
        gitleaks
        pre-commit
        trufflehog

        # docker
        ctop
        dive
        lazydocker
        trivy

        # k8s
        kubectl

        # terraform
        terraform
        terraform-docs
        terraformer
        tflint
        tfsec

        # nix
        nixpkgs-fmt

        # shell - linters
        shellcheck
        shfmt

        # markdown
        glow
        nodePackages_latest.markdownlint-cli2
        nodePackages.markdown-link-check

        # json
        fx
        jq

        # yaml
        yq

        # python
        black
        pipenv
        python310Packages.pipx

        # golang
        go
        golangci-lint

        # java
        jdk

        # node
        nodejs
        nodePackages_latest.npm

        # data
        visidata
        sqlfluff
        # spark
        # python310Packages.pyspark

        # postgres
        pgcli

        # applications
        bitwarden-cli
        caddy
        hugo
        k6
        neovim
        topydo

        # aws
        awscli2

        # gcp
        google-cloud-sdk
        docker-credential-gcr
      ];

      linux_only = [
        helm
        vscode
      ];

      mac_only = [
        mpv
      ];
    in
    common ++ (if system != "aarch64-darwin" then linux_only else mac_only);
}
