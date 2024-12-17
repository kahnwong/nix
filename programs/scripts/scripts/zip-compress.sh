#!/bin/bash

for i in *; do
	zip -rm "$(basename "$i")".zip "$i"
done
