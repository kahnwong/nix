{
  description = "NixOS configuration and home-manager configurations for mac and debian gnu/linux";

  nixConfig = {
    extra-substituters = [ "https://cache.flox.dev" ];
    extra-trusted-public-keys = [ "flox-cache-public-1:7F4OyH7ZCnFhcze3fJdfyXYLQw/aV7GEed86nQ7IsOs=" ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";
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
    let
      nixpkgsConfig = {
        allowUnfree = true;
        allowInsecure = true;
      };
      mkPkgs =
        source: system:
        import source {
          inherit system;
          config = nixpkgsConfig;
        };
    in
    {
      homeManagerConfigurations =
        (import ./darwin.nix {
          inherit
            darwin
            home-manager
            nixpkgs
            nixpkgs-stable
            mkPkgs
            nixpkgsConfig
            ;
        })
        // (import ./linux.nix {
          inherit
            home-manager
            nixpkgs
            nixpkgs-stable
            flox
            mkPkgs
            ;
        })
        // (import ./demo.nix {
          inherit
            darwin
            home-manager
            nixpkgs
            nixpkgs-stable
            mkPkgs
            nixpkgsConfig
            ;
        });
    };
}
