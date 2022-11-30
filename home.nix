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
        pkgs.fish
        pkgs.starship
        pkgs.tmux

        # build env
        pkgs.openssl
        pkgs.zlib
        pkgs.readline

        # downloaders
        pkgs.yt-dlp
        pkgs.aria
        pkgs.wget

        # networking
        pkgs.curl
        pkgs.dogdns
        pkgs.gping
        pkgs.httpie

        # utilities
        pkgs.bat
        pkgs.btop
        pkgs.colordiff
        pkgs.difftastic
        pkgs.du-dust
        pkgs.duf
        pkgs.exa
        pkgs.fd
        pkgs.fzf
        pkgs.graphviz
        pkgs.htop
        pkgs.ncdu
        pkgs.procs
        pkgs.ripgrep
        pkgs.rsync
        pkgs.sops
        pkgs.tere
        pkgs.thefuck
        pkgs.tldr
        pkgs.tree
        pkgs.watch

        # git
        pkgs.delta
        pkgs.gh
        pkgs.git
        pkgs.gitleaks
        pkgs.pre-commit
        pkgs.trufflehog

        # docker
        pkgs.ctop
        pkgs.dive
        pkgs.lazydocker
        pkgs.trivy

        # k8s
        pkgs.kubectl

        # terraform
        pkgs.terraform
        pkgs.terraform-docs
        pkgs.terraformer
        pkgs.tflint
        pkgs.tfsec

        # nix
        pkgs.nixpkgs-fmt

        # shell - linters
        pkgs.shellcheck
        pkgs.shfmt

        # markdown
        pkgs.glow
        pkgs.nodePackages_latest.markdownlint-cli2
        pkgs.nodePackages.markdown-link-check

        # json
        pkgs.fx
        pkgs.jq

        # yaml
        pkgs.yq

        # python
        pkgs.black
        pkgs.pipenv
        pkgs.python310Packages.pipx

        # golang
        pkgs.golangci-lint

        # java
        pkgs.jdk

        # node
        pkgs.nodejs
        pkgs.nodePackages_latest.npm

        # data
        pkgs.visidata
        pkgs.sqlfluff
        # pkgs.spark
        # pkgs.python310Packages.pyspark

        # postgres
        pkgs.pgcli

        # applications
        pkgs.bitwarden-cli
        pkgs.caddy
        pkgs.hugo
        pkgs.k6
        pkgs.neovim
        pkgs.topydo

        # aws
        pkgs.awscli2

        # gcp
        pkgs.google-cloud-sdk
        pkgs.docker-credential-gcr

        # vscode
        pkgs.vscode
      ];

      linux_only = [
        pkgs.helm
      ];

      mac_only = [
      ];
    in
    common ++ (if pkgs.system != "aarch64-darwin" then linux_only else mac_only);
}
