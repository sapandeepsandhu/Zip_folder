#!/bin/bash

# Create a directory named zip_dir to store all zip files
mkdir -p zip_dir

# Iterate over each folder in the current directory
for dir in */; do
    # Remove the trailing slash from directory name
    folder_name="${dir%/}"
    
    # Zip the folder and save it in the zip_dir directory
    zip -r "zip_dir/${folder_name}.zip" "$folder_name"
done

echo "All folders have been zipped and saved in the 'zip_dir' directory."
