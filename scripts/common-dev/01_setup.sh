#!/bin/bash

####################
# prep debian
####################
if [[ $(uname -s) == 'Linux' ]]; then
	echo "========== Installing build tools and other essentials =========="
	sudo apt-get install build-essential g++ gcc libbz2-dev libc-dev liblzma-dev libncurses5-dev \
		libncursesw5-dev libreadline-dev libsqlite3-dev libssl-dev libxml2-dev libxslt1-dev \
		llvm make tk-dev xz-utils zlib1g-dev \
		-y
fi
