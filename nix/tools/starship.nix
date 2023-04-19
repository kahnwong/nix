{ config, pkgs, lib, ... }:

{
  home.file.".config/starship.toml".source = ./starship/starship.toml;
}
