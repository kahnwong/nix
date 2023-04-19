{ config, pkgs, lib, ... }:

{
  home.file.".aws/config".source = ./dotfiles/.aws/config;
  home.file.".aws/credentials".source = ./dotfiles/.aws/credentials;

  home.packages = with pkgs;
    [
      unstable.awscli2
      unstable.google-cloud-sdk
      unstable.docker-credential-gcr
    ];
}
