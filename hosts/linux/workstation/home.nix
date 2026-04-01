{
  config,
  pkgs,
  nixpkgs,
  lib,
  flox,
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
    ../../../programs/fish/fish.nix
    ../../apps.nix
    ../../common-dev.nix
    ../../common-linux-desktop.nix
    ../../common-linux.nix
    ../../common.nix
  ];

  home.packages = with pkgs; [
    flox.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
