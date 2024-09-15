{ pkgs, ... }: {
  imports = [ ];

  home = {
    packages = with pkgs; [
      # java
      temurin-bin
      ## gradle
      ## maven

      ## security
      #      grype
      #      syft
      trivy

      # docs
      #    d2
      # graphviz
      #      charm-freeze
      # vhs

      # kubernetes
      # k3d # but actual k3s is better

      # ------- tools ------- #
      nodePackages.markdown-link-check
      #      bitwarden-cli
    ];
  };
}
