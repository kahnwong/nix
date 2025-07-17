{ config, pkgs, lib, ... }:

{
  home.file.".config/umami/config.sops.yaml".source = ./config.sops.yaml;

  home.packages = with pkgs; [ ];
}
