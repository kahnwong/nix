{ config, pkgs, lib, ... }:

{
  home.file.".config/totp/totp.sops.yaml".source = ./totp.sops.yaml;

  home.packages = with pkgs;
    [
    ];
}
