{ config, pkgs, lib, ... }:

{
  home.file.".config/git/profiles/forgejo".source = ./profiles/forgejo;
  home.file.".config/git/profiles/github".source = ./profiles/github;
  home.file.".gitignore_global".source = ./gitignore/gitignore_global;

  # templates
  home.file.".sops.yaml".source = ./sops/.sops.yaml;
  home.file.".sops-dc.yaml".source = ./sops/.sops-dc.yaml;

  programs.git = {
    # `git config --global --edit` to see raw config
    enable = true;

    lfs = { enable = true; };

    delta = {
      enable = true;
      options = {
        navigate = true; # use n and N to move between diff sections
        side-by-side = true;
      };
    };

    # default
    userName = "Karn Wong";
    userEmail = "karn@karnwong.me";
    # signing.key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGjELfQh9UxS1ORQZJY0it8T57x8+mHSg0fVAG/dprrl karn@karnwong.me";

    # https://jvns.ca/blog/2024/02/16/popular-git-config-options/
    extraConfig = {
      diff = {
        colorMoved = "default";
        algorithm = "histogram";
      };

      merge.conflictstyle = "zdiff3";
      # url."git@github.com:".insteadOf = "https://github.com/";

      ### commit signing
      gpg.format = "ssh";

      commit = { gpgsign = true; };

      credential = lib.mkMerge [
        (lib.mkIf pkgs.stdenv.isDarwin { helper = "osxkeychain"; })

        #        (lib.mkIf pkgs.stdenv.isLinux {
        #          helper = "gopass";
        #        })
      ];

      ### git profiles
      # optional
      includeIf."gitdir:~/Git/" = { path = "profiles/github"; };

      #      ## obsidian
      #      includeIf."gitdir:~/Library/Mobile Documents/" = {
      #        path = "profiles/github";
      #      };
      #      includeIf."gitdir:~/Obsidian/" = { path = "profiles/github"; };

      ## syncthing
      includeIf."gitdir:~/Cloud/Apps/" = { path = "profiles/github"; };
      includeIf."gitdir:/opt/syncthing/cloud/" = { path = "profiles/github"; };

      ## nvim
      includeIf."gitdir:~/.config/nvim/" = { path = "profiles/github"; };

      # forgejo
      includeIf."gitdir:~/Forgejo/" = { path = "profiles/forgejo"; };

      ### global ignore
      core.excludesfile = "~/.gitignore_global";

      pull = {
        rebase = true;
        autosetupremote = true;
      };

      push = { autoSetupRemote = true; };

      #      init = {
      #        defaultBranch = "main";
      #      };

      fetch.prune = true;
      log.date = "iso";
    };
  };

  home.packages = with pkgs; [
    #    gopass
    delta
    gh
    git-cliff
    git-lfs
    gitleaks
    pre-commit
    # trufflehog # this binary has auto-update feature, and it messes with nix
  ];
}
