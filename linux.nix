{
  home-manager,
  nixpkgs,
  nixpkgs-stable,
  flox,
  mkPkgs,
  ...
}:
{
  base = home-manager.lib.homeManagerConfiguration {
    pkgs = mkPkgs nixpkgs "x86_64-linux";
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
      pkgs-stable = mkPkgs nixpkgs-stable "x86_64-linux";
      inherit flox;
      includeFlox = true;
    };
  };

  base-without-flox = home-manager.lib.homeManagerConfiguration {
    pkgs = mkPkgs nixpkgs "x86_64-linux";
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
      pkgs-stable = mkPkgs nixpkgs-stable "x86_64-linux";
      includeFlox = false;
    };
  };

  base-arm = home-manager.lib.homeManagerConfiguration {
    pkgs = mkPkgs nixpkgs "aarch64-linux";
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
      pkgs-stable = mkPkgs nixpkgs-stable "aarch64-linux";
      inherit flox;
      includeFlox = true;
    };
  };
}
