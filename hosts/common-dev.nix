{ pkgs, ... }:
{
  imports = [
    ../programs/aws/aws.nix
    ../programs/kitty/kitty.nix
    ../programs/pgconn/pgconn.nix
    ../programs/proxmox/proxmox.nix
    ../programs/scripts/scripts.nix
    ../programs/topydo/topydo.nix
    ../programs/totp/totp.nix
    ../programs/yt-dlp/yt-dlp.nix
  ];

  home = {
    packages = with pkgs; [
      # ------- runtime ------- #
      # golang
      golangci-lint
      gopls
      gotools

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
      ruff

      # rust
      rustup

      # shell - linters
      shellcheck
      shfmt

      # ------- devops ------- #
      # gcp
      docker-credential-gcr
      (
        google-cloud-sdk.withExtraComponents [
          google-cloud-sdk.components.gke-gcloud-auth-plugin
          # google-cloud-sdk.components.cloud_sql_proxy # this is outdated
        ]
      )

      # kubernetes
      kubernetes-helm
      #      kompose
      #      argocd
      #      helm-dashboard
      #      k3d
      #      kdash
      #      kind
      #      pluto

      ## krew
      krew
      ktop
      kube-capacity

      # database
      postgresql_16
      pgcli
      #    mongodb-tools

      ## security
      #      grype
      #      syft
      trivy

      # terraform
      terraform # non-free
      opentofu

      ## tools
      terraform-docs
      # terraformer
      infracost

      # docs
      #    d2
      graphviz
      silicon
      #      charm-freeze
      #    slides
      vhs

      # networking
      rustscan

      # ------- tools ------- #
      nodePackages.markdown-link-check
      bitwarden-cli

      # # api testing
      # httpie
      # hurl
      # xh

      # data
      #      sqlfluff
      visidata

      # misc
      wakatime
      sshx

      # utilities
      pop
    ];
  };
}
