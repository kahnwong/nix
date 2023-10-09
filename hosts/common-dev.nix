## these stay here until I get a dedicated dev box
## currently I also use my homelab as a dev box

{ pkgs, ... }:
{
  imports = [
    ../programs/aws/aws.nix
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
    "terraform"
  ];

  home = {
    packages = with pkgs; [
      # golang
      golangci-lint
      gopls

      # java
      temurin-bin
      gradle
      # maven

      # node
      nodejs
      nodePackages_latest.npm
      yarn

      # nix
      nixpkgs-fmt

      # python
      # gdal # for build env
      black
      pipenv
      poetry
      python310Packages.pipx
      ruff

      # markdown
      nodePackages_latest.markdownlint-cli
      nodePackages.markdown-link-check

      # shell - linters
      shellcheck
      shfmt

      # containers
      buildpack

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
      keyscope

      # api testing
      httpie
      hurl
      rustscan
      xh

      # terraform
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
    ];
  };
}
