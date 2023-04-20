{ config, pkgs, lib, ... }:

{
  home.file.".config/yt-dlp/config".source = ./yt-dlp/yt-dlp.conf;
}
