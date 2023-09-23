{ config, pkgs, lib, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs;
    [
      # font-awesome
      # inter
      # national-park-typeface
      meslo-lgs-nf # for terminal
      powerline-fonts

      (nerdfonts.override {
        fonts = [
          "CascadiaCode"
          "FiraCode"
          "JetBrainsMono"
          # "Hack"
          # "IBMPlexMono"
          # "IntelOneMono"
          # "Iosevka"
          # "SourceCodePro"
        ];
      })
    ];
}
