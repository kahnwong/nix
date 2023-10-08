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
    ../misc.nix
    ../../programs/non-free.nix
    ../../programs/kitty/kitty.nix
  ];
  home.packages = with pkgs; [
    # backup
    rclone
    restic

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
  ];
}
