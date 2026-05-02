{
  pkgs,
  ...
}:
{
  imports = [
    ../../../programs/fish/fish-generic.nix
    ../../common-dev.nix
    ../../common.nix
  ];

  home.packages = with pkgs; [ ];
}
