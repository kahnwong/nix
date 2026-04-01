{ pkgs, pkgs-stable, ... }:

let
  programImports = [
    ../programs/aws/aws.nix
    ../programs/ghostty/ghostty.nix
    ../programs/git/git.nix
    ../programs/scripts/scripts.nix
    ../programs/terraform/terraform.nix
    ../programs/yt-dlp/yt-dlp.nix
    ../programs/zed/zed.nix

    # apps
    ../programs/book-summarizer/book-summarizer.nix
    ../programs/browsh/browsh.nix
    ../programs/media-discord-rpc/media-discord-rpc.nix
    ../programs/pgconn/pgconn.nix
    ../programs/proxmox/proxmox.nix
    ../programs/repo-switcher/repo-switcher.nix
    ../programs/totp/totp.nix
    ../programs/wallabag-tagger/wallabag-tagger.nix
  ];

  toolchainsAndLinters = with pkgs; [
    # android
    android-tools
    flutter
    # bash
    beautysh
    shellcheck
    shfmt
    # c
    uncrustify
    usort
    # golang
    golangci-lint
    gopls
    gotools
    goreleaser
    air
    # nix
    nix-search-cli
    nixfmt
    # python
    pixi
    nbstripout
    ruff
    # yaml
    yamlfmt
    yamllint
    # # zig
    # zig_0_13
    # misc
    hadolint
    sqruff
    typos
  ];

  cloudAndOps = with pkgs; [
    # # database
    # atlas
    # mongodb-tools
    sqlite
    # gcp
    google-cloud-sdk
    google-cloud-sql-proxy
    # kubernetes
    k9s
    krew
    ktop
    kube-capacity
    kubectl
    kubectx
    kubernetes-helm
    kubevirt
    # markdown
    markdown-link-check
    markdownlint-cli2
    mdsf
    mw
    rumdl
    # security
    grype
    syft
    trivy
    zizmor
  ];

  webAndTesting = with pkgs; [
    # networking
    caddy
    mitmproxy
    # tests
    hurl
    hyperfine
    k6
    oha
    # wasm
    wasmtime
  ];

  aiAndLlm = with pkgs; [
    llama-cpp
  ];

  misc = with pkgs; [
    beancount
    beanquery
    caligula
    charm-freeze
    f2
    fava
    imagemagick
    libqalculate
    numbat
    pastel
    pop
    tz
    wakatime-cli
    zola # use pkgs-stable.zola here if needed
  ];

in
{
  imports = programImports;

  programs.java = {
    enable = true;
    package = pkgs.temurin-bin;
  };

  home = {
    packages = toolchainsAndLinters ++ cloudAndOps ++ webAndTesting ++ aiAndLlm ++ misc;
  };
}
