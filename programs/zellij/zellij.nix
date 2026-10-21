{
  pkgs,
  ...
}:

{

  home.file = {
    ".config/zellij/config.kdl".source = ./config.kdl;
    ".config/zellij/layouts/two_panes_vertical.kdl".source = ./layouts/two_panes_vertical.kdl;
  };

  home.packages = with pkgs; [ zellij ];
}
