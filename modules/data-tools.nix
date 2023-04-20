{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs;
    [
      # database
      unstable.pgcli
      unstable.mongodb-tools

      # linters
      unstable.sqlfluff

      # wrangling
      unstable.visidata
    ];
}
