{ config, pkgs, lib, ... }:

{
  home.file.".config/git/profiles/forgejo".source = ./profiles/forgejo;
  home.file.".config/git/profiles/github".source = ./profiles/github;
  home.file.".gitignore_global".source = ./gitignore/gitignore_global;

  # templates
  home.file."dependabot.yaml".source = ./dependabot/dependabot.yaml;
  home.file.".pre-commit-config.yaml".source = ./pre-commit/.pre-commit-config.yaml;
  home.file.".sops.yaml".source = ./sops/.sops.yaml;
  home.file.".sops-dc.yaml".source = ./sops/.sops-dc.yaml;


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

    # default
    # userName = "Karn Wong";
    # userEmail = "karn@karnwong.me";
    # signing.key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGjELfQh9UxS1ORQZJY0it8T57x8+mHSg0fVAG/dprrl karn@karnwong.me";

    extraConfig = {
      diff.colorMoved = "default";
      merge.conflictstyle = "zdiff3";
      # url."git@github.com:".insteadOf = "https://github.com/";

      ### commit signing
      gpg.format = "ssh";

      commit = lib.mkIf pkgs.stdenv.isDarwin {
        gpgsign = true;
      };

      credential = lib.mkIf pkgs.stdenv.isDarwin {
        helper = "osxkeychain";
      };

      ### git profiles
      # optional
      includeIf."gitdir:~/Git/" = {
        path = "profiles/github";
      };
      includeIf."gitdir:~/Library/Mobile Documents/" = {
        path = "profiles/github";
      };
      includeIf."gitdir:~/Git/forgejo/" = {
        path = "profiles/forgejo";
      };

      ### global ignore
      core.excludesfile = "~/.gitignore_global";
    };
  };

  home.packages = with pkgs; [
    delta
    gh
    # gitleaks
    pre-commit
    # trufflehog
  ];
}
