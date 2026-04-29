{ pkgs, pkgs-stable, ... }:

let
  programImports = [
    ../programs/nvim/nvim.nix
    ../programs/sampler/sampler.nix
    ../programs/starship/starship.nix
    ../programs/zellij/zellij.nix
  ];

  base = with pkgs; [
    bat
    cpx
    difftastic
    eza
    fd
    fzf
    mcfly
    ripgrep
    sd
    tailspin
    tere
    tree
    viddy
    watch
    zoxide
  ];

  backup = with pkgs; [
    # rclone
    restic
    rsync
  ];

  networking = with pkgs; [
    curl
    doggo
    dumbpipe
    gping
    rustscan
    sendme
    somo
    whois
  ];

  system = with pkgs; [
    bandwhich
    diskus
    dua
    duf
    dust
    htop
    ncdu
    procs
    sampler
    zenith
  ];

  fetch = with pkgs; [
    cpufetch
    fastfetch
    onefetch
  ];

  containers = with pkgs; [
    ctop
    lazydocker
    oxker
  ];

  database = with pkgs; [
    pkgs-stable.pgcli
    postgresql_18
  ];

  dataManipulation = with pkgs; [
    fx
    glow
    jnv
    jq
    visidata
    yq-go
  ];

  downloader = with pkgs; [
    aria2
    wget
  ];

  toolchains = with pkgs; [
    go
    mise
    rustup
    uv
    yarn
  ];

  utils = with pkgs; [
    age
    direnv
    entr
    mcat
    sops
    sshx
    tldr
  ];

in
{
  imports = programImports;

  home = {
    stateVersion = "26.05";

    packages =
      base
      ++ backup
      ++ networking
      ++ system
      ++ fetch
      ++ containers
      ++ database
      ++ dataManipulation
      ++ downloader
      ++ toolchains
      ++ utils;
  };
}
