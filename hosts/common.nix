{ pkgs, ... }:
{
  imports = [
    ../programs/fish/fish.nix
    ../programs/nvim/nvim.nix
    ../programs/starship/starship.nix
    ../programs/zellij/zellij.nix
  ];

  home = {
    stateVersion = "23.05";
    packages = with pkgs; [
      # backup
      rclone
      restic

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
      tailspin
      tree
      viddy
      watch
      zoxide

      # networking
      curl
      dogdns
      gping
      iftop
      speedtest-cli

      # system
      du-dust
      duf
      htop
      ncdu
      procs

      # fetch
      cpufetch
      ipfetch
      neofetch
      onefetch
      pfetch

      # containers
      ctop
      oxker
      lazydocker

      # data manipulation
      fx
      glow
      jq
      jaq
      yq-go

      # downloader
      aria
      wget

      # runtime
      go

      # utils
      age
      entr
      tldr
      sops
    ];
  };
}
