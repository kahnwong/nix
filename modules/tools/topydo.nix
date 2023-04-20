{ config, pkgs, lib, ... }:

{
  home.file.".topydo_columns".source = ./topydo/.topydo_columns;
  home.file.".topydo".source = ./topydo/.topydo;

  home.packages = with pkgs;
    let
      common = [
      ];

      mac_only = [
        topydo # doesn't work on debian-on-macbook
      ];
    in
    common ++ (if stdenv.isLinux then linux_only else mac_only);
}
