{
  description =
    "NixOS configuration and home-manager configurations for mac and debian gnu/linux";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixos-hardware.url = "github:nixos/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { darwin, home-manager, nixpkgs, ... }:
    let
      homeManagerConfFor = config:
        { ... }: {
          nixpkgs.overlays = [
          ];
          imports = [ config ];
        };
      darwinSystem = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./hosts/macbook/darwin-configuration.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.users.kahnwong =
              homeManagerConfFor ./hosts/macbook/home.nix;
          }
        ];
        specialArgs = { inherit nixpkgs; };
      };
      darwinSystemIntel = darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        modules = [
          ./hosts/macbook/darwin-configuration.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.users.kahnwong =
              homeManagerConfFor ./hosts/macbook/home.nix;
          }
        ];
        specialArgs = { inherit nixpkgs; };
      };
      debianSystem = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          ./hosts/nuc/home.nix
          {
            home = {
              username = "kahnwong";
              homeDirectory = "/home/kahnwong";
            };
          }
        ];
      };
    in
    {
      debian = debianSystem.activationPackage;
      defaultPackage.x86_64-linux = debianSystem.activationPackage;
      defaultPackage.aarch64-darwin = darwinSystem.system;
      defaultPackage.x86_64-darwin = darwinSystemIntel.system;
    };
}
