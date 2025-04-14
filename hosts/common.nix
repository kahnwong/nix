{ pkgs, ... }: {
  imports = [
    ../programs/fish/fish.nix
    ../programs/nvim/nvim.nix
    ../programs/starship/starship.nix
    ../programs/zellij/zellij.nix
  ];

  home = {
    stateVersion = "23.05";
    packages = with pkgs; [
      # ---- backup ----
      #      rclone
      restic

      # ---- shell ----
      bat
      colordiff
      difftastic
      eza
      fd
      fzf
      mcfly
      ripgrep
      tere
      # --- this was a hack to get tere to work; in case we need it again ---
      #      (pkgs.tere.overrideAttrs (oldAttrs: {
      #        doCheck = false;
      #        dontCheck = true;
      #      }))
      # ---
      #      rsync
      #      tailspin
      tree
      viddy
      watch
      #      yazi
      zoxide

      # ---- networking ----
      curl
      doggo
      gping
      #      iftop
      #      speedtest-cli
      rustscan

      # ---- system ----
      du-dust
      duf
      htop
      ncdu
      nvtop
      procs
      zenith

      # ---- fetch ----
      cpufetch
      fastfetch
      neofetch
      onefetch

      # ---- containers ----
      ctop
      oxker
      lazydocker

      # ---- data manipulation ----
      fx
      glow
      jq
      yq-go

      # ---- downloader ----
      aria
      wget

      # ---- runtimes & toolchains ----
      go
      uv

      # ---- utils ----
      age
      direnv
      entr
      sops
      tldr
    ];
  };
}
