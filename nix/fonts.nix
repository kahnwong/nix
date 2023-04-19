{ config, pkgs, lib, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs;
    [
      font-awesome
      meslo-lgs-nf
      powerline-fonts
      source-code-pro
      jetbrains-mono
      fira-code
      hack-font
    ];
}
