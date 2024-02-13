## these stay here until I get a dedicated dev box
## currently I also use my homelab as a dev box

{ pkgs, ... }:
{
  imports = [
    ../programs/aws/aws.nix
    ../programs/git/git.nix
    ../programs/kitty/kitty.nix
    ../programs/scripts/scripts.nix
  ];

  home = {
    packages = with pkgs; [
      # golang
      golangci-lint
      gopls

      # java
      temurin-bin
      ## gradle
      ## maven

      # node
      nodejs # so nvm can initialize

      # nix
      nixpkgs-fmt

      # python
      # gdal # for build env
      black
      mypy
      pipenv
      pipx
      poetry
      poetryPlugins.poetry-plugin-export
      poetryPlugins.poetry-plugin-up
      ruff

      #      # rust
      #      rustup

      # markdown
      nodePackages.markdown-link-check

      # shell - linters
      shellcheck
      shfmt

      #      # containers
      #      buildpack

      # kubernetes
      k9s
      kubectl
      kubernetes-helm
      kubectx

      # database
      postgresql_15
      pgcli

      # secretops
      bitwarden-cli
      #      keyscope

      # api testing
      httpie
      #      hurl
      rustscan
      #      xh

      # terraform
      terraform # non-free
      opentofu

      ## tools
      terraform-docs
      terraformer
      infracost

      ## linters
      tfsec
      tflint

      # data
      sqlfluff
      visidata

      # misc
      hugo
      libqalculate
      tz
      wakatime
      sshx
    ];
  };
}
