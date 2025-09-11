{ pkgs, ... }: {
  imports = [ ];

  programs.java = {
    enable = true;
    package = pkgs.temurin-bin;
  };

  home = {
    packages = with pkgs; [
      # -------- runtimes & toolchains --------
      # ---- c ----
      uncrustify

      # ---- java ----
      # gradle
      # maven

      # ---- zig ----
      zig_0_13
      #       zls
      #       zlint

      # # ---- gleam ----
      # gleam
      # erlang
      # rebar3

      #      # -------- devops --------
      #      headscale

      # ---- gcp ----
      google-cloud-sdk
      #      docker-credential-gcr
      #      (google-cloud-sdk.withExtraComponents [
      #        google-cloud-sdk.components.gke-gcloud-auth-plugin
      #        # google-cloud-sdk.components.cloud_sql_proxy # this is outdated
      #      ])

      #      # ---- azure ----
      #      azure-cli

      # ---- kubernetes ----
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
      postgresql_17
      #    mongodb-tools

      # ---- monitoring ----
      #      sampler

      # ---- docs ----
      # d2
      # graphviz
      # vhs

      # ---- kubernetes ----
      # k3d # but actual k3s is better

      # ---- tools ----
      #      bitwarden-cli
    ];
  };
}
