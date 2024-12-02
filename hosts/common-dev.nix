{ pkgs, ... }: {
  imports = [
    ../programs/aws/aws.nix
    ../programs/git/git.nix
    ../programs/kitty/kitty.nix
    ../programs/pgconn/pgconn.nix
    ../programs/proxmox/proxmox.nix
    ../programs/scripts/scripts.nix
    ../programs/terraform/terraform.nix
    ../programs/yt-dlp/yt-dlp.nix

    # apps
    ../programs/article-summarizer/article-summarizer.nix
    ../programs/topydo/topydo.nix
    ../programs/totp/totp.nix
  ];

  home = {
    packages = with pkgs; [
      # -------- runtimes & toolchains & linters --------
      # ---- golang ----
      golangci-lint
      gopls
      gotools
      goreleaser
      air

      # ---- node ----
      fnm

      # ---- nix ----
      nixfmt-classic

      # ---- python ----
      # gdal # for build env
      ruff
      pylyzer

      # ---- rust ----
      rustup

      # ---- shell - linters ----
      shellcheck
      shfmt

      # ---- wasm ----
      wasmtime

      # ---- yaml ----
      yamlfmt
      yamllint

      # ---- markdown ----
      markdownlint-cli2

      # ---- docker ----
      hadolint

      # ---- security ----
      trivy

      # -------- others --------
      # gcp
      docker-credential-gcr
      (google-cloud-sdk.withExtraComponents [
        google-cloud-sdk.components.gke-gcloud-auth-plugin
        # google-cloud-sdk.components.cloud_sql_proxy # this is outdated
      ])

      # ---- database ----
      pgcli

      # ---- kubernetes ----
      k9s
      kubectl
      kubectx

      # ---- api testing ----
      hurl
      k6

      # ---- data ----
      sqruff
      #      visidata

      # ---- misc ----
      #      sshx
      wakatime

      # -- finance --
      beancount
      fava

      # -- utils --
      hyperfine
      libqalculate
      tz
    ];
  };
}
