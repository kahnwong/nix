{ lib, pkgs, ... }:

let
  goPackages = [
    "kahnwong/article-summarizer"
    "kahnwong/config-init"
    "kahnwong/erp"
    "kahnwong/habit-tracker"
    "kahnwong/invoice"
    "kahnwong/pgconn"
    "kahnwong/repo-switcher"
    "kahnwong/waka"
    "kahnwong/workspace-init"

    # private pkgs
    "kahnwong/bean"
    "kahnwong/billing"
    "kahnwong/docs/utils/docs-utils"
    "kahnwong/firecrack"
    "kahnwong/gcal-tui"
    "kahnwong/grocery"
    "kahnwong/karnwong.me/extras/utils/create-microblog"
    "kahnwong/karnwong.me/extras/utils/create-post"
    "kahnwong/timesheet"
    "kahnwong/togodo"
    "kahnwong/umamit"
  ];

  updateGoPkgs = pkgs.writeShellApplication {
    name = "update-go-pkgs";
    runtimeInputs = [
      pkgs.coreutils
      pkgs.findutils
      pkgs.gcc
      pkgs.git
      pkgs.go_1_27
      pkgs.openssh
    ];

    text = ''
      export GOBIN="$HOME/.local/bin"
      mkdir -p "$GOBIN"
      unset GOROOT GOTOOLDIR
      export GOTOOLCHAIN=local

      # Point SSH directly to your identity key or user config while ignoring system-wide /etc config
      export GIT_SSH_COMMAND="${pkgs.openssh}/bin/ssh -F $HOME/.ssh/config -i $HOME/.ssh/github"

      # Array of Go repositories defined via Home Manager
      GO_PACKAGES=(${builtins.concatStringsSep " " (map (p: "\"${p}\"") goPackages)})

      # For private pkgs
      export GIT_CONFIG_GLOBAL="$HOME/.config/git/profiles/go-install"
      export GOPRIVATE="github.com/kahnwong/*"
      GO_INSTALL_JOBS="''${GO_INSTALL_JOBS:-8}"

      echo "--> Installing/Updating Go packages via Nix..."

      # Variables in the worker command must expand in the child shell.
      # shellcheck disable=SC2016
      printf '%s\n' "''${GO_PACKAGES[@]}" \
        | xargs -n 1 -P "$GO_INSTALL_JOBS" ${pkgs.bash}/bin/bash -c '
            repo="$1"
            echo "--> Processing github.com/$repo..."
            go install "github.com/$repo@latest"
          ' _

      echo "--> Done!"
    '';
  };
in
{
  home.packages = [ updateGoPkgs ];

  home.activation.syncGoPackages = lib.hm.dag.entryAfter [ "linkGeneration" ] ''
    $DRY_RUN_CMD ${updateGoPkgs}/bin/update-go-pkgs
  '';
}
