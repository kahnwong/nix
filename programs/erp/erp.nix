{ config, pkgs, lib, ... }:

{

  home.file = {
    ".config/erp/config.yaml" = {
      text = with pkgs;
        let
          mac = builtins.replaceStrings [ "PATH" ]
            [ "/Users/kahnwong/Cloud/Apps/erp/erp.txt" ]
            (builtins.readFile ./config.yaml);
          linux = builtins.replaceStrings [ "PATH" ]
            [ "/home/kahnwong/Cloud/Apps/erp/erp.txt" ]
            (builtins.readFile ./config.yaml);
        in (if stdenv.isLinux then linux else mac);
    };
  };

  home.packages = with pkgs; [ ];
}
