{ config, pkgs, lib, ... }:

{
  home.file.".config/browsh/config.toml".source = ./config.toml;

  home.packages = with pkgs; [ ];
}
