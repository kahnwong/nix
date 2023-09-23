{ config, pkgs, lib, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs;
    [
      # font-awesome
      # inter
      # national-park-typeface
      powerline-fonts

      (nerdfonts.override {
        fonts = [
          "CascadiaCode"
          "FiraCode"
          "JetBrainsMono"
          "Meslo"
          # "Hack"
          # "IBMPlexMono"
          # "IntelOneMono"
          # "Iosevka"
          # "SourceCodePro"
        ];
      })
    ];
}
