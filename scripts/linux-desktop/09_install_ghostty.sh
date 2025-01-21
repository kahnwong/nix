#!/bin/bash

# <https://github.com/mkasberg/ghostty-ubuntu>

# shellcheck disable=SC1091
source /etc/os-release
GHOSTTY_DEB_URL=$(
	curl -s https://api.github.com/repos/mkasberg/ghostty-ubuntu/releases/latest |
		grep -oP "https://github.com/mkasberg/ghostty-ubuntu/releases/download/[^\s/]+/ghostty_[^\s/_]+_amd64_${VERSION_ID}.deb"
)
GHOSTTY_DEB_FILE=$(basename "$GHOSTTY_DEB_URL")
curl -LO "$GHOSTTY_DEB_URL"
sudo dpkg -i "$GHOSTTY_DEB_FILE"
rm "$GHOSTTY_DEB_FILE"

# disable welcome message for fish shell on mac
# <https://stackoverflow.com/questions/15769615/remove-last-login-message-for-new-tabs-in-terminal>
if [[ $(uname -s) == 'Darwin' ]]; then
	touch ~/.hushlogin
fi
