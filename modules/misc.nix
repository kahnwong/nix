{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs;
    [
      # applications
      unstable.beancount
      unstable.fava

      # static site generator
      unstable.hugo
    ];
}
