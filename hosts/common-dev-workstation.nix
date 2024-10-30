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

      # ---- python ----
      # gdal # for build env
      black
      ruff

      # -------- devops --------
      # gcp
      docker-credential-gcr
      (google-cloud-sdk.withExtraComponents [
        google-cloud-sdk.components.gke-gcloud-auth-plugin
        # google-cloud-sdk.components.cloud_sql_proxy # this is outdated
      ])

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
      trivy

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
      hugo
      silicon
      pop
      git-cliff
      hyperfine
    ];
  };
}
