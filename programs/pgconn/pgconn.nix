{ config, pkgs, lib, ... }:

{
  home.file.".config/pgconn/pgconn.sops.yaml".source = ./pgconn.sops.yaml;

  home.packages = with pkgs;
    [
    ];
}
