{ config, pkgs, nixpkgs, lib, ... }:
let
  nixFlakes = (pkgs.writeScriptBin "nixFlakes" ''
    exec ${pkgs.nixUnstable}/bin/nix --experimental-features "nix-command flakes" "$@"
  '');
in {
  imports = [ ../../common.nix ../../common-linux.nix ../../../programs/yt-dlp/yt-dlp.nix];

  home.packages = with pkgs; [ ];
}
