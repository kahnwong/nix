{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs;
    let
      common = [
        unstable.bat
        unstable.broot
        unstable.colordiff
        unstable.difftastic
        unstable.du-dust
        unstable.duf
        unstable.exa
        unstable.fd
        unstable.fzf
        unstable.ncdu
        unstable.procs
        unstable.ripgrep
        unstable.starship
        unstable.tere
        unstable.thefuck
        unstable.tldr
        unstable.tmux
        unstable.tree
        unstable.watch
      ];

      mac_only = [
      ];

      linux_only = [
        iotop
        progress
      ];
    in
    common ++ (if stdenv.isLinux then linux_only else mac_only);
}
