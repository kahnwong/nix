{ pkgs, ... }:
{
  imports = [
    ../../../programs/fish/fish.nix
    ../../common-dev.nix
    ../../common.nix
  ];
  home.packages = with pkgs; [ ];
}
