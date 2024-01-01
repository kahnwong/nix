#!/bin/bash

for i in *; do
	zip -rm "$(basename "$i" .txt)".zip "$i"
done
