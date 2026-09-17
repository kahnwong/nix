{ lib, pkgs, ... }:

let
  ubiProjects = [
    "elliot40404/modo"
    "fawni/def"
    "hardwood-hq/hardwood"
    "mmcdole/kino"
    "mongodb/kingfisher"
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
      UBI_PROJECTS=(${builtins.concatStringsSep " " (map (p: "\"${p}\"") ubiProjects)})

      mkdir -p "$UBI_INSTALL_DIR"

      echo "--> Installing/Updating Ubi packages..."

      # Variables in the worker command must expand in the child shell.
      # shellcheck disable=SC2016
      printf '%s\n' "''${UBI_PROJECTS[@]}" \
        | xargs -n 1 -P "$UBI_INSTALL_JOBS" ${pkgs.bash}/bin/bash -c '
            project="$1"
            echo "--> Processing $project..."
            /usr/local/bin/ubi --project "$project" --in "$UBI_INSTALL_DIR"
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
