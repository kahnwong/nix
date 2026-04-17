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
    ../../../programs/git/git.nix
    ../../../programs/starship/starship.nix
  ];

  home.stateVersion = "23.05";
  home.packages = with pkgs; [
    bat
    cpufetch
    cpx
    duf
    eza
    fastfetch
    htop
    lazydocker
    ncdu
    oxker
    wget
    zellij
  ];
}
