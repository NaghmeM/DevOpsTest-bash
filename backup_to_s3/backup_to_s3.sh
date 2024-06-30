#!/bin/bash

# Prompt the user for the path
read -p "Enter the path to the directory you want to backup: " dir_path

# Check if the path exists
if [ ! -d "$dir_path" ]; then
  echo "The directory $dir_path does not exist."
  exit 1
fi

# Create a backup directory
backup_dir="${dir_path}_backup"
cp -r "$dir_path" "$backup_dir"

# Compress the backup
tarball="${backup_dir}.tar.gz"
tar -czf "$tarball" -C "$(dirname "$backup_dir")" "$(basename "$backup_dir")"

# Prompt the user for the S3 bucket name
read -p "Enter the S3 bucket name: " bucket_name

# Send the compressed backup to the S3 bucket
aws s3 cp "$tarball" "s3://$bucket_name/"

# Check if the upload was successful
if [ $? -eq 0 ]; then
  echo "Backup and upload successful."
else
  echo "There was an error uploading the file to S3."
fi

# Clean up the backup directory and tarball
rm -rf "$backup_dir" "$tarball"

echo "Backup process completed."
