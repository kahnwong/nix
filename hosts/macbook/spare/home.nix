{ pkgs, ... }:
let
  nixFlakes = (pkgs.writeScriptBin "nixFlakes" ''
    exec ${pkgs.nixUnstable}/bin/nix --experimental-features "nix-command flakes" "$@"
  '');
in
{
  imports = [
    ../../common.nix
    ../../common-dev.nix
  ];
  home.packages = with pkgs; [
  ];
}
