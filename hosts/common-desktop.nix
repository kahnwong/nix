{ pkgs, ... }:
{
  imports = [
    ../programs/git/git.nix
  ];

  home = {
    stateVersion = "23.05";
    packages = with pkgs; [
      k9s
      kubectl
      kubectx

      hugo
      libqalculate
      tz
    ];
  };
}
