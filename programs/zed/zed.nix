{
  pkgs,
  ...
}:

{
  home.file = {
    ".config/zed/settings.json".source = ./settings.json;
    ".config/zed/keymap.json".source = ./keymap.json;

  };

  home.packages = with pkgs; [ ];
}
