{ config, pkgs, lib, ... }:

{
  home.file."timesheet/config.ini".source = ./config.ini;

  home.packages = with pkgs;
    [
    ];
}
