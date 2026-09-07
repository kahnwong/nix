{
  pkgs,
  flox ? null,
  includeFlox ? true,
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

  home.packages = pkgs.lib.optionals includeFlox [
    flox.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
