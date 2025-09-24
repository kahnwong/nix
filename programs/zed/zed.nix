{ config, pkgs, lib, ... }:

{
  home.file = if pkgs.stdenv.isLinux then {
    ".var/app/dev.zed.Zed/config/zed/settings.json".source = ./settings.json;
  } else {
    ".config/zed/settings.json".source = ./settings.json;
  };

  home.packages = with pkgs; [ ];
}
