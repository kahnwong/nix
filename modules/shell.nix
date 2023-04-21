{ config, pkgs, lib, ... }:

{
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
        unstable.exa
        unstable.fd
        unstable.fzf
        unstable.htop
        unstable.ncdu
        unstable.procs
        unstable.ripgrep
        unstable.tere
        unstable.thefuck
        unstable.tldr
        unstable.tmux
        unstable.tree
        unstable.nushell
        unstable.watch

        # downloaders
        unstable.aria
        unstable.wget
        unstable.yt-dlp

        # fetch
        unstable.neofetch
        unstable.onefetch

        # utilities
        unstable.ffmpeg
        unstable.libqalculate
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
