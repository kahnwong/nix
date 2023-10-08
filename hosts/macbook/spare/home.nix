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
    ../../../programs/non-free.nix
    ../../../programs/kitty/kitty.nix
  ];
  home.packages = with pkgs; [
  ];
}
