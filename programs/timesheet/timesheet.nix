{ config, pkgs, lib, ... }:

{
  home.file = {
    ".config/timesheet/config.ini" = {
      text = with pkgs;
        let
          mac = builtins.replaceStrings [ "FILENAME" ] [ "/Users/kahnwong/Cloud/Apps/timesheet/timesheet.txt" ] (builtins.readFile ./config.ini);
          linux = builtins.replaceStrings [ "FILENAME" ] [ "/opt/syncthing/cloud/Apps/timesheet/timesheet.txt" ] (builtins.readFile ./config.ini);
        in
        (if stdenv.isLinux then linux else mac);
    };
  };

  home.packages = with pkgs;
    [
    ];
}
