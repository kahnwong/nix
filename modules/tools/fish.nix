{ config, pkgs, lib, ... }:

{
  home.file.".config/fish/conf.d/git.fish".source = ./fish/conf.d/git.fish;
  home.file.".config/fish/conf.d/shell.fish".source = ./fish/conf.d/shell.fish;
  home.file.".config/fish/config.fish".source = ./fish/config.fish;
  home.file.".config/fish/functions/envsource.fish".source = ./fish/functions/envsource.fish;

  home.packages = with pkgs; [
    unstable.fish
  ];
}
