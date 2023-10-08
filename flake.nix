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

  outputs = { darwin, home-manager, nixpkgs, ... }: {
    homeManagerConfigurations = {
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
        specialArgs = { inherit nixpkgs; };
      };
      macbookSpare = darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        modules = [
          ./hosts/macbook/base/darwin-configuration.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.users.kahnwong = ./hosts/macbook/spare/home.nix;
          }
        ];
        specialArgs = { inherit nixpkgs; };
      };
      nuc = home-manager.lib.homeManagerConfiguration {
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
      server = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          ./hosts/server/home.nix
          {
            home = {
              username = "kahnwong";
              homeDirectory = "/home/kahnwong";
            };
          }
        ];
      };
    };
  };
}
