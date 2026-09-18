{ lib, pkgs, ... }:

let
  updateMisePkgs = pkgs.writeShellApplication {
    name = "update-mise-pkgs";
    runtimeInputs = [ pkgs.mise ];

    text = ''
      mise upgrade
      mise prune
    '';
  };
in
{
  home.packages = [ updateMisePkgs ];

  programs.mise = {
    enable = true;

    globalConfig = {
      tools = {
        # need to exec shell to activate target Go version, this behavior doesn't happen in global Go
        # "go" = "latest";
        "nodejs" = "24";
        "opentofu" = "latest";
        "rust" = "latest";
        "terraform" = "latest";
        "uv" = "latest";
      };
    };
  };

  home.activation.syncMisePackages = lib.hm.dag.entryAfter [ "linkGeneration" ] ''
    $DRY_RUN_CMD ${updateMisePkgs}/bin/update-mise-pkgs
  '';
}
