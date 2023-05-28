{ config, pkgs, lib, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs;
    [
      cascadia-code
      fira-code
      font-awesome
      hack-font
      ibm-plex
      inter
      iosevka
      jetbrains-mono
      meslo-lgs-nf
      national-park-typeface
      powerline-fonts
      source-code-pro

      (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
    ];
}
