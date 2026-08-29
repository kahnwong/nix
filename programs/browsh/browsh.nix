{
  pkgs,
  ...
}:

{

  home.file =
    if pkgs.stdenv.hostPlatform.isLinux then
      {
        ".config/browsh/config.toml".source = ./config.toml;
      }
    else
      {
        "Library/Application Support/browsh/config.toml".source = ./config.toml;
      };

  home.packages = with pkgs; [ browsh ];
}
