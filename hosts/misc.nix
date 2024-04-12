{ pkgs, ... }:
{
  imports = [
    ../programs/topydo/topydo.nix
    ../programs/totp/totp.nix
    ../programs/yt-dlp/yt-dlp.nix
  ];

  home.packages = with pkgs; [
    pop
  ];
}
