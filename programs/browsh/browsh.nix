{ config, pkgs, lib, ... }:

{

  home.file = if pkgs.stdenv.isLinux then {
    ".config/browsh/config.toml".source = ./config.toml;
  } else {
    "Library/Application Support/browsh/config.toml".source = ./config.toml;
  };

  home.packages = with pkgs; [ ];
}
