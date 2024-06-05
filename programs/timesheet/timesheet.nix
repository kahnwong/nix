{ config, pkgs, lib, ... }:

{
  home.file.".config/timesheet/config.ini".source = ./config.ini;

  home.packages = with pkgs;
    [
    ];
}
