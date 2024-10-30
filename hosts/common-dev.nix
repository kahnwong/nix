{ pkgs, ... }: {
  imports = [
    ../programs/aws/aws.nix
    ../programs/git/git.nix
    ../programs/kitty/kitty.nix
    ../programs/pgconn/pgconn.nix
    ../programs/proxmox/proxmox.nix
    ../programs/scripts/scripts.nix
    ../programs/terraform/terraform.nix
    ../programs/yt-dlp/yt-dlp.nix

    # apps
    ../programs/article-summarizer/article-summarizer.nix
    ../programs/topydo/topydo.nix
    ../programs/totp/totp.nix
  ];

  home = {
    packages = with pkgs; [
      # -------- runtimes & toolchains --------
      # ---- golang ----
      golangci-lint
      gopls
      gotools
      goreleaser
      air

      # ---- node ----
      fnm

      # ---- nix ----
      nixfmt-classic

      # ---- rust ----
      rustup

      # ---- shell - linters ----
      shellcheck
      shfmt

      # ---- docker ----
      hadolint

      # -------- others --------
      # ---- database ----
      pgcli

      # ---- kubernetes ----
      k9s
      kubectl
      kubectx

      # ---- api testing ----
      hurl
      k6

      # ---- data ----
      #      sqlfluff
      #      visidata

      # ---- misc ----
      #      sshx
      wakatime

      # -- finance --
      beancount
      fava

      # -- utils --
      libqalculate
      tz
    ];
  };
}
