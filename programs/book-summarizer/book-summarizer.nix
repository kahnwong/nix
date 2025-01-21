{ config, pkgs, lib, ... }:

{
  home.file.".config/book-summarizer/config.sops.yaml".source =
    ./config.sops.yaml;

  home.packages = with pkgs; [ ];
}
