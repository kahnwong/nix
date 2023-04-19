{ config, pkgs, lib, ... }:

{
  home.username = builtins.getEnv "username";

  # linux: `/home/$username`
  # mac: `/Users/$username`
  home.homeDirectory = builtins.getEnv "home_directory";

  home.stateVersion = "22.11";

  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      unstable = import <unstable> {
        config = config.nixpkgs.config;
      };
    };
  };


  programs.home-manager.enable = true;
  # services.home-manager.autoUpgrade.enable = true;

  manual.manpages.enable = false;

  ### imports
  imports = [
    ./nix/fish.nix
    ./nix/fonts.nix
    ./nix/git.nix
    ./nix/kitty.nix
    ./nix/nvim.nix
    ./nix/topydo.nix
    ./nix/wakatime.nix
  ];

  ### configurations
  home.file.".aws/config".source = ./dotfiles/.aws/config;
  home.file.".aws/credentials".source = ./dotfiles/.aws/credentials;
  home.file.".config/sops/age/keys.txt".source = ./dotfiles/.config/sops/age/keys.txt;
  home.file.".config/starship.toml".source = ./dotfiles/.config/starship.toml;
  home.file.".config/yt-dlp/config".source = ./dotfiles/yt-dlp.conf;
  home.file.".ssh/config".source = ./dotfiles/.ssh/config;

  home.packages = with pkgs;
    let
      # Packages to always install.
      common = [
        # shell
        unstable.bat
        unstable.broot
        unstable.colordiff
        unstable.difftastic
        unstable.du-dust
        unstable.duf
        unstable.exa
        unstable.fd
        unstable.fzf
        ncdu
        unstable.procs
        unstable.ripgrep
        unstable.starship
        unstable.tere
        unstable.thefuck
        unstable.tldr
        unstable.tmux
        unstable.tree
        unstable.watch

        # build env
        gdal

        # downloaders
        unstable.aria
        unstable.wget
        unstable.yt-dlp

        # networking
        unstable.curl
        unstable.dogdns
        unstable.gping
        unstable.httpie
        unstable.rustscan
        unstable.speedtest-cli

        # utilities
        unstable.btop
        unstable.cbonsai
        unstable.ffmpeg
        unstable.graphviz
        unstable.htop
        # instaloader
        unstable.libqalculate
        # rclone
        # restic
        unstable.rsync
        unstable.silicon
        unstable.slides

        # fetch
        unstable.neofetch
        unstable.onefetch

        # docker
        unstable.ctop
        unstable.dive
        unstable.lazydocker
        unstable.trivy

        # k8s
        unstable.kubectl
        unstable.k9s
        unstable.kompose

        # terraform
        unstable.terraform
        unstable.terraform-docs
        unstable.terraformer
        unstable.tflint
        unstable.tfsec
        unstable.infracost

        # nix
        unstable.nixpkgs-fmt

        # shell - linters
        unstable.shellcheck
        unstable.shfmt

        # markdown
        unstable.glow
        unstable.nodePackages_latest.markdownlint-cli
        unstable.nodePackages.markdown-link-check

        # json
        unstable.fx
        unstable.gron
        unstable.jq

        # yaml
        unstable.yq

        # html
        unstable.htmlq

        # python
        unstable.black
        unstable.pipenv
        unstable.python310Packages.pipx
        unstable.ruff

        # golang
        unstable.go
        unstable.golangci-lint

        # # java
        # temurin-bin
        # maven

        # node
        unstable.nodejs
        unstable.nodePackages_latest.npm
        unstable.yarn

        # data
        unstable.visidata
        unstable.sqlfluff

        # database
        unstable.pgcli
        unstable.mongodb-tools

        # applications
        unstable.beancount
        unstable.bitwarden-cli
        unstable.fava
        unstable.hugo
        unstable.wakatime

        # cloud
        unstable.awscli2
        unstable.google-cloud-sdk
        unstable.docker-credential-gcr

        # devops
        unstable.d2
        unstable.k6
        unstable.keyscope
        unstable.sops
        # unstable.steampipe
        unstable.vhs
      ];

      linux_only = [
        helm # doesn't work on aarch64-darwin
        # docker
        # docker-compose

        # system
        # fuse
        iotop
        progress
      ];

      mac_only = [
        unstable.caddy # on linux it requires extra configs to enable systemd
      ];
    in
    common ++ (if stdenv.isLinux then linux_only else mac_only);
}
