{ config, pkgs, lib, ... }:

{
  home.file.".config/media-discord-rpc/config.sops.yaml".source =
    ./config.sops.yaml;

  home.packages = with pkgs; [ ];
}
