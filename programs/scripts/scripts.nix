{ config, pkgs, lib, ... }:

{
  home.file."scripts/,convert-to-webp.sh".source = ./convert-to-webp.sh;
}
