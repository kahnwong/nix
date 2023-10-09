#!/bin/bash

# nix channel update used to be here. obsolete since we now use flake
nix flake update
./scripts/apply.sh
nix-store --gc # cleanup garbage collection
fisher update
