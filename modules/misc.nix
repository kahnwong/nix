{ config, pkgs, lib, ... }:
let
  extraGolangPackages = import ./pkgs/golang.nix;
in
{
  imports = [
    ./tools/kitty.nix
    ./tools/topydo.nix
  ];

  home.file.".config/pgconn/db.yaml".source = ./tools/pgconn/db.yaml.txt;

  home.packages = with pkgs;
    let
      common = [
        # applications
        unstable.beancount
        unstable.fava

        # static site generator
        unstable.hugo

        # utilities
        unstable.ffmpeg
        unstable.libqalculate
        unstable.tz

        # custom packages
        extraGolangPackages.def
        extraGolangPackages.totp-cli
      ];

      mac_only = [
      ];

      linux_only = [
        unstable.rio
      ];
    in
    common ++ (if stdenv.isLinux then linux_only else mac_only);
}
