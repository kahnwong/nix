{ pkgs, nix, nixpkgs, config, lib, ... }:
{
  imports = [
    ../../programs/non-free.nix
  ];
  environment.systemPackages = with pkgs;
    [

    ];

  fonts = {
    fontDir.enable = true;

    fonts = with pkgs; [
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
  };

  users = {
    users.kahnwong = {
      home = /Users/kahnwong;
    };
  };

  nix = {
    nixPath = lib.mkForce [
      "nixpkgs=${nixpkgs}"
    ];
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
  services.nix-daemon.enable = true;
}
