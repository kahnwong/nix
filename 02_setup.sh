#!/bin/bash

export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}

cp home.nix ~/.config/nixpkgs/home.nix
home-manager switch
