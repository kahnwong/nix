{ config, pkgs, nixpkgs, lib, ... }:
let
  nixFlakes = (pkgs.writeScriptBin "nixFlakes" ''
    exec ${pkgs.nixUnstable}/bin/nix --experimental-features "nix-command flakes" "$@"
  '');
in
{
  imports = [
    ../../common.nix
    ../../common-linux.nix
    ../../common-desktop.nix
    ../../common-dev.nix
    ../../common-dev-workstation.nix
  ];

  home.packages = with pkgs; [
    caddy
  ];
}
