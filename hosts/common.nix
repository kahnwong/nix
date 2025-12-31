{ pkgs, ... }: {
  imports = [
    ../programs/nvim/nvim.nix
    ../programs/sampler/sampler.nix
    ../programs/starship/starship.nix
    ../programs/zellij/zellij.nix
  ];

  home = {
    stateVersion = "23.05";
    packages = with pkgs; [
      # ---- backup ----
      restic
      # rclone
      # rsync

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

      # tailspin
      tree
      viddy
      watch
      zoxide

      # ---- networking ----
      # iftop
      # headscale
      curl
      doggo
      dumbpipe
      gping
      rustscan
      sendme
      somo

      # ---- system ----
      # nvtopPackages.full # eats a lot of space
      dua
      duf
      dust
      htop
      ncdu
      procs
      sampler
      zenith

      # ---- fetch ----
      cpufetch
      fastfetch
      neofetch
      onefetch

      # ---- containers ----
      ctop
      lazydocker
      oxker

      # ---- database ----
      pgcli
      postgresql_17

      # ---- data manipulation ----
      fx
      glow
      jq
      visidata
      yq-go

      # ---- downloader ----
      aria2
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
      mcat
      sops
      tldr

      # ---- misc ----
      sshx
    ];
  };
}
