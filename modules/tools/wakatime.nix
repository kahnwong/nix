{ config, pkgs, lib, ... }:

{
  home.file.".wakatime.cfg".source = ./wakatime/wakatime.cfg;

  home.packages = with pkgs;
    [
      unstable.wakatime
    ];
}
