{ config, pkgs, lib, ... }:

{
  home.username = builtins.getEnv "username";

  # linux: `/home/$username`
  # mac: `/Users/$username`
  home.homeDirectory = builtins.getEnv "home_directory";

  home.stateVersion = "22.11";

  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      unstable = import <unstable> {
        config = config.nixpkgs.config;
      };
    };
  };


  programs.home-manager.enable = true;
  # services.home-manager.autoUpgrade.enable = true;

  fonts.fontconfig.enable = true;

  manual.manpages.enable = false;

  ### configurations
  home.file.".aws/config".source = ./dotfiles/.aws/config;
  home.file.".aws/credentials".source = ./dotfiles/.aws/credentials;
  home.file.".config/fish/conf.d/devops.fish".source = ./dotfiles/.config/fish/conf.d/devops.fish;
  home.file.".config/fish/conf.d/git.fish".source = ./dotfiles/.config/fish/conf.d/git.fish;
  home.file.".config/fish/conf.d/shell.fish".source = ./dotfiles/.config/fish/conf.d/shell.fish;
  home.file.".config/fish/conf.d/topydo.fish".source = ./dotfiles/.config/fish/conf.d/topydo.fish;
  home.file.".config/fish/conf.d/work.fish".source = ./dotfiles/.config/fish/conf.d/work.fish;
  home.file.".config/fish/config.fish".source = ./dotfiles/.config/fish/config.fish;
  home.file.".config/fish/fish_plugins".source = ./dotfiles/.config/fish/fish_plugins;
  home.file.".config/fish/functions/envsource.fish".source = ./dotfiles/.config/fish/functions/envsource.fish;
  home.file.".config/fish/functions/fish_prompt.fish".source = ./dotfiles/.config/fish/functions/fish_prompt.fish;
  home.file.".config/fish/functions/fuck.fish".source = ./dotfiles/.config/fish/functions/fuck.fish;
  home.file.".config/fish/functions/pip.fish".source = ./dotfiles/.config/fish/functions/pip.fish;
  home.file.".config/kitty/kitty.conf".source = ./dotfiles/.config/kitty/kitty.conf;
  home.file.".config/kitty/theme.conf".source = ./dotfiles/.config/kitty/theme.conf;
  home.file.".config/sops/age/keys.txt".source = ./dotfiles/.config/sops/age/keys.txt;
  home.file.".config/starship.toml".source = ./dotfiles/.config/starship.toml;
  home.file.".config/yt-dlp/config".source = ./dotfiles/yt-dlp.conf;
  home.file.".ssh/config".source = ./dotfiles/.ssh/config;
  home.file.".topydo_columns".source = ./dotfiles/.topydo_columns;
  home.file.".topydo".source = ./dotfiles/.topydo;
  home.file.".wakatime.cfg".source = ./dotfiles/.wakatime.cfg;

  ### git
  programs.git = {
    # `git config --global --edit` to see raw config
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
      Plug 'cweagans/vim-taskpaper'
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
      set expandtab

      filetype plugin on

      let g:airline_theme='onedark'
      let g:airline_powerline_fonts = 1
    '';
  };

  home.packages = with pkgs;
    let
      # Packages to always install.
      common = [
        # shell
        unstable.bat
        unstable.broot
        unstable.colordiff
        unstable.difftastic
        unstable.du-dust
        unstable.duf
        unstable.exa
        unstable.fd
        unstable.fish
        unstable.fzf
        ncdu
        unstable.procs
        unstable.ripgrep
        unstable.starship
        unstable.tere
        unstable.thefuck
        unstable.tldr
        unstable.tmux
        unstable.tree
        unstable.watch

        # build env
        gdal

        # downloaders
        unstable.aria
        unstable.wget
        unstable.yt-dlp

        # networking
        unstable.curl
        unstable.dogdns
        unstable.gping
        unstable.httpie
        unstable.rustscan
        unstable.speedtest-cli

        # utilities
        unstable.btop
        unstable.cbonsai
        unstable.ffmpeg
        unstable.graphviz
        unstable.htop
        # instaloader
        unstable.libqalculate
        # rclone
        # restic
        unstable.rsync
        unstable.silicon
        unstable.slides

        # fetch
        unstable.neofetch
        unstable.onefetch

        # git
        delta
        unstable.gh
        unstable.gitleaks
        unstable.pre-commit
        trufflehog

        # docker
        unstable.ctop
        unstable.dive
        unstable.lazydocker
        unstable.trivy

        # k8s
        unstable.kubectl
        unstable.k9s
        unstable.kompose

        # terraform
        unstable.terraform
        unstable.terraform-docs
        unstable.terraformer
        unstable.tflint
        unstable.tfsec
        unstable.infracost

        # nix
        unstable.nixpkgs-fmt

        # shell - linters
        unstable.shellcheck
        unstable.shfmt

        # markdown
        unstable.glow
        unstable.nodePackages_latest.markdownlint-cli
        unstable.nodePackages.markdown-link-check

        # json
        unstable.fx
        unstable.gron
        unstable.jq

        # yaml
        unstable.yq

        # html
        unstable.htmlq

        # python
        unstable.black
        unstable.pipenv
        unstable.python310Packages.pipx
        unstable.ruff

        # golang
        unstable.go
        unstable.golangci-lint

        # # java
        # temurin-bin
        # maven

        # node
        unstable.nodejs
        unstable.nodePackages_latest.npm
        unstable.yarn

        # data
        unstable.visidata
        unstable.sqlfluff

        # database
        unstable.pgcli
        unstable.mongodb-tools

        # applications
        unstable.beancount
        unstable.bitwarden-cli
        unstable.fava
        unstable.hugo
        unstable.wakatime

        # cloud
        unstable.awscli2
        unstable.google-cloud-sdk
        unstable.docker-credential-gcr

        # devops
        unstable.d2
        unstable.k6
        unstable.sops
        unstable.steampipe
        unstable.vhs

        # fonts
        font-awesome
        meslo-lgs-nf
        powerline-fonts
        source-code-pro
        jetbrains-mono
        fira-code
        hack-font
      ];

      linux_only = [
        helm # doesn't work on aarch64-darwin
        # docker
        # docker-compose

        # system
        # fuse
        iotop
        progress
      ];

      mac_only = [
        unstable.caddy # on linux it requires extra configs to enable systemd
        topydo # doesn't work on debian-on-macbook
      ];
    in
    common ++ (if stdenv.isLinux then linux_only else mac_only);
}
