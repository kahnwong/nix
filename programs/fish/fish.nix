{
  pkgs,
  ...
}:

{
  home = {
    file = {
      ".config/fish/completions/garmin-tui.fish".source = ./completions/garmin-tui.fish;
      ".config/fish/conf.d/app_gcal_tui.fish".source = ./conf.d/app_gcal_tui.fish;
      ".config/fish/conf.d/app_genai.fish".source = ./conf.d/app_genai.fish;
      ".config/fish/conf.d/app_habit.fish".source = ./conf.d/app_habit.fish;
      ".config/fish/conf.d/app_misc.fish".source = ./conf.d/app_misc.fish;
      ".config/fish/conf.d/app_topydo.fish".source = ./conf.d/app_topydo.fish;
      ".config/fish/conf.d/app_umamit.fish".source = ./conf.d/app_umamit.fish;
      ".config/fish/conf.d/dev.fish".source = ./conf.d/dev.fish;
      ".config/fish/conf.d/dev_flox.fish".source = ./conf.d/dev_flox.fish;
      ".config/fish/conf.d/devops.fish".source = ./conf.d/devops.fish;
      ".config/fish/conf.d/devops_cloud.fish".source = ./conf.d/devops_cloud.fish;
      ".config/fish/conf.d/devops_containers.fish".source = ./conf.d/devops_containers.fish;
      ".config/fish/conf.d/devops_files_transfer.fish".source = ./conf.d/devops_files_transfer.fish;
      ".config/fish/conf.d/devops_networking.fish".source = ./conf.d/devops_networking.fish;
      ".config/fish/conf.d/devops_security.fish".source = ./conf.d/devops_security.fish;
      ".config/fish/conf.d/devops_system.fish".source = ./conf.d/devops_system.fish;
      ".config/fish/conf.d/devops_terraform.fish".source = ./conf.d/devops_terraform.fish;
      ".config/fish/conf.d/git.fish".source = ./conf.d/git.fish;
      ".config/fish/conf.d/misc.fish".source = ./conf.d/misc.fish;
      ".config/fish/config.fish".source = ./config.fish;
      ".config/fish/functions/envsource.fish".source = ./functions/envsource.fish;
      ".config/fish/functions/get_fish_secret.fish".source = ./functions/get_fish_secret.fish;
      ".config/fish/functions/pip.fish".source = ./functions/pip.fish;
    };

    packages = with pkgs; [ fish ];
  };
}
