{ config, pkgs, lib, ... }:

{
  home.file."scripts/,code-to-image.sh".source = ./code-to-image.sh;
  home.file."scripts/,convert-to-webp.sh".source = ./convert-to-webp.sh;
  home.file."scripts/,dependabot-init.sh".source = ./dependabot-init.sh;
  home.file."scripts/,git-add-ssh-key.sh".source = ./git-add-ssh-key.sh;
  home.file."scripts/,pre-commit-init.sh".source = ./pre-commit-init.sh;
  home.file."scripts/,qgis.sh".source = ./qgis.sh;
  home.file."scripts/,sops-init.sh".source = ./sops-init.sh;
  home.file."scripts/,tf-cost-html.sh".source = ./tf-cost-html.sh;
  home.file."scripts/,tf-cost.sh".source = ./tf-cost.sh;
  home.file."scripts/,tf-init.sh".source = ./tf-init.sh;
  home.file."scripts/,zip-compress.sh".source = ./zip-compress.sh;
}
