{ config, pkgs, lib, ... }:

{
  home.file.".config/zed/settings.json".source = ./settings.json;

  home.packages = with pkgs; [ ];
}
