{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs;
    let
      common = [
        # database
        unstable.pgcli
        unstable.mongodb-tools

        # linters
        unstable.sqlfluff

        # wrangling
        unstable.visidata
      ];

      mac_only = [
      ];

      linux_only = [
        dvc
      ];
    in
    common ++ (if stdenv.isLinux then linux_only else mac_only);

}
