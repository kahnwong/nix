{ config, pkgs, lib, ... }:
let
  fman = import ./pkgs/golang/fman.nix;
in
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
    ./modules/data-tools.nix
    ./modules/devops.nix
    ./modules/fonts.nix
    ./modules/programming.nix
    ./modules/shell.nix
    ./modules/tools/awscli.nix
    ./modules/tools/fish.nix
    ./modules/tools/git.nix
    ./modules/tools/kitty.nix
    ./modules/tools/nvim.nix
    ./modules/tools/sops.nix
    ./modules/tools/ssh.nix
    ./modules/tools/starship.nix
    ./modules/tools/topydo.nix
    ./modules/tools/wakatime.nix
    ./modules/tools/yt-dlp.nix
  ];

  home.packages = with pkgs;
    [
      # custom packages
      fman

      # applications
      unstable.beancount
      unstable.fava

      # static site generator
      unstable.hugo
    ];
}
