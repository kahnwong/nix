{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs;
    [
      # nix
      unstable.nixpkgs-fmt

      # golang
      unstable.go
      unstable.golangci-lint

      # html
      unstable.htmlq

      # # java
      # temurin-bin
      # maven

      # json
      unstable.fx
      unstable.gron
      unstable.jq

      # markdown
      unstable.glow
      unstable.nodePackages_latest.markdownlint-cli
      unstable.nodePackages.markdown-link-check

      # node
      unstable.nodejs
      unstable.nodePackages_latest.npm
      unstable.yarn

      # rust
      unstable.cargo

      # python
      gdal # for build env
      unstable.black
      unstable.pipenv
      unstable.python310Packages.pipx
      unstable.ruff

      # shell - linters
      unstable.shellcheck
      unstable.shfmt

      # yaml
      unstable.yq-go
    ];
}
