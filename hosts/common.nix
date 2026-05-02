{ pkgs, ... }:

let
  programImports = [
    ../programs/sampler/sampler.nix
    ../programs/starship/starship.nix
    ../programs/zellij/zellij.nix
  ];

  base = with pkgs; [
    bat
    curl
    eza
    fd
    neovim
    ripgrep
    sd
    tailspin
    tere
    tree
    viddy
    watch
    zoxide
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
    postgresql_18
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
  ];

  linuxOnly =
    with pkgs;
    if stdenv.isLinux then
      [
        iotop
        progress
      ]
    else
      [ ];

in
{
  imports = programImports;

  home = {
    stateVersion = "25.11";
    packages =
      base ++ system ++ fetch ++ containers ++ database ++ downloader ++ toolchains ++ utils ++ linuxOnly;
  };
}
