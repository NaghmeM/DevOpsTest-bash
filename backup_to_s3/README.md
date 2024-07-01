# Backup and Upload Script

This Bash script creates a timestamped backup of a specified directory, compresses it into a `.tar.gz` file, and uploads it to an Amazon S3 bucket. After uploading, the script cleans up the local backup files.

## Prerequisites

- AWS CLI installed and configured.
- Access to an Amazon S3 bucket.
- Bash shell.

## Installation

1. **Install AWS CLI**:
    ```bash
    sudo apt-get update
    sudo apt-get install awscli
    ```

2. **Configure AWS CLI**:
    Run the following command and enter your AWS credentials:
    ```bash
    aws configure
    ```

## Usage

1. **Create the Script File**:
    Create a new file called `backup_to_s3` and add the script content provided below.

2. **Make the Script Executable**:
    ```bash
    chmod +x backup_to_s3
    ```

3. **Run the Script**:
    Provide the directory path and the S3 bucket name as arguments:
    ```bash
    ./backup_to_s3 /path/to/your/directory your-s3-bucket-name
    ```
