{ pkgs, ... }: {
  imports = [
    ../programs/aws/aws.nix
    ../programs/erp/erp.nix
    ../programs/ghostty/ghostty.nix
    ../programs/git/git.nix
    # ../programs/kitty/kitty.nix
    ../programs/pgconn/pgconn.nix
    ../programs/proxmox/proxmox.nix
    ../programs/scripts/scripts.nix
    ../programs/terraform/terraform.nix
    ../programs/yt-dlp/yt-dlp.nix

    # apps
    ../programs/article-summarizer/article-summarizer.nix
    ../programs/book-summarizer/book-summarizer.nix
    ../programs/topydo/topydo.nix
    ../programs/totp/totp.nix
    ../programs/wallabag-tagger/wallabag-tagger.nix
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
      yarn

      # ---- nix ----
      nixfmt-classic

      # ---- python ----
      # gdal # for build env
      pixi
      pylyzer
      ruff

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
      zizmor

      # -------- others --------
      # ---- database ----
      atlas
      pgcli

      # ---- kubernetes ----
      kubernetes-helm
      k9s
      kubectl
      kubectx

      # ---- api testing ----
      hurl
      k6

      # ---- data ----
      sqruff
      visidata

      # ---- misc ----
      #      sshx
      wakatime

      # -- utils --
      ffsend
      hyperfine
      libqalculate
      pop
      silicon
      tz

      # blogging
      zola

      # finance
      fava
    ];
  };
}
