{ config, pkgs, lib, ... }:

{
  home.file.".config/fish/conf.d/devops.fish".source = ./conf.d/devops.fish;
  home.file.".config/fish/conf.d/git.fish".source = ./conf.d/git.fish;
  home.file.".config/fish/conf.d/misc.fish".source = ./conf.d/misc.fish;
  home.file.".config/fish/conf.d/shell.fish".source = ./conf.d/shell.fish;
  home.file.".config/fish/conf.d/topydo.fish".source = ./conf.d/topydo.fish;
  home.file.".config/fish/config.fish".source = ./config.fish;
  home.file.".config/fish/functions/envsource.fish".source = ./functions/envsource.fish;
  home.file.".config/fish/functions/pip.fish".source = ./functions/pip.fish;

  home.packages = with pkgs; [
    fish
  ];
}
