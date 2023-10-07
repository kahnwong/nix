{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs;
    [
      awscli2
    ];
}
