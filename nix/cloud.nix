{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs;
    [
      unstable.google-cloud-sdk
      unstable.docker-credential-gcr
    ];
}
