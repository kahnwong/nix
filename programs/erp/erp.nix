{ config, pkgs, lib, ... }:

{
  home.file = {
    ".config/erp/config.yaml" = {

      text = with pkgs;
        let
          userHome = config.home.homeDirectory;

          mac = builtins.replaceStrings [ "PATH" ]
            [ "${userHome}/Apps/erp/erp.txt" ]
            (builtins.readFile ./config.yaml);
          linux = builtins.replaceStrings [ "PATH" ]
            [ "${userHome}/Apps/erp/erp.txt" ]
            (builtins.readFile ./config.yaml);
        in (if stdenv.isLinux then linux else mac);
    };
  };

  home.packages = with pkgs; [ ];
}
