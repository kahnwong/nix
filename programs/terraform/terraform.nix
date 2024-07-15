{ config, pkgs, lib, ... }:

{
  home.file.".terraformrc".source = ./.terraformrc;
  home.file.".terraform.d/plugin-cache/.terraformrc".source = ./.terraformrc; # dummy file for init directory

  home.packages = with pkgs;
    [
      terraform # non-free
      opentofu

      ## tools
      terraform-docs
      # terraformer
      infracost

    ];
}
