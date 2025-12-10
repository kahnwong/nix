{ config, pkgs, nixpkgs, lib, ... }:
let
  nixFlakes = (pkgs.writeScriptBin "nixFlakes" ''
    exec ${pkgs.nixUnstable}/bin/nix --experimental-features "nix-command flakes" "$@"
  '');
in {
  imports = [
    ../../../programs/fish/fish.nix
    ../../common-dev.nix
    ../../common-linux-desktop.nix
    ../../common-linux.nix
    ../../common.nix
  ];

  home.packages = with pkgs; [ ];
}
