{ pkgs, ... }: {
  imports = [ ];
  programs.home-manager.enable = true;

  home.packages = with pkgs; [ iotop progress ];
}
