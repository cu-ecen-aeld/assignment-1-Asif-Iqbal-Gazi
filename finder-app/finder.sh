#!/bin/sh
# Assignment 1: Finder App
# Author: Asif Iqbal Gazi

# Exit immediately if a command fails (-e) or if an unset variable is used (-u)
set -eu

# Check if the number of argumetns is corect
if [ $# -ne 2 ]; then
  echo "Usage: $0 <files_dir> <search_str>"
  exit 1
fi

# Assign arguments to variables for better readability
files_dir=$1
search_str=$2

# Check if the first argument is a valid directory 
if [ ! -d "$files_dir" ]; then
  echo "$files_dir is not a valid directory!"
  exit 1
fi

# Find the information we need to output
file_count=$(find "$files_dir" -type f | wc -l)
match_count=$(find "$files_dir" -type f -exec grep -l "$search_str" {} + | wc -l)
echo "The number of files are ${file_count} and the number of matching lines are ${match_count}"
exit 0    
