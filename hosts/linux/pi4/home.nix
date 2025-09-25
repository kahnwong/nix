{ config, pkgs, nixpkgs, lib, ... }:
let
  nixFlakes = (pkgs.writeScriptBin "nixFlakes" ''
    exec ${pkgs.nixUnstable}/bin/nix --experimental-features "nix-command flakes" "$@"
  '');
in {
  imports = [
    # shell
    ../../../programs/fish/fish.nix
    ../../../programs/starship/starship.nix
    # apps
    ../../../programs/erp/erp.nix
    ../../../programs/habit-tracker/habit-tracker.nix
    ../../../programs/topydo/topydo.nix
    ../../../programs/umamit/umamit.nix
  ];

  home.packages = with pkgs; [
    bat
    direnv
    eza
    fish
    mcfly
    sops
    starship
    uv
    yq-go
    zoxide
  ];

  home.stateVersion = "25.11";
}
