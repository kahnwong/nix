{ config, pkgs, lib, ... }:

{
  home.file."mullvad/config/mullvad_tailscale.conf".source =
    ./config/mullvad_tailscale.conf;
}
