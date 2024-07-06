# Backup and Upload Script

This Bash script creates a timestamped backup of a specified directory, compresses it into a `.tar.gz` file, and uploads it to an Amazon S3 bucket. After uploading, the script cleans up the local backup files. The script uses a `.env` file to securely handle the Restic password.

## Prerequisites

- AWS CLI installed and configured.
- Restic installed.
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

3. **Install Restic**:
    ```bash
    sudo apt-get update
    sudo apt-get install restic
    ```
## Setup

1. **Initialize the Restic Repository**:
    Configure your S3 bucket for use with Restic by setting the necessary environment variables for your AWS credentials. This step only needs to be done once:
    ```bash
    export RESTIC_REPOSITORY="s3:s3.amazonaws.com/your-s3-bucket-name"
    export RESTIC_PASSWORD="your-restic-password"
    restic init
    ```

    **Important**: Please note that knowledge of your password is required to access the repository. Losing your password means that your data is irrecoverably lost. For more details, see the [Restic documentation on preparing a new repository](https://restic.readthedocs.io/en/stable/030_preparing_a_new_repo.html#amazon-s3).

2. **Create a `.env` File**:
    - Create a file named `.env` in the same directory as your script:
      ```bash
      nano .env
      ```

    - Add the following content to the `.env` file:
      ```env
      RESTIC_PASSWORD="your-restic-password"
      ```

    - Secure the `.env` file by setting its permissions so that only the owner can read it:
      ```bash
      chmod 600 .env
      ```

## Usage

1. **Create the Script File**:
    Create a new file called `incremental_backup` and add the script content provided below.

2. **Make the Script Executable**:
    ```bash
    chmod +x incremental_backup
    ```

3. **Run the Script**:
    Provide the directory path and the S3 bucket name as arguments:
    ```bash
    ./incremental_backup /path/to/your/directory your-s3-bucket-name
    ```
