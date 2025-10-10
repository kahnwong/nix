{ config, pkgs, nixpkgs, lib, ... }:
let
  nixFlakes = (pkgs.writeScriptBin "nixFlakes" ''
    exec ${pkgs.nixUnstable}/bin/nix --experimental-features "nix-command flakes" "$@"
  '');
in {
  imports = [
    ../../common.nix
    ../../common-dev.nix
    ../../common-linux.nix
    ../../common-linux-desktop.nix
  ];

  home.packages = with pkgs; [ ];
}
