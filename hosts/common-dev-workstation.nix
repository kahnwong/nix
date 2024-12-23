{ pkgs, ... }: {
  imports = [ ];

  home = {
    packages = with pkgs; [
      # -------- runtimes & toolchains --------
      # ---- c ----
      uncrustify

      # ---- java ----
      temurin-bin
      # gradle
      # maven

      # -------- devops --------
      # ---- azure ----
      #      azure-cli

      # ---- kubernetes ----
      kubernetes-helm
      #      argocd
      #      helm-dashboard
      #      kdash
      #      kind
      #      pluto

      ## krew
      krew
      ktop
      kube-capacity

      # ---- security ----
      #      grype
      #      syft

      # ---- database ----
      #      postgresql_16
      #    mongodb-tools

      # ---- monitoring ----
      #      sampler

      # ---- docs ----
      #    d2
      # graphviz
      #      charm-freeze
      # vhs

      # ---- kubernetes ----
      # k3d # but actual k3s is better

      # ---- tools ----
      nodePackages.markdown-link-check
      #      bitwarden-cli
      silicon
      pop
      git-cliff
    ];
  };
}
