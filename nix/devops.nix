{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs;
    let
      common = [
        unstable.d2
        unstable.k6
        unstable.keyscope
        unstable.sops
        # unstable.steampipe
        unstable.vhs
      ];

      linux_only = [
      ];

      mac_only = [
        unstable.caddy # on linux it requires extra configs to enable systemd
      ];
    in
    common ++ (if stdenv.isLinux then linux_only else mac_only);
}
