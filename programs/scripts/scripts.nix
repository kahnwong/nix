{ config, pkgs, lib, ... }:

{
  home.file."scripts/,code-to-image.sh".source = ./code-to-image.sh;
  home.file."scripts/,convert-to-webp.sh".source = ./convert-to-webp.sh;
  home.file."scripts/,docker-compose-up.sh".source = ./docker-compose-up.sh;
  home.file."scripts/,flameshot-kill.sh".source = ./flameshot-kill.sh;
  home.file."scripts/,gh-list-repos.sh".source = ./gh-list-repos.sh;
  home.file."scripts/,git-add-ssh-key.sh".source = ./git-add-ssh-key.sh;
  home.file."scripts/,qgis.sh".source = ./qgis.sh;
  home.file."scripts/,sops-dc-init.sh".source = ./sops-dc-init.sh;
  home.file."scripts/,sops-init.sh".source = ./sops-init.sh;
  home.file."scripts/,tf-cost-html.sh".source = ./tf-cost-html.sh;
  home.file."scripts/,tf-cost.sh".source = ./tf-cost.sh;
  home.file."scripts/,zip-compress.sh".source = ./zip-compress.sh;
}
