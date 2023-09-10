{ config, pkgs, lib, ... }:
let
  extraGolangPackages = import ./pkgs/golang.nix;
in

{
  imports = [
    ./tools/awscli.nix
    ./tools/sops.nix
  ];

  home.packages = with pkgs;
    let
      common = [
        # # backup
        # unstable.rclone
        # unstable.restic
        unstable.rsync

        # cloud
        extraGolangPackages.cloud-sql-proxy
        unstable.docker-credential-gcr
        (
          google-cloud-sdk.withExtraComponents [
            google-cloud-sdk.components.gke-gcloud-auth-plugin
            # google-cloud-sdk.components.cloud_sql_proxy # this is outdated
          ]
        )

        # docker
        ## docker
        unstable.ctop
        unstable.dive
        unstable.lazydocker

        # k8s
        # unstable.kompose
        unstable.helm-dashboard
        unstable.k3d
        unstable.k9s
        unstable.kdash
        unstable.kind
        unstable.kubectl
        unstable.kubernetes-helm
        unstable.pluto

        ## krew
        unstable.krew
        unstable.ktop
        unstable.kube-capacity
        unstable.kubectx

        ## security
        unstable.grype
        unstable.syft
        unstable.trivy

        # database
        unstable.postgresql
        unstable.pgcli
        unstable.mongodb-tools

        # docs
        unstable.d2
        unstable.graphviz
        unstable.silicon
        unstable.slides
        unstable.vhs

        # load testing
        unstable.k6

        # networking
        unstable.curl
        unstable.dogdns
        gping
        unstable.httpie
        unstable.rustscan
        unstable.speedtest-cli

        # secretops
        unstable.bitwarden-cli
        unstable.keyscope

        # terraform
        unstable.terraform

        ## tools
        unstable.terraform-docs
        unstable.terraformer
        unstable.infracost

        ## linters
        unstable.tfsec
        unstable.tflint

        # misc
        unstable.entr
      ];

      linux_only = [
      ];

      mac_only = [
        unstable.caddy # on linux it requires extra configs to enable systemd
      ];
    in
    common ++ (if stdenv.isLinux then linux_only else mac_only);
}
