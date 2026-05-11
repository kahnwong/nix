{
  home-manager,
  nixpkgs,
  nixpkgs-stable,
  ...
}:
{
  server = home-manager.lib.homeManagerConfiguration {
    pkgs = nixpkgs-stable.legacyPackages.x86_64-linux;
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

  dev = home-manager.lib.homeManagerConfiguration {
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    modules = [
      ./hosts/linux/dev/home.nix
      {
        home = {
          username = "ubuntu";
          homeDirectory = "/home/ubuntu";
        };
      }
    ];
    extraSpecialArgs = {
      pkgs-stable = nixpkgs-stable.legacyPackages.x86_64-linux;
      # inherit flox;
    };
  };

  apps = home-manager.lib.homeManagerConfiguration {
    pkgs = nixpkgs-stable.legacyPackages.x86_64-linux;
    modules = [
      ./hosts/linux/apps/home.nix
      {
        home = {
          username = "ubuntu";
          homeDirectory = "/home/ubuntu";
          stateVersion = "25.11";
        };
      }
    ];
  };

  argon = home-manager.lib.homeManagerConfiguration {
    pkgs = nixpkgs-stable.legacyPackages.aarch64-linux;
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
}
