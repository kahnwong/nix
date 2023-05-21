#!/bin/bash

if [ -f ".env" ]; then
	source .env
else
	echo ".env doesn't exist! Please create .env and populate variables."
	exit 1
fi

home-manager switch
