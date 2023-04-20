{ config, pkgs, lib, ... }:

{
  home.file.".ssh/config".source = ./ssh/config;
}
