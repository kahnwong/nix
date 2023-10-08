## these stay here until I get a dedicated dev box
## currently I also use my homelab as a dev box

{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      # node
      nodejs
      nodePackages_latest.npm
      yarn

      # python
      # gdal # for build env
      black
      pipenv
      poetry
      python310Packages.pipx
      ruff

      # shell - linters
      shellcheck
      shfmt

      # containers
      buildpack

      # kubernetes
      k9s
      kubectl
      kubernetes-helm

      # database
      postgresql_15
      pgcli

      # secretops
      bitwarden-cli
      keyscope
      sops

      # api testing
      httpie
      hurl
      rustscan
      xh

      # terraform
      terraform

      ## tools
      terraform-docs
      terraformer
      infracost

      ## linters
      tfsec
      tflint

      # misc
      wakatime
    ];
  };
}
