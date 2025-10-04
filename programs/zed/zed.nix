{ config, pkgs, lib, ... }:

{
  home.file = if pkgs.stdenv.isLinux then {
    ".var/app/dev.zed.Zed/config/zed/settings.json".source = ./settings.json;
    ".var/app/dev.zed.Zed/config/zed/keymap.json".source = ./keymap.json;
  } else {
    ".config/zed/settings.json".source = ./settings.json;
    ".config/zed/keymap.json".source = ./keymap.json;

  };

  home.packages = with pkgs; [ ];
}
