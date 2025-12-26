{ config, pkgs, nixpkgs, lib, ... }:
let
  nixFlakes = (pkgs.writeScriptBin "nixFlakes" ''
    exec ${pkgs.nixUnstable}/bin/nix --experimental-features "nix-command flakes" "$@"
  '');
in {
  imports = [
    # shell
    ../../../programs/fish-generic/fish.nix
    ../../../programs/starship/starship.nix
  ];

  home.packages = with pkgs; [
    bat
    curl
    direnv
    eza
    fd
    fish
    go
    gping
    htop
    jq
    lazydocker
    mcfly
    ncdu
    oxker
    sops
    starship
    tere
    tree
    uv
    watch
    wget
    yq-go
    zoxide
  ];

  home.stateVersion = "25.11";
}
