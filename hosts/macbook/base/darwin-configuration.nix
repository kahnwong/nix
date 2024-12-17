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
      nerd-fonts.jetbrains-mono

      # (nerdfonts.override {
      #   fonts = [
      #     # "CascadiaCode"
      #     # "FiraCode"
      #     "JetBrainsMono"
      #     # "Hack"
      #     # "IBMPlexMono"
      #     # "IntelOneMono"
      #     # "Iosevka"
      #     # "SourceCodePro"
      #   ];
      # })
    ];
  };

  users = { users.kahnwong = { home = /Users/kahnwong; }; };

  nix = {
    nixPath = lib.mkForce [ "nixpkgs=${nixpkgs}" ];
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
  services.nix-daemon.enable = true;

  system.stateVersion = 5;
}
