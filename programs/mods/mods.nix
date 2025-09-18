{ config, pkgs, lib, ... }:

{

  home.file = if pkgs.stdenv.isLinux then {
    ".config/mods/mods.yml".source = ./mods.yml;
  } else {
    "Library/Application Support/mods/mods.yml".source = ./mods.yml;
  };

  home.packages = with pkgs; [ ];
}
