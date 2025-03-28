#!/bin/bash
# This script processes each ZIP file in the current directory.
# For each ZIP file, it:
# 1. Creates a temporary folder for extraction.
# 2. Unzips the file into that temporary folder.
# 3. Finds and moves image files (JPG, JPEG, PNG, GIF) into a folder named after the ZIP file.
# 4. Removes the temporary folder and deletes the ZIP file.

# Loop over every .zip file in the current directory.
for zipfile in *.zip; do
    echo "Processing $zipfile..."

    # Create a temporary directory for extraction.
    tempdir="${zipfile%.zip}_temp"
    mkdir "$tempdir"

    # Unzip the contents into the temporary directory.
    unzip "$zipfile" -d "$tempdir" > /dev/null

    # Create a destination directory named after the ZIP file (without .zip).
    destdir="${zipfile%.zip}"
    mkdir -p "$destdir"

    # Find image files (adjust the extensions as needed) and move them to the destination directory.
    find "$tempdir" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) -exec mv {} "$destdir" \;

    # Remove the temporary extraction directory.
    rm -rf "$tempdir"

    # Delete the original ZIP file.
    rm "$zipfile"

    echo "Finished processing $zipfile. Images are now in $destdir."
done
