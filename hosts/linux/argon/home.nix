{
  config,
  pkgs,
  nixpkgs,
  lib,
  ...
}:
let
  nixFlakes = (
    pkgs.writeScriptBin "nixFlakes" ''
      exec ${pkgs.nixUnstable}/bin/nix --experimental-features "nix-command flakes" "$@"
    ''
  );
in
{
  imports = [
    ../../../programs/fish-generic/fish.nix
    ../../common.nix
  ];

  home.packages = with pkgs; [
  ];

  home.stateVersion = "25.11";
}
