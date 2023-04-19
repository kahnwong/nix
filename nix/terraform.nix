{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs;
    [
      unstable.terraform

      # docs
      unstable.terraform-docs

      # linters
      unstable.tflint
      unstable.tfsec

      # tools
      unstable.terraformer
      unstable.infracost
    ];
}
