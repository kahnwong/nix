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
  imports = with pkgs;
    let
      base = [
        ./modules/shell.nix
      ];

      server_only = [
        ./modules/tools/sops.nix # is subset of devops.nix
      ];

      workstation_only = [
        ./modules/data-tools.nix
        ./modules/devops.nix
        ./modules/fonts.nix
        ./modules/misc.nix
        ./modules/programming.nix
      ];

    in
    base ++ (if (builtins.getEnv "machine_type" == "server") then server_only else workstation_only);

  home.packages = with pkgs;
    [

    ];
}
