{ config, pkgs, lib, ... }:

{
  home.file.".config/fish/completions/gh.fish".source = ./fish/completions/gh.fish;
  home.file.".config/fish/conf.d/devops.fish".source = ./fish/conf.d/devops.fish;
  home.file.".config/fish/conf.d/git.fish".source = ./fish/conf.d/git.fish;
  home.file.".config/fish/conf.d/misc.fish".source = ./fish/conf.d/misc.fish;
  home.file.".config/fish/conf.d/shell.fish".source = ./fish/conf.d/shell.fish;
  home.file.".config/fish/conf.d/topydo.fish".source = ./fish/conf.d/topydo.fish;
  home.file.".config/fish/conf.d/work.fish".source = ./fish/conf.d/work.fish;
  home.file.".config/fish/config.fish".source = ./fish/config.fish;
  home.file.".config/fish/functions/envsource.fish".source = ./fish/functions/envsource.fish;
  home.file.".config/fish/functions/fuck.fish".source = ./fish/functions/fuck.fish;
  home.file.".config/fish/functions/pip.fish".source = ./fish/functions/pip.fish;

  home.packages = with pkgs; [
    unstable.fish
  ];
}
