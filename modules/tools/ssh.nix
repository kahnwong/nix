{ config, pkgs, lib, ... }:

{
  home.file.".ssh/config".source = ./ssh/config;
  home.file.".ssh/config.d/homelab".source = ./ssh/config.d/homelab;
  home.file.".ssh/config.d/vps".source = ./ssh/config.d/vps;
  home.file.".ssh/config.d/work".source = ./ssh/config.d/work;
  home.file.".ssh/config.d/work-legacy".source = ./ssh/config.d/work-legacy;
}
