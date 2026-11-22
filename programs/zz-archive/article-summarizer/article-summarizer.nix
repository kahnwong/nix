{
  pkgs,
  ...
}:

{
  home.file.".config/article-summarizer/config.sops.yaml".source = ./config.sops.yaml;

  home.packages = with pkgs; [ ];
}
