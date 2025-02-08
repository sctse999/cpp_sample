#!/bin/bash

# Get the current directory name
current_dir=$(basename "$PWD")

# Ask user for the new folder name
echo "Enter the name for the new project folder:"
read new_folder_name

# Create the new directory one level up
parent_dir="$(dirname "$PWD")"
new_path="$parent_dir/$new_folder_name"

# Check if directory already exists
if [ -d "$new_path" ]; then
    echo "Error: Directory $new_path already exists"
    exit 1
fi

# Create new directory and copy files
echo "Creating new project at: $new_path"
mkdir -p "$new_path"

# Run make clean if Makefile exists
if [ -f "Makefile" ] || [ -f "makefile" ]; then
    echo "Running make clean..."
    make clean
fi

# Use rsync to copy files while excluding .git directory and this script
rsync -a --progress \
    --exclude='.git/' \
    --exclude='.git*' \
    --exclude='duplicate_project.sh' \
    --include='.gitignore' \
    "$PWD/" "$new_path/"

echo "Project duplicated successfully to: $new_path" 