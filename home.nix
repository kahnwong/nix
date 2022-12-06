{ config, pkgs, lib, ... }:

{
  home.username = builtins.getEnv "username";

  # linux: `/home/$username`
  # mac: `/Users/$username`
  home.homeDirectory = builtins.getEnv "home_directory";

  home.stateVersion = "22.11";

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
  # services.home-manager.autoUpgrade.enable = true;

  fonts.fontconfig.enable = true;

  ### configurations
  home.file.".aws/config".source = ./dotfiles/.aws/config;
  home.file.".aws/credentials".source = ./dotfiles/.aws/credentials;
  home.file.".config/fish/conf.d/00_fig_pre.fish".source = ./dotfiles/.config/fish/conf.d/00_fig_pre.fish;
  home.file.".config/fish/conf.d/99_fig_post.fish".source = ./dotfiles/.config/fish/conf.d/99_fig_post.fish;
  home.file.".config/fish/conf.d/devops.fish".source = ./dotfiles/.config/fish/conf.d/devops.fish;
  home.file.".config/fish/conf.d/git.fish".source = ./dotfiles/.config/fish/conf.d/git.fish;
  home.file.".config/fish/conf.d/shell.fish".source = ./dotfiles/.config/fish/conf.d/shell.fish;
  home.file.".config/fish/conf.d/topydo.fish".source = ./dotfiles/.config/fish/conf.d/topydo.fish;
  home.file.".config/fish/conf.d/work.fish".source = ./dotfiles/.config/fish/conf.d/work.fish;
  home.file.".config/fish/config.fish".source = ./dotfiles/.config/fish/config.fish;
  home.file.".config/fish/fish_plugins".source = ./dotfiles/.config/fish/fish_plugins;
  home.file.".config/fish/functions/fish_prompt.fish".source = ./dotfiles/.config/fish/functions/fish_prompt.fish;
  home.file.".config/fish/functions/fuck.fish".source = ./dotfiles/.config/fish/functions/fuck.fish;
  home.file.".config/fish/functions/pip.fish".source = ./dotfiles/.config/fish/functions/pip.fish;
  home.file.".config/sops/age/keys.txt".source = ./dotfiles/.config/sops/age/keys.txt;
  home.file.".config/starship.toml".source = ./dotfiles/.config/starship.toml;
  home.file.".pyenv/version".source = ./dotfiles/.pyenv/version;
  home.file.".ssh/config".source = ./dotfiles/.ssh/config;
  home.file.".topydo_columns".source = ./dotfiles/.topydo_columns;
  home.file.".topydo".source = ./dotfiles/.topydo;
  home.file.".wakatime.cfg".source = ./dotfiles/.wakatime.cfg;
  home.file."yt-dlp.conf".source = ./dotfiles/yt-dlp.conf;

  ### git
  programs.git = {
    # `git config --global --edit` for raw config content
    enable = true;
    userName = builtins.getEnv "git_username";
    userEmail = builtins.getEnv "git_email";

    delta = {
      enable = true;
      options = {
        navigate = true; # use n and N to move between diff sections
        side-by-side = true;
      };
    };

    extraConfig = {
      diff.colorMoved = "default";
      merge.conflictstyle = "diff3";
      # url."git@github.com:".insteadOf = "https://github.com/";

      ######################
      # git_signing_key
      ######################
      user.signingkey = builtins.getEnv "user_signingkey";
      gpg.format = "ssh";

      commit = lib.mkIf pkgs.stdenv.isDarwin {
        gpgsign = true;
      };
      credential = lib.mkIf pkgs.stdenv.isDarwin {
        helper = "osxkeychain";
      };
      ######################
      # end git_signing_key
      ######################
    };
  };

  ### nvim
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    # default nix vim plugin manager is flaky with vim-wakatime, need to use vim-plug
    plugins = with pkgs.vimPlugins; [
      vim-plug
    ];

    extraConfig = ''
      runtime! plug.vim
      call plug#begin()

      "diff
      Plug 'mhinz/vim-signify'

      "integrations
      Plug 'wakatime/vim-wakatime'

      "syntax highlighting
      Plug 'chrisbra/csv.vim'
      Plug 'jvirtanen/vim-hcl'
      Plug 'LnL7/vim-nix'
      "Plug 'preservim/vim-markdown'

      "utilities
      Plug 'windwp/nvim-autopairs'

      Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
      Plug 'junegunn/fzf.vim'

      "ui
      Plug 'stevearc/dressing.nvim'
      Plug 'vim-airline/vim-airline'
      Plug 'vim-airline/vim-airline-themes'

      call plug#end()

      """" config
      set number

      let g:airline_theme='onedark'
    '';
  };

  home.packages = with pkgs;
    let
      # Packages to always install.
      common = [
        # shell
        fish
        starship
        tmux

        # build env
        openssl
        zlib
        readline
        gdal

        # downloaders
        aria
        wget
        yt-dlp

        # networking
        curl
        dogdns
        gping
        httpie
        speedtest-cli

        # utilities
        bat
        broot
        btop
        colordiff
        difftastic
        du-dust
        duf
        exa
        fd
        ffmpeg
        fzf
        graphviz
        htop
        libqalculate
        ncdu
        procs
        ripgrep
        rsync
        sops
        tere
        thefuck
        tldr
        tree
        vhs
        watch

        # fetch
        neofetch
        onefetch

        # git
        delta
        gh
        gitleaks
        pre-commit
        trufflehog

        # docker
        ctop
        dive
        lazydocker
        trivy

        # k8s
        kubectl

        # terraform
        terraform
        terraform-docs
        terraformer
        tflint
        tfsec

        # nix
        nixpkgs-fmt

        # shell - linters
        shellcheck
        shfmt

        # markdown
        glow
        nodePackages_latest.markdownlint-cli2
        nodePackages.markdown-link-check

        # json
        fx
        gron
        jq

        # yaml
        yq

        # python
        black
        pipenv
        python310Packages.pipx

        # golang
        go
        golangci-lint

        # java
        temurin-bin

        # node
        nodejs
        nodePackages_latest.npm
        yarn

        # data
        visidata
        sqlfluff

        # database
        pgcli
        mongodb-tools

        # applications
        beancount
        bitwarden-cli
        fava
        hugo
        k6
        topydo
        wakatime

        # aws
        awscli2

        # gcp
        google-cloud-sdk
        docker-credential-gcr

        # IDE
        vscode

        # fonts
        font-awesome
        meslo-lgs-nf
        powerline-fonts
        source-code-pro
      ];

      linux_only = [
        helm
        # docker
        # docker-compose

        # system
        iotop
        ntfs3g
        progress
      ];

      mac_only = [
        # communication
        discord-canary
        slack
        teams
        zoom-us

        # dev tools
        caddy
        iterm2
        jetbrains.datagrip
        jetbrains.idea-ultimate
        postman
      ];
    in
    common ++ (if stdenv.isLinux then linux_only else mac_only);
}
