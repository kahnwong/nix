{ config, pkgs, lib, ... }:

{
  home.file.".config/git/profiles/forgejo".source = ./profiles/forgejo;
  home.file.".config/git/profiles/github".source = ./profiles/github;
  home.file.".gitignore_global".source = ./gitignore/gitignore_global;
  home.file.".config/git/profiles/go-install".source = ./profiles/go-install;

  # templates
  home.file.".sops.yaml".source = ./sops/.sops.yaml;
  home.file.".sops-work.yaml".source = ./sops/.sops-work.yaml;

  programs.git = {
    # `git config --global --edit` to see raw config
    enable = true;

    # ----- lfs -----
    lfs = { enable = true; };

    # ----- diff -----
    delta = {
      enable = true;
      options = {
        navigate = true; # use n and N to move between diff sections
        side-by-side = true;
      };
    };

    # ----- profile -----
    userName = "Karn Wong";
    userEmail = "karn@karnwong.me";
    # signing.key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGjELfQh9UxS1ORQZJY0it8T57x8+mHSg0fVAG/dprrl karn@karnwong.me";

    # https://jvns.ca/blog/2024/02/16/popular-git-config-options/
    extraConfig = {
      # ----- diff -----
      diff = {
        algorithm = "histogram";
        colorMoved = "plain";
        mnemonicPrefix = "true";
        renames = "true";
      };

      # ----- merge -----
      merge.conflictstyle = "zdiff3";

      # ----- remote -----
      # url."git@github.com:".insteadOf = "https://github.com/";

      # ----- commit signing -----
      gpg.format = "ssh";
      commit = { gpgsign = true; };

      credential = lib.mkMerge [
        (lib.mkIf pkgs.stdenv.isDarwin { helper = "osxkeychain"; })

        #        (lib.mkIf pkgs.stdenv.isLinux {
        #          helper = "gopass";
        #        })
      ];

      # ----- profiles -----
      # optional
      includeIf."gitdir:~/Git/" = { path = "profiles/github"; };
      includeIf."gitdir:/mnt/ssd/Git/" = { path = "profiles/github"; };

      ## syncthing
      includeIf."gitdir:~/Apps/" = { path = "profiles/github"; };
      includeIf."gitdir:/opt/syncthing/cloud/" = { path = "profiles/github"; };

      ## nvim
      includeIf."gitdir:~/.config/nvim/" = { path = "profiles/github"; };

      # forgejo
      includeIf."gitdir:~/Forgejo/" = { path = "profiles/forgejo"; };

      # ----- global ignore -----
      core.excludesfile = "~/.gitignore_global";

      # ----- pull -----
      pull = {
        rebase = true;
        autosetupremote = true;
      };
      fetch.prune = true;

      # ----- push -----
      push = { autoSetupRemote = true; };

      # ----- init -----
      init = { defaultBranch = "master"; };

      # ----- misc -----
      column.ui = "auto";
      log.date = "iso";

      # ----- sorting -----
      branch.sort = "-committerdate";
      tag.sort = "version:refname";
    };
  };

  home.packages = with pkgs; [
    # tools
    delta
    gh
    git-cliff
    git-lfs
    git-who
    pre-commit
    prek
    svu

    # gh extensions
    gh-dash
    gh-poi
  ];
}
