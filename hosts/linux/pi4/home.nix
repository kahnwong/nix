{ config, pkgs, nixpkgs, lib, ... }:
let
  nixFlakes = (pkgs.writeScriptBin "nixFlakes" ''
    exec ${pkgs.nixUnstable}/bin/nix --experimental-features "nix-command flakes" "$@"
  '');
in {
  imports = [
    ../../../programs/erp/erp.nix
    ../../../programs/habit-tracker/habit-tracker.nix
    ../../../programs/topydo/topydo.nix
    ../../../programs/umami/umami.nix
  ];

  home.packages = with pkgs; [ ];
}
