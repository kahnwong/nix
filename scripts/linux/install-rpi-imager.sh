#!/bin/bash
set -euo pipefail

SUDO=()
if ((EUID != 0)); then
	if ! command -v sudo >/dev/null 2>&1; then
		echo "Run as root or install sudo first." >&2
		exit 1
	fi
	SUDO=(sudo)
fi

TMP_DIR=$(mktemp -d)
trap 'rm -rf -- "$TMP_DIR"' EXIT

curl --fail --silent --show-error --location --retry 3 \
	-H 'Accept: application/vnd.github+json' \
	https://api.github.com/repos/raspberrypi/rpi-imager/releases/latest \
	-o "$TMP_DIR/release.json"

# Exclude CLI-only packages and other architectures.
DOWNLOAD_URL=$(jq -er '
  [.assets[] | select(.name | test("^rpi-imager_[^/]+_amd64\\.deb$"))]
  | if length == 1 then .[0].browser_download_url
    else error("Expected one Raspberry Pi Imager desktop amd64 .deb asset")
    end
' "$TMP_DIR/release.json")

curl --fail --silent --show-error --location --retry 3 \
	"$DOWNLOAD_URL" -o "$TMP_DIR/rpi-imager.deb"

# Allow APT's sandbox user to read the downloaded package.
chmod 755 "$TMP_DIR"
chmod 644 "$TMP_DIR/rpi-imager.deb"
"${SUDO[@]}" apt-get install -y "$TMP_DIR/rpi-imager.deb"

echo "Raspberry Pi Imager installed. Launch it with: rpi-imager"
