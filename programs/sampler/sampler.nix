{
  pkgs,
  ...
}:

{
  home.file =
    if pkgs.stdenv.hostPlatform.isLinux then
      {
        ".config/sampler/config.yaml".source = ./config.yaml;
      }
    else
      {
        ".config/sampler/config.yaml".source = ./config.darwin.yaml;
      };

  home.packages = with pkgs; [ sampler ];
}
