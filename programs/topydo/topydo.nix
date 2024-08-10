{ config, pkgs, lib, ... }:

{
  home.file.".topydo_columns".source = ./.topydo_columns;

  home.file = {
    ".topydo" = {
      text = with pkgs;
        let
          mac = builtins.replaceStrings [ "ARCHIVE_FILENAME" "TODO_FILENAME" ] [
            "/Users/kahnwong/Cloud/Apps/todotxt/done.txt"
            "/Users/kahnwong/Cloud/Apps/todotxt/todo.txt"
          ] (builtins.readFile ./.topydo);
          linux =
            builtins.replaceStrings [ "ARCHIVE_FILENAME" "TODO_FILENAME" ] [
              "/opt/syncthing/cloud/Apps/todotxt/done.txt"
              "/opt/syncthing/cloud/Apps/todotxt/todo.txt"
            ] (builtins.readFile ./.topydo);
        in (if stdenv.isLinux then linux else mac);
    };
  };

  home.packages = with pkgs;
    [
      # topydo # installed via pipx instead
    ];
}
