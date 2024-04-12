#!/bin/bash

# Asks the user for the path to the encrypted file
read -p "Enter the path to the encrypted file: " ENCRYPTED_FILE

DECRYPT_DEST="$HOME/IMAGES/DECRYPTED"

mkdir -p "$DECRYPT_DEST"

DECRYPTED_ARCHIVE="$DECRYPT_DEST/$(basename "$ENCRYPTED_FILE" .gpg)"

# The command will prompt for the password used during encryption
gpg --output "$DECRYPTED_ARCHIVE" --decrypt "$ENCRYPTED_FILE"

# Navigates to the destination directory
cd "$DECRYPT_DEST" || exit

# Extract the archive
tar -xzf "$(basename "$DECRYPTED_ARCHIVE")"

# Optional: Remove the archive after extraction if you no longer need it
rm "$(basename "$DECRYPTED_ARCHIVE")"

echo "Done, $DECRYPT_DEST."

