#!/bin/bash

# Folder source
read -p "Enter the path to the  file: " ENCRYPTED_FILE
FOLDER="ENCRYPTED_FILE"
DEST="$HOME/ENCIMAGES"
# Creates destination directory if it doesn't exist
mkdir -p "$DEST"
# Archive name
ARCHIVE_NAME="encrypted_folder.tar.gz"
# Full path for the archive
FULL_ARCHIVE_PATH="$DEST/$ARCHIVE_NAME"
cd "$(dirname "$FOLDER")" || exit
tar -czf "$FULL_ARCHIVE_PATH" "$(basename "$FOLDER")"
gpg --symmetric --cipher-algo AES256 --output "$FULL_ARCHIVE_PATH.gpg" "$FULL_ARCHIVE_PATH"
rm "$FULL_ARCHIVE_PATH"

echo "The folder has been encrypted $FULL_ARCHIVE_PATH.gpg"

