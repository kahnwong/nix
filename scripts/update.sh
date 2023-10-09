#!/bin/bash

# nix
nix flake update
./scripts/apply.sh
nix-store --gc # cleanup garbage collection

# fish
fisher update
./scripts/common/02_add_fish_completions.sh
