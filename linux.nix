{
  home-manager,
  nixpkgs,
  nixpkgs-stable,
  flox,
  ...
}:
{
  base = home-manager.lib.homeManagerConfiguration {
    pkgs = import nixpkgs { system = "x86_64-linux"; };
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
      pkgs-stable = import nixpkgs-stable { system = "x86_64-linux"; };
      inherit flox;
      includeFlox = true;
    };
  };

  base-without-flox = home-manager.lib.homeManagerConfiguration {
    pkgs = import nixpkgs { system = "x86_64-linux"; };
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
      pkgs-stable = import nixpkgs-stable { system = "x86_64-linux"; };
      includeFlox = false;
    };
  };

  base-arm = home-manager.lib.homeManagerConfiguration {
    pkgs = import nixpkgs { system = "aarch64-linux"; };
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
      pkgs-stable = import nixpkgs-stable { system = "aarch64-linux"; };
      inherit flox;
      includeFlox = true;
    };
  };
}
