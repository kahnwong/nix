#!/usr/bin/env bash
set -euo pipefail

NODE_PACKAGES=(
	md-to-pdf
	playwright-chromium
)
NPM_INSTALL_JOBS="${NPM_INSTALL_JOBS:-8}"

npm config set prefix "$HOME/.npm-global"

echo "--> Installing/Updating Node packages via npm..."

# Variables in the worker command must expand in the child shell.
# shellcheck disable=SC2016
printf '%s\n' "${NODE_PACKAGES[@]}" |
	xargs -n 1 -P "$NPM_INSTALL_JOBS" bash -c '
      package="$1"
      echo "--> Processing $package..."
      npm install --global "$package"
    ' _

echo "--> Done!"
