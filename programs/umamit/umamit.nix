{ config, pkgs, lib, ... }:

{
  home.file.".config/umamit/config.sops.yaml".source = ./config.sops.yaml;

  home.packages = with pkgs; [ ];
}
