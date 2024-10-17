#!/bin/sh
# Assignment 1: Finder App
# Author: Asif Iqbal Gazi

# Exit immediately if a command fails (-e) or if an unset variable is used (-u)
set -eu

# Check if the number of argumetns is corect
if [ $# -ne 2 ]; then
  echo "Usage: $0 <file_path> <content>"
  exit 1
fi

# Assign arguments to variables for better readability
file_path=$1
content=$2

# Extract the directory path form the file path
directory_path=$(dirname "$file_path")

# Check if directory exists, and create it if it doesn't
if [ ! -d "$directory_path" ]; then
  mkdir -p "$directory_path"
fi

# Try writing content to the file, overwrite if it exists
if ! echo "$content" > "$file_path"; then
  echo "Error: Failed to write to $file_path"
  exit 1
fi

echo "Content written to $file_path successfully."
exit 0
