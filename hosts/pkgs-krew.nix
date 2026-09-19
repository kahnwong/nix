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

      echo "--> Updating Krew index..."
      krew update

      echo "--> Installing Krew packages..."

      # Variables in the worker command must expand in the child shell.
      # shellcheck disable=SC2016
      printf '%s\n' "''${KREW_PACKAGES[@]}" \
        | xargs -n 1 -P "$KREW_INSTALL_JOBS" ${pkgs.bash}/bin/bash -c '
            plugin="$1"
            echo "--> Installing $plugin..."
            if ! output=$(krew install --no-update-index "$plugin" 2>&1); then
              printf "%s\n" "$output"
              case "$output" in
                *"does not offer installation for this platform"*)
                  echo "--> Skipping $plugin: platform not supported."
                  ;;
                *)
                  exit 1
                  ;;
              esac
            elif [ -n "$output" ]; then
              printf "%s\n" "$output"
            fi
          ' _

      echo "--> Upgrading Krew packages..."
      krew upgrade
    '';
  };
in
{
  home.packages = [ updateKrewPkgs ];

  home.activation.syncKrewPackages = lib.hm.dag.entryAfter [ "linkGeneration" ] ''
    $DRY_RUN_CMD ${updateKrewPkgs}/bin/update-krew-pkgs
  '';
}
