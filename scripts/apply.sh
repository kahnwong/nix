#!/bin/bash

if [[ $(uname -s) == 'Darwin' ]]; then
	nix build && sudo ./result/activate

elif [[ $(uname -s) == 'Linux' ]]; then
	nix build && ./result/activate
fi
