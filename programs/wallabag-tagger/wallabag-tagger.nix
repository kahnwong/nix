{ config, pkgs, lib, ... }:

{
  home.file.".config/wallabag-tagger/config.sops.yaml".source =
    ./config.sops.yaml;

  home.packages = with pkgs; [ ];
}
