{ config, pkgs, nixpkgs, lib, ... }:
let
  nixFlakes = (pkgs.writeScriptBin "nixFlakes" ''
    exec ${pkgs.nixUnstable}/bin/nix --experimental-features "nix-command flakes" "$@"
  '');
in {
  imports = [
    # shell
    ../../../programs/fish/fish.nix
    ../../../programs/ghostty/ghostty.nix
    ../../../programs/git/git.nix
    ../../../programs/starship/starship.nix
    # apps
    ../../../programs/erp/erp.nix
    ../../../programs/habit-tracker/habit-tracker.nix
    ../../../programs/starship/starship.nix
    ../../../programs/topydo/topydo.nix
    ../../../programs/totp/totp.nix
    ../../../programs/umamit/umamit.nix
    # base
    ../../../programs/zed/zed.nix
    ../../common.nix
  ];

  home.packages = with pkgs; [ caddy ];
}
