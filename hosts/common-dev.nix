{ pkgs, ... }:
{
  imports = [
    ../programs/aws/aws.nix
    ../programs/git/git.nix
    ../programs/kitty/kitty.nix
    ../programs/pgconn/pgconn.nix
    ../programs/proxmox/proxmox.nix
    ../programs/timesheet/timesheet.nix
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

      # azure
      azure-cli

      # kubernetes
      kubernetes-helm
      k9s
      kubectl
      kubectx
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

      # monitoring
      #      sampler

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
      hugo
      sshx
      wakatime

      # utilities
      pop
      libqalculate
      tz
    ];
  };
}
