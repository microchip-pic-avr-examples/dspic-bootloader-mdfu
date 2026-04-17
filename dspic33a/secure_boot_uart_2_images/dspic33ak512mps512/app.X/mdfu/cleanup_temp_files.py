import sys
import os
import json
import argparse

def delete_file(filepath):
    """
    Delete a file at the specified path if it exists.

    Args:
        filepath (str): The path to the file to be deleted.

    Behavior:
        - If the file exists, deletes it and prints a confirmation message.
        - If the file does not exist, prints a message indicating it was skipped.
        - If an error occurs during deletion, prints an error message and exits with code -1.
    """
    try:
        if os.path.exists(filepath):
            os.remove(filepath)
            print(f"Deleted: {filepath}")
        else:
            print(f"File not found (skipped): {filepath}")
    except Exception as e:
        print(f"\033[41mError deleting {filepath}: {e}\033[0m")
        sys.exit(-1)

def main():
    """
    Main function to clean up temporary files listed in a JSON config.

    Command-line Arguments:
        --config (str): Path to the JSON configuration file containing a "temp_files" array.
        --projectDir (str): Path to the project directory.
        --imageDir (str): Path to the image directory.

    Behavior:
        - Loads the list of temporary files from the config file.
        - Constructs the full path for each file using projectDir and imageDir.
        - Attempts to delete each file, printing the result.
        - Prints "Cleanup complete." when finished.
    """
    parser = argparse.ArgumentParser(description="Clean up temporary files listed in a JSON config.")
    parser.add_argument('--config', required=True, help='Path to the JSON configuration file containing a "temp_files" array.')
    parser.add_argument('--projectDir', required=True, help='Path to the project directory.')
    parser.add_argument('--imageDir', required=True, help='Path to the image directory.')
    args = parser.parse_args()

    config_file = args.config
    projectDir = args.projectDir
    imageDir = args.imageDir
    base = os.path.join(projectDir, imageDir)

    with open(config_file, 'r') as f:
        cfg = json.load(f)

    files_to_delete = cfg.get("temp_files", [])

    for filename in files_to_delete:
        filepath = os.path.join(base, filename)
        delete_file(filepath)

    print("Cleanup complete.")

if __name__ == "__main__":
    main()
