{ pkgs, ... }:
{
  imports = [
    ../programs/aws/aws.nix
    ../programs/fish/fish.nix
    ../programs/git/git.nix
    ../programs/nvim/nvim.nix
    ../programs/starship/starship.nix
    ../programs/topydo/topydo.nix
    ../programs/yt-dlp/yt-dlp.nix
    ../programs/zellij/zellij.nix
  ];

  home = {
    stateVersion = "23.05";
    packages = with pkgs; [
      # nix
      home-manager

      # shell
      bat
      colordiff
      difftastic
      eza
      fd
      fzf
      mcfly
      ripgrep
      (pkgs.tere.overrideAttrs (oldAttrs: {
        doCheck = false;
        dontCheck = true;
      }))
      rsync
      tree
      viddy
      watch
      zoxide

      # networking
      curl
      dogdns
      gping
      speedtest-cli

      # system
      ctop
      du-dust
      duf
      htop
      ncdu
      procs

      # runtime
      go

      # fetch
      cpufetch
      ipfetch
      neofetch
      onefetch
      pfetch

      # data manipulation
      fx
      glow
      jq
      yq-go

      # downloader
      aria
      wget

      # utils
      entr
      libqalculate
      tldr
      tz
    ];
  };
}
