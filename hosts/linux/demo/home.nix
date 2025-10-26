{ config, pkgs, nixpkgs, lib, ... }:
let
  nixFlakes = (pkgs.writeScriptBin "nixFlakes" ''
    exec ${pkgs.nixUnstable}/bin/nix --experimental-features "nix-command flakes" "$@"
  '');
in {
  imports = [
    ../../common.nix
    ../../../programs/ghostty/ghostty.nix
    ../../../programs/git/git.nix
    ../../../programs/starship/starship.nix
    ../../../programs/zed/zed.nix
  ];

  home.packages = with pkgs; [ caddy ];
}
