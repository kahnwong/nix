{
  pkgs,
  ...
}:
{
  imports = [
    ../../../programs/fish/fish-apps.nix
    ../../apps.nix
  ];

  home.packages = with pkgs; [
  ];
}
