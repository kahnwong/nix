{ config, pkgs, lib, ... }:

{
  programs.delta = {

    enable = true;
    enableGitIntegration = true;

    options = {
      navigate = true; # use n and N to move between diff sections
      side-by-side = true;
    };
  };
}
