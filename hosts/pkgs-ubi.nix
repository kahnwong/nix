{ lib, pkgs, ... }:

let
  ubiProjects = [
    "elliot40404/modo"
    "fawni/def"
    "hardwood-hq/hardwood"
    "mmcdole/kino"
    "mongodb/kingfisher"
  ];

  ubiProjectsLinux = [
    "hengyoush/kyanos"
    "murat-cileli/clyp"
    "pythops/oryx"
  ];

  updateUbiPkgs = pkgs.writeShellApplication {
    name = "update-ubi-pkgs";
    runtimeInputs = [
      pkgs.coreutils
      pkgs.findutils
    ];

    text = ''
      export UBI_INSTALL_DIR="$HOME/.local/bin"
      UBI_INSTALL_JOBS="''${UBI_INSTALL_JOBS:-8}"
      UBI_PROJECTS=(${
        builtins.concatStringsSep " " (
          map (p: "\"${p}\"") (ubiProjects ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux ubiProjectsLinux)
        )
      })

      mkdir -p "$UBI_INSTALL_DIR"

      echo "--> Installing/Updating Ubi packages..."

      # Variables in the worker command must expand in the child shell.
      # shellcheck disable=SC2016
      printf '%s\n' "''${UBI_PROJECTS[@]}" \
        | xargs -n 1 -P "$UBI_INSTALL_JOBS" ${pkgs.bash}/bin/bash -c '
            project="$1"
            echo "--> Processing $project..."
            if ! output=$(/usr/local/bin/ubi --project "$project" --in "$UBI_INSTALL_DIR" 2>&1); then
              printf "%s\n" "$output"
              case "$output" in
                *"could not find a release asset for this OS"*)
                  echo "--> Skipping $project: no release asset for this platform."
                  ;;
                *)
                  exit 1
                  ;;
              esac
            elif [ -n "$output" ]; then
              printf "%s\n" "$output"
            fi
          ' _

      echo "--> Done!"
    '';
  };
in
{
  home.packages = [ updateUbiPkgs ];

  home.activation.syncUbiPackages = lib.hm.dag.entryAfter [ "linkGeneration" ] ''
    $DRY_RUN_CMD ${updateUbiPkgs}/bin/update-ubi-pkgs
  '';
}
