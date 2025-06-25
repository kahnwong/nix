{ config, pkgs, lib, ... }:

{
  home.file.".config/erp/config.yaml".source = ./config.yaml;

  home.packages = with pkgs; [ ];
}
