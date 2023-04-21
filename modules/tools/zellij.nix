{ config, pkgs, lib, ... }:

{
  home.file.".config/zellij/config.kdl".source = ./zellij/config.kdl;

  home.packages = with pkgs;
    [
      unstable.zellij
    ];
}
