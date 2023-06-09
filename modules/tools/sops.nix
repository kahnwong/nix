{ config, pkgs, lib, ... }:

{
  # home.file.".config/sops/age/keys.txt".source = ./sops/age/keys.txt;

  home.packages = with pkgs;
    [
      unstable.sops
    ];
}
