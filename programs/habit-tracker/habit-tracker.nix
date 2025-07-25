{ config, pkgs, lib, ... }:

{
  home.file.".config/habit-tracker/config.yaml".source = ./config.yaml;

  home.packages = with pkgs; [ ];
}
