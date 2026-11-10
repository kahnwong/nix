{
  pkgs,
  ...
}:

{
  home = {
    file = {
      ".config/fish/conf.d/apps.fish".source = ./conf.d/apps.fish;
      ".config/fish/conf.d/app_todo.fish".source = ./conf.d/app_todo.fish;
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
      ".config/fish/functions/get_fish_secret.fish".source = ./functions/get_fish_secret.fish;
    };

    packages = with pkgs; [ fish ];
  };
}
