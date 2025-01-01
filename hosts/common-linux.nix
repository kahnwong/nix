{ pkgs, ... }: {
  imports = [
    # ../programs/tmux/tmux.nix
  ];
  programs.home-manager.enable = true;

  home.packages = with pkgs; [ iotop progress ];
}
