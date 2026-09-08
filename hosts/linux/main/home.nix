{
  pkgs,
  flox,
  ...
}:
{
  imports = [
    ../../../programs/fish/fish.nix
    ../../apps.nix
    ../../common-dev.nix
    ../../common-linux-desktop.nix
    ../../common.nix
  ];

  home.packages = [
    flox.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
