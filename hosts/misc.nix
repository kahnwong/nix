{ pkgs, ... }:
{
  imports = [
    ../programs/topydo/topydo.nix
    ../programs/yt-dlp/yt-dlp.nix
  ];

  home.packages = with pkgs; [
    pop
  ];
}
