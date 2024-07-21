{ config, pkgs, lib, ... }:

{
  home.file.".config/kitty/theme.conf".source = ./theme.conf;

  home.file = {
    ".config/kitty/kitty.conf" = {
      text = with pkgs;
        let
          mac = builtins.readFile ./kitty-mac.conf;
          linux = builtins.readFile ./kitty-linux.conf;
        in
        (if stdenv.isLinux then linux else mac);
    };
  };

  # home.packages = with pkgs;
  #   [
  #     kitty
  #   ];
}
