{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs;
    let
      common = [
        # backup
        unstable.rclone
        unstable.restic
        unstable.rsync

        # cloud
        unstable.google-cloud-sdk
        unstable.docker-credential-gcr

        # containers
        ### docker
        unstable.ctop
        unstable.dive
        unstable.lazydocker
        unstable.trivy

        ### k8s
        unstable.kubectl
        unstable.k9s
        unstable.kompose
        unstable.kubernetes-helm

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
        unstable.gping
        unstable.httpie
        unstable.rustscan
        unstable.speedtest-cli

        # secretops
        unstable.bitwarden-cli
        unstable.keyscope
      ];

      linux_only = [
      ];

      mac_only = [
        unstable.caddy # on linux it requires extra configs to enable systemd
      ];
    in
    common ++ (if stdenv.isLinux then linux_only else mac_only);
}
