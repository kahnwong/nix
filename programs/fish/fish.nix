{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.file.".config/fish/completions/garmin-tui.fish".source = ./completions/garmin-tui.fish;
  home.file.".config/fish/conf.d/app_gcal_tui.fish".source = ./conf.d/app_gcal_tui.fish;
  home.file.".config/fish/conf.d/app_habit.fish".source = ./conf.d/app_habit.fish;
  home.file.".config/fish/conf.d/app_mods.fish".source = ./conf.d/app_mods.fish;
  home.file.".config/fish/conf.d/app_opencode.fish".source = ./conf.d/app_opencode.fish;
  home.file.".config/fish/conf.d/app_topydo.fish".source = ./conf.d/app_topydo.fish;
  home.file.".config/fish/conf.d/app_umamit.fish".source = ./conf.d/app_umamit.fish;
  home.file.".config/fish/conf.d/devops.fish".source = ./conf.d/devops.fish;
  home.file.".config/fish/conf.d/devops_cloud.fish".source = ./conf.d/devops_cloud.fish;
  home.file.".config/fish/conf.d/devops_containers.fish".source = ./conf.d/devops_containers.fish;
  home.file.".config/fish/conf.d/devops_files_transfer.fish".source =
    ./conf.d/devops_files_transfer.fish;
  home.file.".config/fish/conf.d/devops_networking.fish".source = ./conf.d/devops_networking.fish;
  home.file.".config/fish/conf.d/devops_system.fish".source = ./conf.d/devops_system.fish;
  home.file.".config/fish/conf.d/git.fish".source = ./conf.d/git.fish;
  home.file.".config/fish/conf.d/misc.fish".source = ./conf.d/misc.fish;
  home.file.".config/fish/config.fish".source = ./config.fish;
  home.file.".config/fish/functions/envsource.fish".source = ./functions/envsource.fish;
  home.file.".config/fish/functions/get_fish_secret.fish".source = ./functions/get_fish_secret.fish;
  home.file.".config/fish/functions/pip.fish".source = ./functions/pip.fish;

  home.packages = with pkgs; [ fish ];
}
