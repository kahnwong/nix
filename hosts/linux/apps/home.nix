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
    ../../../programs/fish/fish-generic.nix
    ../../apps.nix
  ];

  home.packages = with pkgs; [
  ];
}
