{
  pkgs,
  ...
}:

{
  home = {
    file = {
      ".config/helix/config.toml".source = ./config.toml;
      ".config/helix/languages.toml".source = ./languages.toml;
    };

    packages = with pkgs; [ helix ];
  };
}
