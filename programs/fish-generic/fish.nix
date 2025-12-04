{ config, pkgs, lib, ... }:

{
  home.file.".config/fish/conf.d/devops_containers.fish".source =
    ./conf.d/devops_containers.fish;
  home.file.".config/fish/conf.d/devops_files_transfer.fish".source =
    ./conf.d/devops_files_transfer.fish;
  home.file.".config/fish/conf.d/devops_networking.fish".source =
    ./conf.d/devops_networking.fish;
  home.file.".config/fish/conf.d/devops_system.fish".source =
    ./conf.d/devops_system.fish;
  home.file.".config/fish/conf.d/git.fish".source = ./conf.d/git.fish;
  home.file.".config/fish/conf.d/misc.fish".source = ./conf.d/misc.fish;
  home.file.".config/fish/config.fish".source = ./config.fish;

  home.packages = with pkgs; [ fish ];
}
