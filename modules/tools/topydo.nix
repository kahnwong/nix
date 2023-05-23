{ config, pkgs, lib, ... }:

{
  home.file.".topydo_columns".source = ./topydo/.topydo_columns;
  # home.file.".topydo".source = ./topydo/.topydo;

  home.file = {
    ".topydo" = {
      text = with pkgs;
        let
          mac = builtins.replaceStrings [ "ARCHIVE_FILENAME" "TODO_FILENAME" ] [ "/Users/kahnwong/Cloud/Apps/todotxt/done.txt" "/Users/kahnwong/Cloud/Apps/todotxt/todo.txt" ] (builtins.readFile ./topydo/.topydo);
          linux = builtins.replaceStrings [ "ARCHIVE_FILENAME" "TODO_FILENAME" ] [ "/opt/syncthing/cloud/Apps/todotxt/done.txt" "/opt/syncthing/cloud/Apps/todotxt/todo.txt" ] (builtins.readFile ./topydo/.topydo);
        in
        (if stdenv.isLinux then linux else mac);
    };
  };

  home.packages = with pkgs;
    let
      common = [ ];

      linux_only = [ ];

      mac_only = [
        topydo # doesn't work on debian-on-macbook
      ];
    in
    common ++ (if stdenv.isLinux then linux_only else mac_only);
}
