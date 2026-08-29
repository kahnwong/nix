{
  pkgs,
  pkgs-stable,
  ...
}:

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
  #        in (if stdenv.hostPlatform.isLinux then linux else mac);
  #    };
  #  };

  home = {
    file = {
      ".terraform.d/plugin-cache/.terraformrc".source = ./.terraformrc; # dummy file for init directory
      ".tofurc".source = ./.tofurc;
    };

    packages = with pkgs; [
      pkgs-stable.checkov
      infracost
      terraform-docs
    ];
  };
}
