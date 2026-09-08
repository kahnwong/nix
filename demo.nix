{
  darwin,
  home-manager,
  nixpkgs,
  nixpkgs-stable,
  ...
}:
{
  demo = home-manager.lib.homeManagerConfiguration {
    pkgs = import nixpkgs-stable { system = "x86_64-linux"; };
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
      pkgs-stable = import nixpkgs-stable { system = "aarch64-darwin"; };
    };
  };
}
