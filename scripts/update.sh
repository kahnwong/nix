#!/bin/bash

if [ -f ".env" ]; then
	source .env
else
	echo ".env doesn't exist! Please create .env and populate variables."
	exit 1
fi

nix-channel --update # equivalent to apt-get update
home-manager switch
nix-store --gc # cleanup garbage collection
fisher update
