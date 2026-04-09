{
  config,
  pkgs,
  nixpkgs,
  lib,
  flox,
  ...
}:
let
  nixFlakes = (
    pkgs.writeScriptBin "nixFlakes" ''
      exec ${pkgs.nixUnstable}/bin/nix --experimental-features "nix-command flakes" "$@"
    ''
  );
in
{
  imports = [
    ../../../programs/fish/fish-generic.nix
    ../../../programs/ghostty/ghostty.nix
    ../../../programs/git/git.nix
    ../../../programs/repo-switcher/repo-switcher.nix
    ../../../programs/starship/starship.nix
    ../../../programs/zed/zed.nix
    ../../common.nix
  ];

  home.packages = with pkgs; [
    beancount
    beanquery
    fava
    wakatime-cli
  ];
}
