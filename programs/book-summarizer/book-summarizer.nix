{
  pkgs,
  ...
}:

{
  home.file.".config/book-summarizer/config.yaml".source = ./config.yaml;

  home.packages = with pkgs; [ ];
}
