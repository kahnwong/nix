#!/bin/bash

# Loop through all JPG/PNG files in the input folder
for image_file in "$(pwd)"/*.{jpg,png,heic}; do
	if [ -f "$image_file" ]; then
		# Get the file name without extension
		base_name=$(basename -- "$image_file")
		file_name="${base_name%.*}"

		# Convert JPG/PNG to WebP
		convert "$image_file" "$(pwd)/$file_name.webp"
		echo "Converted $image_file to $(pwd)/$file_name.webp"

		# Remove original image file
		rm "$image_file"
	fi
done
