{ config, pkgs, lib, ... }:

{
  home.username = builtins.getEnv "username";

  # linux: `/home/$username`
  # mac: `/Users/$username`
  home.homeDirectory = builtins.getEnv "home_directory";

  home.stateVersion = "22.11";

  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      unstable = import <unstable> {
        config = config.nixpkgs.config;
      };
    };
  };


  programs.home-manager.enable = true;
  # services.home-manager.autoUpgrade.enable = true;

  manual.manpages.enable = false;

  ### imports
  imports = [
    ./nix/tools/awscli.nix
    ./nix/cloud.nix
    ./nix/containers.nix
    ./nix/fonts.nix
    ./nix/programming.nix
    ./nix/shell.nix
    ./nix/tools/fish.nix
    ./nix/tools/git.nix
    ./nix/tools/kitty.nix
    ./nix/tools/nvim.nix
    ./nix/tools/starship.nix
    ./nix/tools/topydo.nix
    ./nix/tools/wakatime.nix
  ];

  ### configurations
  home.file.".config/sops/age/keys.txt".source = ./dotfiles/.config/sops/age/keys.txt;
  home.file.".config/yt-dlp/config".source = ./dotfiles/yt-dlp.conf;
  home.file.".ssh/config".source = ./dotfiles/.ssh/config;

  home.packages = with pkgs;
    let
      # Packages to always install.
      common = [
        # downloaders
        unstable.aria
        unstable.wget
        unstable.yt-dlp

        # networking
        unstable.curl
        unstable.dogdns
        unstable.gping
        unstable.httpie
        unstable.rustscan
        unstable.speedtest-cli

        # utilities
        unstable.btop
        unstable.cbonsai
        unstable.ffmpeg
        unstable.graphviz
        unstable.htop
        # instaloader
        unstable.libqalculate
        # rclone
        # restic
        unstable.rsync
        unstable.silicon
        unstable.slides

        # fetch
        unstable.neofetch
        unstable.onefetch

        # data
        unstable.visidata
        unstable.sqlfluff

        # database
        unstable.pgcli
        unstable.mongodb-tools

        # applications
        unstable.beancount
        unstable.bitwarden-cli
        unstable.fava
        unstable.hugo

        # devops
        unstable.d2
        unstable.k6
        unstable.keyscope
        unstable.sops
        # unstable.steampipe
        unstable.vhs
      ];

      linux_only = [
      ];

      mac_only = [
        unstable.caddy # on linux it requires extra configs to enable systemd
      ];
    in
    common ++ (if stdenv.isLinux then linux_only else mac_only);
}
