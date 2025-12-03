{ config, pkgs, lib, ... }:

{
  home.file.".config/yt-dlp/config".source = ./yt-dlp.conf;

  home.packages = with pkgs; [ ffmpeg ];
}
