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
        unstable.google-cloud-sdk

        # containers
        ### docker
        unstable.ctop
        unstable.dive
        unstable.lazydocker

        ### k8s
        unstable.kubectl
        unstable.k9s
        unstable.kompose
        unstable.kubernetes-helm
        unstable.kube-capacity

        ### security
        unstable.grype
        unstable.syft
        unstable.trivy

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
        unstable.terraform-providers.aws
        unstable.terraform-providers.cloudflare
        unstable.terraform-providers.github
        unstable.terraform-providers.google
        unstable.terraform-providers.google-beta
        unstable.terraform-providers.sops
        unstable.terraform-providers.tfe
        unstable.terraform-providers.vault

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
