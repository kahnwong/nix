#!/bin/bash

####################
# prep debian
####################
if [[ $(uname -s) == 'Linux' ]]; then
	echo "========== Installing build tools and other essentials =========="

	if [ -f /etc/os-release ]; then
		source /etc/os-release

		if [ "$ID" = "ubuntu" ]; then
			sudo apt-get install build-essential g++ gcc libbz2-dev libc-dev liblzma-dev libncurses5-dev \
				libncursesw5-dev libreadline-dev libsqlite3-dev libssl-dev libxml2-dev libxslt1-dev \
				llvm make tk-dev xz-utils zlib1g-dev gcc-aarch64-linux-gnu \
				-y

		elif [ "$ID" = "fedora-asahi-remix" ]; then
			sudo dnf install g++ gcc bzip2-devel glibc-devel xz-devel ncurses-devel \
				readline-devel sqlite-devel openssl-devel libxml2-devel libxslt-devel \
				llvm make tk-devel zlib-devel gcc-aarch64-linux-gnu \
				-y
		fi
	fi
fi
