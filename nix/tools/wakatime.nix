{ config, pkgs, lib, ... }:

{
  home.file.".wakatime.cfg".source = ./wakatime/.wakatime.cfg;
}
