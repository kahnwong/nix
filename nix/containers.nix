{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs;
    [
      # docker
      unstable.ctop
      unstable.dive
      unstable.lazydocker
      unstable.trivy

      # k8s
      unstable.kubectl
      unstable.k9s
      unstable.kompose
      unstable.kubernetes-helm
    ];
}
