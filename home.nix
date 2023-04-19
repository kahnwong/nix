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
    ./nix/cloud.nix
    ./nix/containers.nix
    ./nix/data-tools.nix
    ./nix/devops.nix
    ./nix/fonts.nix
    ./nix/programming.nix
    ./nix/shell.nix
    ./nix/tools/awscli.nix
    ./nix/tools/fish.nix
    ./nix/tools/git.nix
    ./nix/tools/kitty.nix
    ./nix/tools/nvim.nix
    ./nix/tools/sops.nix
    ./nix/tools/starship.nix
    ./nix/tools/topydo.nix
    ./nix/tools/wakatime.nix
  ];

  ### configurations
  home.file.".config/yt-dlp/config".source = ./dotfiles/yt-dlp.conf;
  home.file.".ssh/config".source = ./dotfiles/.ssh/config;

  home.packages = with pkgs;
    [
      # applications
      unstable.beancount
      unstable.fava

      # static site generator
      unstable.hugo
    ];
}
