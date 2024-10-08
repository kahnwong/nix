{ config, pkgs, lib, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    # for treesitter
    plugins = with pkgs.vimPlugins; [ nvim-treesitter ];

    # # default nix vim plugin manager is flaky with vim-wakatime, need to use vim-plug
    # plugins = with pkgs.vimPlugins; [
    #   vim-plug
    # ];

    # extraConfig = (builtins.readFile ./.nvimrc.bak);
  };
}
