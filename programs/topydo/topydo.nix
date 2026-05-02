{
  config,
  pkgs,
  ...
}:

{
  home = {
    file = {
      ".topydo_columns".source = ./.topydo_columns;
      ".topydo" = {
        text =
          with pkgs;
          let
            userHome = config.home.homeDirectory;

            mac =
              builtins.replaceStrings
                [ "ARCHIVE_FILENAME" "TODO_FILENAME" ]
                [
                  "${userHome}/Apps/todotxt/done.txt"
                  "${userHome}/Apps/todotxt/todo.txt"
                ]
                (builtins.readFile ./.topydo);
            linux =
              builtins.replaceStrings
                [ "ARCHIVE_FILENAME" "TODO_FILENAME" ]
                [
                  "${userHome}/Apps/todotxt/done.txt"
                  "${userHome}/Apps/todotxt/todo.txt"
                ]
                (builtins.readFile ./.topydo);
          in
          if stdenv.isLinux then linux else mac;
      };
    };

    packages = with pkgs; [
      # topydo # installed via uv instead
    ];
  };
}
