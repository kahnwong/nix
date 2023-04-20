{ config, pkgs, lib, ... }:

{
  home.file.".aws/config".source = ./aws/config;
  home.file.".aws/credentials".source = ./aws/credentials;

  home.packages = with pkgs;
    [
      unstable.awscli2
    ];
}
