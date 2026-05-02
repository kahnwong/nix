{
  pkgs,
  ...
}:

{
  home = {
    file = {
      ".config/fish/conf.d/app_habit.fish".source = ./conf.d/app_habit.fish;
      ".config/fish/conf.d/app_topydo.fish".source = ./conf.d/app_topydo.fish;
      ".config/fish/conf.d/app_umamit.fish".source = ./conf.d/app_umamit.fish;
      ".config/fish/conf.d/devops_containers.fish".source = ./conf.d/devops_containers.fish;
      ".config/fish/conf.d/devops_networking.fish".source = ./conf.d/devops_networking.fish;
      ".config/fish/conf.d/devops_system.fish".source = ./conf.d/devops_system.fish;
      ".config/fish/conf.d/git.fish".source = ./conf.d/git.fish;
      ".config/fish/conf.d/misc.fish".source = ./conf.d/misc.fish;
      ".config/fish/config.fish".source = ./config.fish;
    };

    packages = with pkgs; [
      direnv
      fish
      mcfly
      starship
      zoxide
    ];
  };
}
