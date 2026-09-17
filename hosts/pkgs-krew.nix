{ lib, pkgs, ... }:

let
  krewPackages = [
    "argo-apps-viz"
    "crd-wizard"
    "ctx"
    "deprecations"
    "df-pv"
    "images"
    "klock"
    "ktop"
    "node-resource"
    "nodepools"
    "ns"
    "outdated"
    "resource-capacity"
    "status"
  ];

  updateKrewPkgs = pkgs.writeShellApplication {
    name = "update-krew-pkgs";
    runtimeInputs = [
      pkgs.findutils
      pkgs.git
      pkgs.krew
    ];

    text = ''
      KREW_PACKAGES=(${builtins.concatStringsSep " " (map (p: "\"${p}\"") krewPackages)})
      KREW_INSTALL_JOBS="''${KREW_INSTALL_JOBS:-8}"

      echo "--> Installing Krew packages..."

      install_status=0

      if krew update; then
        # Variables in the worker command must expand in the child shell.
        # shellcheck disable=SC2016
        printf '%s\n' "''${KREW_PACKAGES[@]}" \
          | xargs -n 1 -P "$KREW_INSTALL_JOBS" ${pkgs.bash}/bin/bash -c '
              package="$1"
              echo "--> Processing $package..."
              krew install --no-update-index "$package"
            ' _ \
          || install_status=$?
      else
        install_status=$?
      fi

      echo "--> Upgrading Krew packages..."
      upgrade_status=0
      krew upgrade || upgrade_status=$?

      if (( install_status != 0 )); then
        exit "$install_status"
      fi

      exit "$upgrade_status"
    '';
  };
in
{
  home.packages = [ updateKrewPkgs ];

  home.activation.syncKrewPackages = lib.hm.dag.entryAfter [ "linkGeneration" ] ''
    $DRY_RUN_CMD ${updateKrewPkgs}/bin/update-krew-pkgs
  '';
}
