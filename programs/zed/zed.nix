{ config, pkgs, lib, ... }:

{
  home.file.".config/zed/settings.json".source = ./settings.json; # darwin
  home.file.".var/app/dev.zed.Zed/config/zed/settings.json".source =
    ./settings.json; # flatpak

  home.packages = with pkgs; [ ];
}
