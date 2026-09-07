{
  pkgs,
  ...
}:
{
  imports = [
    ../../../programs/fish/fish-generic.nix
    ../../common.nix
  ];

  home.packages = with pkgs; [ ];
}
