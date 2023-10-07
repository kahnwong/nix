{ config, pkgs, lib, ... }:

{
  home.file.".config/zellij/config.kdl".source = ./config.kdl;

  home.packages = with pkgs;
    [
      zellij
    ];
}
