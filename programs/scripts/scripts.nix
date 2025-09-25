{ config, pkgs, lib, ... }:

{
  home.file."scripts/,code-to-image.sh".source = ./scripts/code-to-image.sh;
  home.file."scripts/,convert-to-webp.sh".source = ./scripts/convert-to-webp.sh;
  home.file."scripts/,docker-compose-up.sh".source =
    ./scripts/docker-compose-up.sh;
  home.file."scripts/,docker-rmi.sh".source = ./scripts/docker-rmi.sh;
  home.file."scripts/,f2-rename-music.sh".source = ./scripts/f2-rename-music.sh;
  home.file."scripts/,flameshot-kill.sh".source = ./scripts/flameshot-kill.sh;
  home.file."scripts/,gcp-list-resources.sh".source =
    ./scripts/gcp-list-resources.sh;
  home.file."scripts/,gh-list-repos.sh".source = ./scripts/gh-list-repos.sh;
  home.file."scripts/,git-add-ssh-key.sh".source = ./scripts/git-add-ssh-key.sh;
  home.file."scripts/,github-list-pr.sh".source = ./scripts/github-list-pr.sh;
  home.file."scripts/,tf-cost-html.sh".source = ./scripts/tf-cost-html.sh;
  home.file."scripts/,tf-cost.sh".source = ./scripts/tf-cost.sh;
  home.file."scripts/,uv-init.sh".source = ./scripts/uv-init.sh;
  home.file."scripts/,zip-compress.sh".source = ./scripts/zip-compress.sh;
}
