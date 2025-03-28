#!/bin/bash
# Enable nullglob so the pattern *.zip expands to nothing if no zip files exist
shopt -s nullglob

# Get an array of all .zip files in the current directory
zip_files=( *.zip )

# Check if any zip files are found
if [ ${#zip_files[@]} -eq 0 ]; then
    echo "No zip files found in the current directory."
    exit 0
fi

# Unzip all zip files first
echo "Unzipping all files..."
for zip in "${zip_files[@]}"; do
    echo "Extracting $zip..."
    # Unzip into a folder named after the zip file (without the .zip extension)
    unzip "$zip" -d "${zip%.zip}"
done

echo "All files have been unzipped."

# Now delete all the .zip files
echo "Deleting all zip files..."
rm -f *.zip
echo "Zip files deleted. Cleanup complete."
