{
  home-manager,
  nixpkgs,
  nixpkgs-stable,
  flox,
  ...
}:
{
  base = home-manager.lib.homeManagerConfiguration {
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    modules = [
      ./hosts/linux/base/home.nix
      {
        home = {
          username = "kahnwong";
          homeDirectory = "/home/kahnwong";
        };
      }
    ];
    extraSpecialArgs = {
      pkgs-stable = nixpkgs-stable.legacyPackages.x86_64-linux;
      inherit flox;
    };
  };

  demo = home-manager.lib.homeManagerConfiguration {
    pkgs = nixpkgs-stable.legacyPackages.x86_64-linux;
    modules = [
      ./hosts/linux/demo/home.nix
      {
        home = {
          username = "demo";
          homeDirectory = "/home/demo";
        };
      }
    ];
  };

  dev = home-manager.lib.homeManagerConfiguration {
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    modules = [
      ./hosts/linux/dev/home.nix
      {
        home = {
          username = "kahnwong";
          homeDirectory = "/home/kahnwong";
        };
      }
    ];
    extraSpecialArgs = {
      pkgs-stable = nixpkgs-stable.legacyPackages.x86_64-linux;
      # inherit flox;
    };
  };
}
