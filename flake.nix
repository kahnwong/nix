{
  description = "NixOS configuration and home-manager configurations for mac and debian gnu/linux";

  nixConfig = {
    extra-trusted-substituters = [ "https://cache.flox.dev" ];
    extra-trusted-public-keys = [ "flox-cache-public-1:7F4OyH7ZCnFhcze3fJdfyXYLQw/aV7GEed86nQ7IsOs=" ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    # nixos-hardware.url = "github:nixos/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flox = {
      url = "github:flox/flox/latest";
    };
  };

  outputs =
    {
      darwin,
      home-manager,
      nixpkgs,
      nixpkgs-stable,
      flox,
      ...
    }:
    {
      homeManagerConfigurations = {
        # ----------------- mac ----------------- #
        macbookMain = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./hosts/macbook/base/darwin-configuration.nix
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.users.kahnwong = ./hosts/macbook/main/home.nix;
            }
          ];
          specialArgs = {
            inherit nixpkgs;
            pkgs-stable = nixpkgs-stable.legacyPackages.aarch64-darwin;
          };
        };
        macbookDemo = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./hosts/macbook/base/darwin-configuration-demo.nix
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.users.demo = ./hosts/macbook/demo/home.nix;
            }
          ];
          specialArgs = {
            inherit nixpkgs;
            pkgs-stable = nixpkgs-stable.legacyPackages.aarch64-darwin;
          };
        };
      }
      // (import ./personal.nix {
        inherit
          home-manager
          nixpkgs
          nixpkgs-stable
          flox
          ;
      })
      // (import ./server.nix {
        inherit home-manager nixpkgs nixpkgs-stable;
      });
    };
}
