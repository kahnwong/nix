{ pkgs, ... }: {
  imports = [ ];
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    bluez
    bluetui

    # ---- flutter ----
    flutter
  ];
}
