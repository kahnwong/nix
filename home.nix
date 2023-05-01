{ config, pkgs, lib, ... }:
let
  extraGolangPackages = import ./pkgs/golang.nix;
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
  ];

  home.packages = with pkgs;
    [
      # custom packages
      extraGolangPackages.fman
      extraGolangPackages.totp-cli

      # applications
      unstable.beancount
      unstable.fava

      # static site generator
      unstable.hugo
    ];
}
