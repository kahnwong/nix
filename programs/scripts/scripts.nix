{ config, pkgs, lib, ... }:

{
  home.file."Scripts/,convert-to-webp.sh".source = ./convert-to-webp.sh;
}
