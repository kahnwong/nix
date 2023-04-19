{ config, pkgs, lib, ... }:

{
  home.file.".config/starship.toml".source = ./starship/starship.toml;

  home.packages = with pkgs;
    [
      unstable.starship
    ];
}
