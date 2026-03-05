{ pkgs, ... }:
let
  nixFlakes = (
    pkgs.writeScriptBin "nixFlakes" ''
      exec ${pkgs.nixUnstable}/bin/nix --experimental-features "nix-command flakes" "$@"
    ''
  );
in
{
  imports = [
    ../../../programs/fish/fish-generic.nix
    ../../common.nix
  ];
  home.packages = with pkgs; [
    nodejs
    vhs
  ];
}
