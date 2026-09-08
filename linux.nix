{
  home-manager,
  nixpkgs,
  nixpkgs-stable,
  flox,
  ...
}:
{
  main = home-manager.lib.homeManagerConfiguration {
    pkgs = import nixpkgs { system = "x86_64-linux"; };
    modules = [
      ./hosts/linux/main/home.nix
      {
        home = {
          username = "kahnwong";
          homeDirectory = "/home/kahnwong";
        };
      }
    ];
    extraSpecialArgs = {
      pkgs-stable = import nixpkgs-stable { system = "x86_64-linux"; };
      inherit flox;
    };
  };

  main-arm = home-manager.lib.homeManagerConfiguration {
    pkgs = import nixpkgs { system = "aarch64-linux"; };
    modules = [
      ./hosts/linux/main/home.nix
      {
        home = {
          username = "kahnwong";
          homeDirectory = "/home/kahnwong";
        };
      }
    ];
    extraSpecialArgs = {
      pkgs-stable = import nixpkgs-stable {
        system = "aarch64-linux";
      };
      inherit flox;
    };
  };
}
