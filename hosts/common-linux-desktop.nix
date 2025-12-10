{ pkgs, ... }: {
  imports = [ ];
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    bluez
    bluetui
    tigervnc

    # ---- flutter ----
    flutter
  ];
}
