import os
import subprocess
import json

script_path = os.path.dirname(os.path.realpath(__file__))
keystore_directory = os.path.join(script_path, "keystore")
keystore_path = os.path.join(keystore_directory, "keystore.json")

def path_exists(path):
    """
    Check if the provided file or directory path exists.

    Parameters:
    path (str): The file or directory path to check.

    Returns:
    bool: True if the path exists, False otherwise.
    """
    return os.path.exists(path)

def run(command):
    """
    Run a shell command and print errors if any.

    Parameters:
    command (list): The command and its arguments as a list.

    Returns:
    None
    """
    try:
        subprocess.run(command, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    except subprocess.CalledProcessError as e:
        print(f"An error occurred: {e.stderr.decode().strip()}")

def create_p384_keypair(private_key_path, public_key_path):
    """
    Generate a P-384 ECDSA key pair and save to the specified file paths.

    Parameters:
    private_key_path (str): Path to save the private key file.
    public_key_path (str): Path to save the public key file.

    Returns:
    None
    """
    run([
        "openssl", "ecparam", "-genkey", "-name", "secp384r1", "-noout", "-out", private_key_path
    ])
    run([
        "openssl", "ec", "-in", private_key_path, "-pubout", "-out", public_key_path
    ])

def create_mldsa87_keypair(private_key_path, public_key_path):
    """
    Generate an ML-DSA-87 key pair and save to the specified file paths.

    Parameters:
    private_key_path (str): Path to save the private key file.
    public_key_path (str): Path to save the public key file.

    Returns:
    None
    """
    run([
        "openssl", "genpkey", "-algorithm", "ML-DSA-87", "-out", private_key_path
    ])
    run([
        "openssl", "pkey", "-in", private_key_path, "-pubout", "-out", public_key_path
    ])

def ensure_keystore_directory():
    """
    Ensure that the keystore directory exists. If not, create it.

    Parameters:
    None

    Returns:
    None
    """
    if not path_exists(keystore_directory):
        os.mkdir(keystore_directory)

def main():
    """
    Main function to process keystore.json, generate demo key pairs if needed,
    and print status messages.

    Parameters:
    None

    Returns:
    None
    """
    ensure_keystore_directory()

    if not path_exists(keystore_path):
        print("keystore.json not found in keystore directory.")
        return

    with open(keystore_path, 'r') as file:
        keystore_data = json.load(file)

    keys = keystore_data.get("keys", [])

    for key in keys:
        key_type = key.get("type", "").lower()
        key_name = key.get("name", "")
        key_path = key.get("path")
        demo_flag = key.get("demo", "false").lower() == "true"

        if not key_path:
            print(f"Key '{key_name}' ({key_type}) does not have a 'path' field. Skipping.")
            continue

        public_key_path = os.path.join(keystore_directory, key_path)
        private_key_path = public_key_path.replace("public_key.pem", "private_key.pem")

        if demo_flag and not path_exists(public_key_path):
            print(f"Generating demo key pair for '{key_name}' ({key_type})...")
            if key_type == "secp384r1":
                create_p384_keypair(private_key_path, public_key_path)
            elif key_type == "mldsa87":
                create_mldsa87_keypair(private_key_path, public_key_path)
            else:
                print(f"Unsupported key type: {key_type}. Skipping.")

    print("Demo key generation complete.")

if __name__ == "__main__":
    main()