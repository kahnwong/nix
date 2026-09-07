{ pkgs, ... }:
{
  imports = [ ];
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    bluetui
    bluez
    jolt-tui
    tigervnc
  ];
}
