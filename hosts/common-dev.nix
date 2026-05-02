{ pkgs, pkgs-stable, ... }:

let
  gotoolsCustom = pkgs.symlinkJoin {
    name = "gotools-custom";
    paths = [ pkgs.gotools ];
    postBuild = "rm -f $out/bin/modernize";
  };

  programImports = [
    ../programs/aws/aws.nix
    ../programs/ghostty/ghostty.nix
    ../programs/git/git.nix
    ../programs/scripts/scripts.nix
    ../programs/terraform/terraform.nix
    ../programs/yt-dlp/yt-dlp.nix
    ../programs/zed/zed.nix

    # utils
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
    # ---- android ----
    android-tools
    flutter
    # ---- bash ----
    beautysh
    shellcheck
    shfmt
    # ---- c ----
    uncrustify
    usort
    # ---- golang ----
    golangci-lint
    gopls
    goreleaser
    gotoolsCustom
    air
    # ---- nix ----
    nix-search-cli
    nixfmt
    # ---- python ----
    pixi
    nbstripout
    ruff
    # ---- yaml ----
    yamlfmt
    yamllint
    # ---- zig ----
    # zig_0_13
    # ---- misc ----
    distrobox
    hadolint
    sqruff
    typos
  ];

  cloudAndOps = with pkgs; [
    # ---- database ----
    #atlas
    #mongodb-tools
    pkgs-stable.pgcli
    sqlite
    # ---- gcp ----
    google-cloud-sdk
    google-cloud-sql-proxy
    # ---- kubernetes ----
    helmfile
    k9s
    krew
    ktop
    kube-capacity
    kubectl
    kubectx
    kubernetes-helm
    kubevirt
    # ---- markdown ----
    markdown-link-check
    markdownlint-cli2
    mdsf
    mw
    rumdl
    # ---- security ----
    # grype
    osv-scanner
    syft
    zizmor
  ];

  webAndTesting = with pkgs; [
    # ---- networking ----
    caddy
    doggo
    dumbpipe
    gping
    mitmproxy
    rustscan
    sendme
    somo
    sshx
    whois
    # ---- tests ----
    hurl
    hyperfine
    k6
    oha
    # ---- wasm ----
    wasmtime
  ];

  dataManipulation = with pkgs; [
    fx
    glow
    jnv
    jq
    visidata
    yq-go
  ];

  utils = with pkgs; [
    caligula
    charm-freeze
    cpx
    difftastic
    f2
    fzf
    imagemagick
    libqalculate
    mcfly
    numbat
    pastel
    pop
    restic
    rsync
    tldr
    tz
    wakatime-cli
  ];

  misc = with pkgs; [
    beancount
    beanquery
    fava
    llama-cpp
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
    packages =
      toolchainsAndLinters ++ cloudAndOps ++ webAndTesting ++ dataManipulation ++ utils ++ misc;
  };
}
