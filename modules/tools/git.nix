{ config, pkgs, lib, ... }:

{
  home.file.".config/git/profiles/forgejo".source = ./git/profiles/forgejo;
  home.file.".config/git/profiles/github".source = ./git/profiles/github;

  programs.git = {
    # `git config --global --edit` to see raw config
    enable = true;

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

      gpg.format = "ssh";

      commit = lib.mkIf pkgs.stdenv.isDarwin {
        gpgsign = true;
      };

      credential = lib.mkIf pkgs.stdenv.isDarwin {
        helper = "osxkeychain";
      };
      ### git profiles
      includeIf."gitdir:**/Git/**/.git" = {
        path = "profiles/github";
      };
      includeIf."gitdir:**/Git-forgejo/**/.git" = {
        path = "profiles/forgejo";
      };
    };
  };

  home.packages = with pkgs; [
    delta
    trufflehog
    unstable.gh
    unstable.gitleaks
    unstable.pre-commit
  ];
}
