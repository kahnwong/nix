{ config, pkgs, ... }:

{
  home.username = "root";
  home.homeDirectory = "/root";

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs;
    let
      # Packages to always install.
      common = [
        # shell
        pkgs.fish
        pkgs.starship
        pkgs.tmux
        pkgs.bat
        pkgs.btop
        pkgs.duf
        pkgs.du-dust
        pkgs.exa
        pkgs.fd
        pkgs.fzf

        # networking
        pkgs.aria
        pkgs.curl
        pkgs.dogdns
        pkgs.gping

        # utilities
        pkgs.colordiff
        pkgs.difftastic
        pkgs.tldr
        pkgs.graphviz

        # git
        pkgs.delta
        pkgs.gh
        pkgs.git
        pkgs.gitleaks
        pkgs.pre-commit

        # docker
        pkgs.ctop
        pkgs.dive
        pkgs.lazydocker

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
        pkgs.nodePackages_latest.markdownlint-cli2
        pkgs.glow

        # json
        pkgs.fx

        # python
        pkgs.black
        pkgs.pipenv

        # golang
        pkgs.golangci-lint

        # data
        pkgs.visidata
        pkgs.sqlfluff
      ];

    in
    common; #++ (if config.services.xserver.enable then xorg else noxorg);


}
