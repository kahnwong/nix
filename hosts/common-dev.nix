{ pkgs, ... }: {
  imports = [
    ../programs/article-summarizer/article-summarizer.nix
    ../programs/aws/aws.nix
    ../programs/git/git.nix
    ../programs/kitty/kitty.nix
    ../programs/pgconn/pgconn.nix
    ../programs/proxmox/proxmox.nix
    ../programs/scripts/scripts.nix
    ../programs/terraform/terraform.nix
    ../programs/timesheet/timesheet.nix
    ../programs/topydo/topydo.nix
    ../programs/totp/totp.nix
    ../programs/yt-dlp/yt-dlp.nix
  ];

  home = {
    packages = with pkgs; [
      # ------- runtimes & toolchains ------- #
      # golang
      golangci-lint
      gopls
      gotools
      goreleaser
      air

      # node
      nodejs # so nvm can initialize

      # nix
      nixfmt-classic

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
      (google-cloud-sdk.withExtraComponents [
        google-cloud-sdk.components.gke-gcloud-auth-plugin
        # google-cloud-sdk.components.cloud_sql_proxy # this is outdated
      ])

      #      # azure
      #      azure-cli

      # kubernetes
      kubernetes-helm
      k9s
      kubectl
      kubectx
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
      #      postgresql_16
      pgcli
      #    mongodb-tools

      # monitoring
      #      sampler

      # ------- tools ------- #
      k6

      # # api testing
      # hurl
      # xh

      # data
      #      sqlfluff
      #      visidata

      # misc
      hugo
      silicon
      sshx
      wakatime

      # utilities
      pop
      libqalculate
      tz

      # finance
      beancount
      fava
    ];
  };
}
