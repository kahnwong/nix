{ pkgs, ... }:
let
  nixFlakes = (pkgs.writeScriptBin "nixFlakes" ''
    exec ${pkgs.nixUnstable}/bin/nix --experimental-features "nix-command flakes" "$@"
  '');
in
{
  imports = [
    ../common.nix
    ../common-dev.nix
    ../../programs/non-free.nix
    ../../programs/kitty/kitty.nix
  ];
  home.packages = with pkgs; [
    # golang
    golangci-lint
    gopls

    # # html
    # htmlq

    # java
    temurin-bin
    gradle
    # maven

    # json
    gron

    # markdown
    nodePackages_latest.markdownlint-cli
    nodePackages.markdown-link-check

    # nix
    nixpkgs-fmt
    # extraGolangPackages.nix-search-cli

    # # rust
    # cargo

    ################################################################
    # backup
    rclone
    restic

    # data
    sqlfluff
    visidata

    # devops
    docker-credential-gcr
    (
      google-cloud-sdk.withExtraComponents [
        google-cloud-sdk.components.gke-gcloud-auth-plugin
        # google-cloud-sdk.components.cloud_sql_proxy # this is outdated
      ]
    )

    # k8s
    # kompose
    argocd
    helm-dashboard
    k3d
    kdash
    kind
    pluto

    ## krew
    krew
    ktop
    kube-capacity
    kubectx

    ## security
    grype
    syft
    trivy

    # database
    mongodb-tools

    # docs
    d2
    graphviz
    silicon
    slides
    vhs

    # misc
    caddy
    hugo
  ];
}
