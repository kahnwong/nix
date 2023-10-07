#!/bin/bash

if [[ $(uname -s) == 'Darwin' ]]; then
	nix build --experimental-features 'nix-command flakes' && sudo ./result/activate

elif [[ $(uname -s) == 'Linux' ]]; then
	nix build --experimental-features 'nix-command flakes' && ./result/activate
fi
