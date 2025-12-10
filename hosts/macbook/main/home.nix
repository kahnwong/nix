{ pkgs, ... }:
let
  nixFlakes = (pkgs.writeScriptBin "nixFlakes" ''
    exec ${pkgs.nixUnstable}/bin/nix --experimental-features "nix-command flakes" "$@"
  '');
in {
  imports =
    [ ../../../programs/fish/fish.nix ../../common-dev.nix ../../common.nix ];
  home.packages = with pkgs; [ ];
}
