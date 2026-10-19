#!/usr/bin/env bash
set -euo pipefail

GO_PACKAGES=(
	kahnwong/article-summarizer
	kahnwong/config-init
	kahnwong/erp
	kahnwong/habit-tracker
	kahnwong/invoice
	kahnwong/pgconn
	kahnwong/repo-switcher
	kahnwong/waka
	kahnwong/workspace-init

	# private pkgs
	kahnwong/ask
	kahnwong/bean
	kahnwong/billing
	kahnwong/docs/utils/docs-utils
	kahnwong/firecrack
	kahnwong/gcal-tui
	kahnwong/grocery
	kahnwong/karnwong.me/extras/utils/create-post
	kahnwong/timesheet
	kahnwong/togodo
	kahnwong/umamit
)

export GOBIN="$HOME/go/bin"
mkdir -p "$GOBIN"
unset GOROOT GOTOOLDIR
export GOTOOLCHAIN=local

# Use the user's SSH config and GitHub identity instead of the system config.
export GIT_SSH_COMMAND="ssh -F \"$HOME/.ssh/config\" -i \"$HOME/.ssh/github\""

# For private pkgs
export GIT_CONFIG_GLOBAL="$HOME/.config/git/profiles/go-install"
export GOPRIVATE="github.com/kahnwong/*"
GO_INSTALL_JOBS="${GO_INSTALL_JOBS:-8}"

echo "--> Installing/Updating Go packages..."

# Variables in the worker command must expand in the child shell.
# shellcheck disable=SC2016
printf '%s\n' "${GO_PACKAGES[@]}" |
	xargs -n 1 -P "$GO_INSTALL_JOBS" bash -c '
      repo="$1"
      echo "--> Processing github.com/$repo..."
      go install -ldflags="-s -w" "github.com/$repo@latest"
    ' _

echo "--> Done!"
