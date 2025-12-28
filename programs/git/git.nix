{ config, pkgs, lib, ... }: {
  imports = [ ./delta.nix ];

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

    settings = {
      # ----- profile -----
      user.name = "Karn Wong";
      user.email = "karn@karnwong.me";

      # ----- commit signing -----
      gpg.format = "ssh";
      commit = { gpgsign = true; };
      # signing.key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGjELfQh9UxS1ORQZJY0it8T57x8+mHSg0fVAG/dprrl karn@karnwong.me";

      # https://jvns.ca/blog/2024/02/16/popular-git-config-options/
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

      # ----- creds -----
      credential = lib.mkMerge [
        (lib.mkIf pkgs.stdenv.isDarwin { helper = "osxkeychain"; })

        #        (lib.mkIf pkgs.stdenv.isLinux {
        #          helper = "gopass";
        #        })
      ];

      # ----- lfs -----
      lfs = { enable = true; };

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
    gh
    git-cliff
    git-lfs
    git-who
    glab
    pre-commit
    prek
    svu
  ];
}
