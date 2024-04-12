{ config, pkgs, lib, ... }:

{
  home.file.".config/totp/totp.sops.yaml.txt".source = ./totp.sops.yaml.txt;

  home.packages = with pkgs;
    [
    ];
}
