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

      # runtime
      go

      # utils
      entr
      tldr
      sops
    ];
  };
}
