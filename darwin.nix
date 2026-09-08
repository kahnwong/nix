{
  darwin,
  home-manager,
  nixpkgs,
  nixpkgs-stable,
  ...
}:
{
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
      pkgs-stable = import nixpkgs-stable { system = "aarch64-darwin"; };
    };
  };
}
