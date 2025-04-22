#!/bin/bash

# Define variables
DOWNLOAD_URL="https://github.com/XTLS/xray-core/releases/latest/download/Xray-linux-64.zip"
DEST_DIR="/var/lib/marznode"
TMP_DIR="/tmp/xray-download"

# Create temporary directory
mkdir -p "$TMP_DIR"

# Download the file
echo "Downloading Xray..."
wget -O "$TMP_DIR/Xray-linux-64.zip" "$DOWNLOAD_URL"

# Unzip the file
echo "Unzipping..."
unzip -o "$TMP_DIR/Xray-linux-64.zip" -d "$TMP_DIR"

# Copy files to destination directory (replacing only existing files)
echo "Copying files to $DEST_DIR..."
cp -ru "$TMP_DIR/"* "$DEST_DIR/"

# Clean up temporary directory
echo "Cleaning up..."
rm -rf "$TMP_DIR"

# Restart marznode
echo "Restarting marznode..."
marznode restart

echo "Done!"
