{
  pkgs,
  ...
}:
{
  imports = [
    ../../../programs/fish/fish-generic.nix
    ../../../programs/ghostty/ghostty.nix
    ../../../programs/git/git.nix
    ../../../programs/zed/zed.nix
    ../../common.nix
  ];

  home.packages = with pkgs; [ caddy ];
}
