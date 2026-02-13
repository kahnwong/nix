{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.file."scripts/,code-to-image.sh".source = ./scripts/code-to-image.sh;
  home.file."scripts/,convert-to-webp.sh".source = ./scripts/convert-to-webp.sh;
  home.file."scripts/,f2-rename-music.sh".source = ./scripts/f2-rename-music.sh;
  home.file."scripts/,gh-archive-repo.sh".source = ./scripts/gh-archive-repo.sh;
  home.file."scripts/,gh-list-pr.sh".source = ./scripts/gh-list-pr.sh;
  home.file."scripts/,gh-list-repos.sh".source = ./scripts/gh-list-repos.sh;
  home.file."scripts/,uv-init.sh".source = ./scripts/uv-init.sh;
  home.file."scripts/,zip-compress.sh".source = ./scripts/zip-compress.sh;
}
