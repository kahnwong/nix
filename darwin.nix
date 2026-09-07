{
  darwin,
  home-manager,
  nixpkgs,
  nixpkgs-stable,
  mkPkgs,
  nixpkgsConfig,
  ...
}:
{
  macbookMain = darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    modules = [
      ./hosts/macbook/base/darwin-configuration.nix
      home-manager.darwinModules.home-manager
      {
        nixpkgs.config = nixpkgsConfig;
        home-manager.useGlobalPkgs = true;
        home-manager.users.kahnwong = ./hosts/macbook/main/home.nix;
      }
    ];
    specialArgs = {
      inherit nixpkgs;
      pkgs-stable = mkPkgs nixpkgs-stable "aarch64-darwin";
    };
  };
}
