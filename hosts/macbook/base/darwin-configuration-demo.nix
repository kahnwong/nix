{ pkgs, nix, nixpkgs, config, lib, ... }: {
  imports = [ ];
  environment.systemPackages = with pkgs;
    [
      # nix
      home-manager # this needs to stay here
    ];

  fonts = {
    packages = with pkgs; [
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

  users = { users.demo = { home = /Users/demo; }; };

  nix = {
    nixPath = lib.mkForce [ "nixpkgs=${nixpkgs}" ];
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
  services.nix-daemon.enable = true;
}
