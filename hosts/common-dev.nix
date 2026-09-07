{ pkgs, pkgs-stable, ... }:

let
  programImports = [
    ../programs/aws/aws.nix
    ../programs/scripts/scripts.nix
    ../programs/terraform/terraform.nix
    ../programs/yt-dlp/yt-dlp.nix
    ../programs/zed/zed.nix

    # custom programs
    ../programs/pgconn/pgconn.nix
    ../programs/repo-switcher/repo-switcher.nix
  ];

  fonts = with pkgs; [
    meslo-lgs-nf
  ];

  android =
    with pkgs;
    (lib.optionals (stdenv.hostPlatform.system != "aarch64-linux") [ android-cli ])
    ++ [
      android-tools
      # flutter
    ];

  bash = with pkgs; [
    # beautysh
    shellcheck
    shfmt
  ];

  c = with pkgs; [
    # uncrustify
    # usort
  ];

  golang = with pkgs; [
    air
    go
    golangci-lint
    gopls
    goreleaser
    gotools
  ];

  nix = with pkgs; [
    deadnix
    nix-search-cli
    nixfmt
    statix
  ];

  node = with pkgs; [
    yarn
  ];

  python = with pkgs; [
    nbstripout
    pixi
    ruff
  ];

  yaml = with pkgs; [
    yamlfmt
    yamllint
  ];

  wasm = with pkgs; [
    wasmtime
  ];

  zig_group = with pkgs; [
    zig
  ];

  containerTools = with pkgs; [
    distrobox
    hadolint
  ];

  formattersAndLinters = with pkgs; [
    oxfmt
    sqruff
    typos
  ];

  database = with pkgs; [
    # atlas
    # mongodb-tools
    pkgs-stable.pgcli
    postgresql_18
    sqlite
  ];

  gcp = with pkgs; [
    google-cloud-sdk
    # google-cloud-sql-proxy
  ];

  kubernetes = with pkgs; [
    argocd
    k9s
    krew
    kubectl
    kubernetes-helm
  ];

  markdown = with pkgs; [
    markdown-link-check
    markdownlint-cli2
    mdsf
    mw
    rumdl
  ];

  networking = with pkgs; [
    # dumbpipe
    # sendme
    caddy
    doggo
    mitmproxy
    rustnet
    rustscan
    somo
    sshx
    whois
  ];

  security = with pkgs; [
    osv-scanner
    syft
    zizmor
  ];

  tests = with pkgs; [
    hurl
    hyperfine
    k6
    oha
  ];

  devops = with pkgs; [
    ansible
  ];

  dataManipulation = with pkgs; [
    fx
    glow
    jnv
    jq
    visidata
    yq-go
  ];

  devUtils = with pkgs; [
    direnv
    entr
    pastel
  ];

  fileUtils = with pkgs; [
    cpx
    difftastic
    f2
    mcat
    restic
    rsync
  ];

  cliUtils = with pkgs; [
    caligula
    charm-freeze
    ffmpeg
    fzf
    imagemagick
    libqalculate
    magika-cli
    mcfly
    numbat
    pop
    tldr
    tz
  ];

  misc = with pkgs; [
    beancount
    beanquery
    fava
    wakatime-cli
    zola # use pkgs-stable.zola here if needed
  ];

in
{
  imports = programImports;

  fonts.fontconfig.enable = true;

  programs.java = {
    enable = true;
    package = pkgs.temurin-bin;
  };

  programs.mise = {
    enable = true;

    globalConfig = {
      tools = {
        # needs to exec shell to activate target Go version, this behavior doesn't happen in global Go
        # "go" = "latest";
        "nodejs" = "24";
        "opentofu" = "latest";
        "rust" = "latest";
        "terraform" = "latest";
        "uv" = "latest";
      };
    };
  };

  home = {
    packages =
      fonts
      ++ android
      ++ bash
      ++ c
      ++ golang
      ++ nix
      ++ node
      ++ python
      ++ yaml
      ++ wasm
      ++ zig_group
      ++ containerTools
      ++ formattersAndLinters
      ++ database
      ++ gcp
      ++ kubernetes
      ++ markdown
      ++ networking
      ++ security
      ++ tests
      ++ devops
      ++ dataManipulation
      ++ devUtils
      ++ fileUtils
      ++ cliUtils
      ++ misc;
  };
}
