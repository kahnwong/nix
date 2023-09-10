{ config, pkgs, lib, ... }:
let
  extraGolangPackages = import ./pkgs/golang.nix;
in
{
  imports = [
    ./tools/fish.nix
    ./tools/git.nix
    ./tools/nvim.nix
    ./tools/ssh.nix
    ./tools/starship.nix
    ./tools/wakatime.nix
    ./tools/yt-dlp.nix
    ./tools/zellij.nix
  ];

  home.packages = with pkgs;
    let
      common = [
        unstable.bat
        unstable.broot
        unstable.btop
        unstable.colordiff
        unstable.difftastic
        unstable.du-dust
        unstable.duf
        unstable.eza
        unstable.fd
        unstable.fzf
        unstable.htop
        unstable.ncdu
        unstable.procs
        unstable.ripgrep
        tere
        unstable.thefuck
        unstable.tldr
        unstable.tmux
        unstable.tree
        unstable.viddy
        unstable.watch

        # downloaders
        unstable.aria
        unstable.wget
        unstable.yt-dlp

        # fetch
        unstable.cpufetch
        unstable.ipfetch
        unstable.neofetch
        unstable.onefetch
        unstable.pfetch

        # custom packages
        extraGolangPackages.fman
      ];

      mac_only = [
      ];

      linux_only = [
        unstable.afetch
        iotop
        progress
      ];
    in
    common ++ (if stdenv.isLinux then linux_only else mac_only);
}
