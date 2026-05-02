{
  pkgs,
  ...
}:

{
  home.file = {
    ".config/fish/conf.d/devops_containers.fish".source = ./conf.d/devops_containers.fish;
    ".config/fish/conf.d/devops_networking.fish".source = ./conf.d/devops_networking.fish;
    ".config/fish/conf.d/devops_system.fish".source = ./conf.d/devops_system.fish;
    ".config/fish/conf.d/git.fish".source = ./conf.d/git.fish;
    ".config/fish/conf.d/misc.fish".source = ./conf.d/misc.fish;
    ".config/fish/config.fish".source = ./config-generic.fish;
  };

  home.packages = with pkgs; [
    fish
  ];
}
