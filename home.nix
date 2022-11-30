{ config, pkgs, ... }:

{
  home.username = "root";
  home.homeDirectory = "/root";

  home.stateVersion = "22.05";

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;

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
        pkgs.helm
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
        pkgs.spark
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
    in
    common; #++ (if config.services.xserver.enable then xorg else noxorg);
}
