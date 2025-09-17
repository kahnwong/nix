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
      restic

      # ---- shell ----
      bat
      difftastic
      eza
      fd
      fzf
      mcfly
      ripgrep
      sd
      tere
      # --- this was a hack to get tere to work; in case we need it again ---
      #      (pkgs.tere.overrideAttrs (oldAttrs: {
      #        doCheck = false;
      #        dontCheck = true;
      #      }))
      # ---
      # rclone
      rsync
      # tailspin
      tree
      viddy
      watch
      zoxide

      # ---- networking ----
      bandwhich
      curl
      doggo
      gping
      #      iftop
      rustscan

      # ---- system ----
      du-dust
      duf
      htop
      ncdu
      nvtopPackages.full
      procs
      zenith

      # ---- fetch ----
      cpufetch
      fastfetch
      neofetch
      onefetch

      # ---- containers ----
      ctop
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
      croc
      direnv
      entr
      sops
      tldr
    ];
  };
}
