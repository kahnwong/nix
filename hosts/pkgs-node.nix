{ lib, pkgs, ... }:

let
  nodePackages = [
    "md-to-pdf"
    "playwright-chromium"
  ];

  updateNodePkgs = pkgs.writeShellApplication {
    name = "update-node-pkgs";
    runtimeInputs = [
      pkgs.findutils
      pkgs.nodejs_24
    ];

    text = ''
      NODE_PACKAGES=(${builtins.concatStringsSep " " (map (p: "\"${p}\"") nodePackages)})
      NPM_INSTALL_JOBS="''${NPM_INSTALL_JOBS:-8}"

      npm config set prefix "$HOME/.npm-global"

      echo "--> Installing/Updating Node packages via npm..."

      # Variables in the worker command must expand in the child shell.
      # shellcheck disable=SC2016
      printf '%s\n' "''${NODE_PACKAGES[@]}" \
        | xargs -n 1 -P "$NPM_INSTALL_JOBS" ${pkgs.bash}/bin/bash -c '
            package="$1"
            echo "--> Processing $package..."
            npm install --global "$package"
          ' _

      echo "--> Done!"
    '';
  };
in
{
  home.packages = [ updateNodePkgs ];

  home.activation.syncNodePackages = lib.hm.dag.entryAfter [ "linkGeneration" ] ''
    $DRY_RUN_CMD ${updateNodePkgs}/bin/update-node-pkgs
  '';
}
