{ config, pkgs, lib, ... }:

{
  home.file = {
    ".config/ghostty/config" = {
      text = with pkgs;
        let
          mac = builtins.replaceStrings [ "FISH_PATH" "FONT_SIZE" ] [
            "/Users/kahnwong/.nix-profile/bin/fish"
            "13.5"
          ] (builtins.readFile ./config);
          linux = builtins.replaceStrings [ "FISH_PATH" "FONT_SIZE" ] [
            "/home/kahnwong/.nix-profile/bin/fish"
            "10"
          ] (builtins.readFile ./config);
        in (if stdenv.isLinux then linux else mac);
    };
  };
}
