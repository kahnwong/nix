#!/bin/bash

for folder in */; do
	cd "$folder" || exit
	echo "${folder%?} - $(gh pr list | wc -l)"
	cd .. || exit
done
