{ pkgs, ... }: {
  imports = [
    ../programs/aws/aws.nix
    ../programs/ghostty/ghostty.nix
    ../programs/git/git.nix
    ../programs/scripts/scripts.nix
    ../programs/terraform/terraform.nix
    ../programs/yt-dlp/yt-dlp.nix
    ../programs/zed/zed.nix

    # apps
    ../programs/article-summarizer/article-summarizer.nix
    ../programs/book-summarizer/book-summarizer.nix
    ../programs/browsh/browsh.nix
    ../programs/erp/erp.nix
    ../programs/habit-tracker/habit-tracker.nix
    ../programs/media-discord-rpc/media-discord-rpc.nix
    ../programs/mods/mods.nix
    ../programs/pgconn/pgconn.nix
    ../programs/proxmox/proxmox.nix
    ../programs/topydo/topydo.nix
    ../programs/totp/totp.nix
    ../programs/umamit/umamit.nix
    ../programs/wallabag-tagger/wallabag-tagger.nix
  ];

  programs.java = {
    enable = true;
    package = pkgs.temurin-bin;
  };

  home = {
    packages = with pkgs; [
      # -------- runtimes & toolchains & linters --------
      # ---- bash ----
      beautysh
      shellcheck
      shfmt

      # ---- c ----
      uncrustify
      usort

      # # ---- gleam ----
      # gleam
      # erlang
      # rebar3

      # ---- golang ----
      golangci-lint
      gopls
      gotools
      goreleaser
      air

      # ---- java ----
      # gradle
      # maven

      # ---- nix ----
      nix-search-cli
      nixfmt-classic

      # ---- node ----
      # prettier

      # ---- python ----
      pixi
      nbstripout
      ruff

      # ---- yaml ----
      yamlfmt
      yamllint

      # ---- zig ----
      zig_0_13
      # zls
      # zlint

      # -------- others --------
      # # ---- azure ----
      # azure-cli

      # ---- data ----
      sqruff

      # ---- database ----
      atlas
      mongodb-tools
      sqlite

      # ---- docker ----
      hadolint

      # ---- gcp ----
      google-cloud-sdk
      google-cloud-sql-proxy
      # docker-credential-gcr
      # (google-cloud-sdk.withExtraComponents [
      #   google-cloud-sdk.components.gke-gcloud-auth-plugin
      # ])

      # ---- kubernetes ----
      k9s
      krew
      ktop
      kube-capacity
      kubectl
      kubectx
      kubernetes-helm
      kubevirt
      # argocd
      # helm-dashboard
      # kind
      # pluto

      # ---- markdown ----
      markdown-link-check
      markdownlint-cli2
      mdsf
      mw
      rumdl

      # ---- security ----
      grype
      syft
      trivy
      zizmor

      # ---- networking ----
      mitmproxy

      # ---- tests ----
      hurl
      hyperfine
      k6
      oha

      # ---- wasm ----
      wasmtime

      # ---- llm ----
      gemini-cli
      llama-cpp
      mods

      # ---- misc ----
      # atuin
      # graphviz
      ast-grep
      beancount
      beanquery
      caddy
      caligula
      charm-freeze
      f2
      fava
      libqalculate
      pop
      tz
      wakatime
      zola
      # vhs
    ];
  };
}
