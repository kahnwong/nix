{ pkgs, ... }: {
  imports = [
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
      # rsync
      # tailspin
      tree
      viddy
      watch
      zoxide

      # ---- networking ----
      curl
      doggo
      gping
      # iftop
      rustscan

      # ---- system ----
      du-dust
      dua
      duf
      htop
      ncdu
      # nvtopPackages.full # eats a lot of space
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
      fnm
      go
      rustup
      uv
      yarn

      # ---- utils ----
      age
      direnv
      entr
      sops
      tldr
    ];
  };
}
