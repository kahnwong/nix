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

      # ------- tools ------- #
      nodePackages.markdown-link-check
      #      bitwarden-cli
    ];
  };
}
