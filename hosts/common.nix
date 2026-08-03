{ pkgs, ... }:

let
  programImports = [
    ../programs/browsh/browsh.nix
    ../programs/ghostty/ghostty.nix
    ../programs/git/git.nix
    ../programs/sampler/sampler.nix
    ../programs/starship/starship.nix
    ../programs/yt-dlp/yt-dlp.nix
    ../programs/zellij/zellij.nix
  ];

  cli = with pkgs; [
    bat
    curl
    eza
    fd
    gnutar
    neovim
    ripgrep
    sd
    # tailspin
    tere
    tree
    unzip
    zoxide
  ];

  monitoring = with pkgs; [
    bandwhich
    gping
    htop
    procs
    viddy
    watch
    zenith
  ];

  disk = with pkgs; [
    diskus
    dua
    duf
    dust
    ncdu
  ];

  fetch = with pkgs; [
    cpufetch
    fastfetch
    onefetch
  ];

  containers = with pkgs; [
    dive
    lazydocker
    oxker
  ];

  downloaders = with pkgs; [
    aria2
    wget
    yt-dlp
  ];

  security = with pkgs; [
    age
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
    packages = cli ++ monitoring ++ disk ++ fetch ++ containers ++ downloaders ++ security ++ linuxOnly;
  };
}
