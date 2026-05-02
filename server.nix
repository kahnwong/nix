{
  home-manager,
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

  serverR440 = home-manager.lib.homeManagerConfiguration {
    pkgs = nixpkgs-stable.legacyPackages.x86_64-linux;
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
