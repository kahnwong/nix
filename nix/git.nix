{ config, pkgs, lib, ... }:

{
  programs = {
    git = {
      # `git config --global --edit` to see raw config
      enable = true;
      userName = builtins.getEnv "git_username";
      userEmail = builtins.getEnv "git_email";

      delta = {
        enable = true;
        options = {
          navigate = true; # use n and N to move between diff sections
          side-by-side = true;
        };
      };

      extraConfig = {
        diff.colorMoved = "default";
        merge.conflictstyle = "diff3";
        # url."git@github.com:".insteadOf = "https://github.com/";

        ######################
        # git_signing_key
        ######################
        user.signingkey = builtins.getEnv "user_signingkey";
        gpg.format = "ssh";

        commit = lib.mkIf pkgs.stdenv.isDarwin {
          gpgsign = true;
        };
        credential = lib.mkIf pkgs.stdenv.isDarwin {
          helper = "osxkeychain";
        };
        ######################
        # end git_signing_key
        ######################
      };
    };
  };
}
