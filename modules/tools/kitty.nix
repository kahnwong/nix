{ config, pkgs, lib, ... }:

{
  home.file.".config/kitty/kitty.conf".source = ./kitty/kitty.conf;
  home.file.".config/kitty/theme.conf".source = ./kitty/theme.conf;

  # home.packages = with pkgs;
  #   [
  #     kitty
  #   ];
}
