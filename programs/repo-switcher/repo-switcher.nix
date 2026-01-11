{ config, pkgs, lib, ... }:

{
  home.file.".config/repo-switcher/config.yaml".source = ./config.yaml;
}
