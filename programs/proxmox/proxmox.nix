{ config, pkgs, lib, ... }:

{
  home.file.".config/proxmox/proxmox.sops.yaml".source = ./proxmox.sops.yaml;

  home.packages = with pkgs;
    [
    ];
}
