{ config, pkgs, lib, ... }:

{
  home.file.".config/sampler/config.yaml".source = ./config.yaml;

  home.packages = with pkgs; [ ];
}
