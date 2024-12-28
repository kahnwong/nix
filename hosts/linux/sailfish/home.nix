{ config, pkgs, nixpkgs, lib, ... }:
let
  nixFlakes = (pkgs.writeScriptBin "nixFlakes" ''
    exec ${pkgs.nixUnstable}/bin/nix --experimental-features "nix-command flakes" "$@"
  '');
in {
  imports = [
    ../../common.nix
    ../../common-linux.nix
    ../../common-dev.nix
    ../../common-dev-workstation.nix
    ../../../programs/tailscale/tailscale.nix
  ];

  home.packages = with pkgs; [ caddy vault-bin ];
}
