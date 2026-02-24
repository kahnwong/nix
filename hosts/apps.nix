{ pkgs, pkgs-stable, ... }:
{
  imports = [
    ../programs/article-summarizer/article-summarizer.nix
    ../programs/erp/erp.nix
    ../programs/habit-tracker/habit-tracker.nix
    ../programs/topydo/topydo.nix
    ../programs/umamit/umamit.nix

    # other binaries
    # bean-add
  ];

  home = {
    packages = with pkgs; [
    ];
  };
}
