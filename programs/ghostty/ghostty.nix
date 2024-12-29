{ config, pkgs, lib, ... }:

{
  home.file = {
    ".config/ghostty/config" = {
      text = with pkgs;
        let
          mac = builtins.replaceStrings [ "FISH_PATH" ]
            [ "/Users/kahnwong/.nix-profile/bin/fish" ]
            (builtins.readFile ./config);
          linux = builtins.replaceStrings [ "FISH_PATH" ]
            [ "/home/kahnwong/.nix-profile/bin/fish" ]
            (builtins.readFile ./config);
        in (if stdenv.isLinux then linux else mac);
    };
  };
}
