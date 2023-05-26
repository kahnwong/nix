{ config, pkgs, lib, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs;
    [
      cascadia-code
      fira-code
      font-awesome
      hack-font
      inter
      jetbrains-mono
      meslo-lgs-nf
      powerline-fonts
      source-code-pro
    ];
}
