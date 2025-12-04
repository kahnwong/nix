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
        specialArgs = { inherit nixpkgs; };
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
        specialArgs = { inherit nixpkgs; };
      };
      # ----------------- linux ----------------- #
      workstation = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          ./hosts/linux/workstation/home.nix
          {
            home = {
              username = "kahnwong";
              homeDirectory = "/home/kahnwong";
            };
          }
        ];
      };
      demo = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
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
      server = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          ./hosts/linux/server/home.nix
          {
            home = {
              username = "ubuntu";
              homeDirectory = "/home/ubuntu";
            };
          }
        ];
      };
      serverOnPrem = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          ./hosts/linux/server/home.nix
          {
            home = {
              username = "kahnwong";
              homeDirectory = "/home/kahnwong";
            };
          }
        ];
      };
      serverR440 = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          ./hosts/linux/server/home.nix
          {
            home = {
              username = "r440-server";
              homeDirectory = "/home/r440-server";
            };
          }
        ];
      };
      # ----------------- pi ----------------- #
      pi = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-linux;
        modules = [
          ./hosts/linux/server/home.nix
          {
            home = {
              username = "ubuntu";
              homeDirectory = "/home/ubuntu";
            };
          }
        ];
      };
      argon = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-linux;
        modules = [
          ./hosts/linux/argon/home.nix
          {
            home = {
              username = "ubuntu";
              homeDirectory = "/home/ubuntu";
            };
          }
        ];
      };
    };
  };
}
