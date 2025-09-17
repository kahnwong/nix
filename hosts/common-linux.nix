{ pkgs, ... }: {
  imports = [ ];
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    iotop
    progress

    # -- desktop --
    bluez
    bluetui
  ];
}
