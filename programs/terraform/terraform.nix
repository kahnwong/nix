{ config, pkgs, lib, ... }:

{
  #  home.file.".terraformrc".source = ./.terraformrc;
  #  home.file = {
  #    ".terraformrc" = {
  #      text = with pkgs;
  #        let
  #          mac = builtins.replaceStrings [ "GOBIN" ] [ "/Users/kahnwong/go/bin" ]
  #            (builtins.readFile ./.terraformrc);
  #          linux =
  #            builtins.replaceStrings [ "GOBIN" ] [ "/home/kahnwong/go/bin" ]
  #            (builtins.readFile ./.terraformrc);
  #        in (if stdenv.isLinux then linux else mac);
  #    };
  #  };

  home.file.".terraform.d/plugin-cache/.terraformrc".source =
    ./.terraformrc; # dummy file for init directory

  home.packages = with pkgs; [
    # terraform # non-free
    opentofu

    ## tools
    terraform-docs
    # terraformer
    infracost

  ];
}
