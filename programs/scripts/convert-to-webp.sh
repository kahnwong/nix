#!/bin/bash

for image_file in "$(pwd)"/*.{jpg,png,heic}; do
	if [ -f "$image_file" ]; then
		base_name=$(basename -- "$image_file")
		file_name="${base_name%.*}"

		magick "$image_file" "$(pwd)/$file_name.webp"
		echo "Converted $image_file to $(pwd)/$file_name.webp"

		rm "$image_file"
	fi
done
