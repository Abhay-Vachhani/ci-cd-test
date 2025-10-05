#!/bin/bash
set -e

# Read the current version
VERSION_FILE="version.txt"
if [ ! -f "$VERSION_FILE" ]; then
  echo "1" > "$VERSION_FILE"
fi

CURRENT_VERSION=$(cat "$VERSION_FILE")
NEW_VERSION=$((CURRENT_VERSION + 1))

# Update the version file
echo "$NEW_VERSION" > "$VERSION_FILE"

# Get date and time in IST (format: YYYY-MM-DD-HH:MMAM/PMIST)
DATE_TIME=$(TZ='Asia/Kolkata' date +"%Y-%m-%d-%I:%M%pIST")

# Commit message
COMMIT_MSG="Version-${NEW_VERSION}-${DATE_TIME}"

# Git operations
git add "$VERSION_FILE"
git commit -m "$COMMIT_MSG"
git push origin master

echo "✅ Updated version to $NEW_VERSION and pushed with commit message:"
echo "$COMMIT_MSG"
