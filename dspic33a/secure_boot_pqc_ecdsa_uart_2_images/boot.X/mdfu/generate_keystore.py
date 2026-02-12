import os
import sys
import json
import subprocess

keystore_directory = "keystore"
keystore_file = "keystore.json"
keystore_path = os.path.join(keystore_directory, keystore_file)

generated_keystore_directory = "../"
generated_keystore_file = "generated_keystore.S"
generated_keystore_path = os.path.join(generated_keystore_directory, generated_keystore_file)

DEMO_KEY_WARNING = "NOTE - THE GENERATED KEYS FOR THIS DEMO ARE NOT SECURE AND ARE FOR DEMO PURPOSES ONLY!! Do not use these keys in production. For production purposes, generate secure key pairs using a secure key generation system, such as an HSM. See demo documentation for more details."

YELLOW = '\033[43m'
RED = '\033[41m'
RESET = '\033[0m'

generated_keystore_description = """
/* 
********************************************************************************
*        !!THIS FILE IS AUTO GENERATED AND SHOULD NOT BE MANUALLY EDITED!!     *
*                                                                              *
* For details on how to update the key contained in this file, see the         *
* README.md located at the root of this demo.                                  *
********************************************************************************

File auto-generated based on the parameters contained in keystore.json. 
Contains the public key used for verifying the authenticity and integrity of the 
signature used to sign the application code. 
 */
"""
config_file_includes = '#include "mdfu/mdfu_config.h"'
section_directive = '.section .public_key, code, address(MDFU_CONFIG_KEYSTORE_DATA_ORIGIN), keep'

def file_exists(file_path):
    """
    Check if the provided file exists.

    Parameters:
    file_path (str): Path to the file.

    Returns:
    bool: True if the file exists, False otherwise.
    """
    return os.path.exists(file_path)

def run(command):
    """
    Run a shell command and print errors if any.

    Parameters:
    command (list): Command and arguments as a list.

    Returns:
    subprocess.CompletedProcess: The result of the subprocess run.
    """
    try:
        return subprocess.run(command, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    except subprocess.CalledProcessError as e:
        print(f"An error occurred: {e.stderr.strip()}") 

def get_public_key_hex(pem_file, has_compression_byte):
    """
    Extract the public key to a byte list of hexadecimal values.

    Parameters:
    pem_file (str): Public key in .pem format.
    has_compression_byte (bool): Indicates if the key includes a compression byte.

    Returns:
    list: Public key as a list of byte values.
    """
    temp_der = "temp.der"
    command = [
        "openssl", "pkey", "-pubin", "-in", pem_file, "-outform", "DER", "-out", temp_der
    ]
    run(command)

    with open(temp_der, 'rb') as f:
        der_data = f.read()
    os.remove(temp_der)

    if has_compression_byte:
        compression_byte = der_data[23]
        pub_key_vals = der_data[23:]
        if compression_byte != 0x04:
            print("Compressed public keys are not currently supported. Please provide an uncompressed key.")
            sys.exit(-1) 
    else:
        pub_key_vals = der_data[22:]

    return list(pub_key_vals)

def get_key_field(keys, index, field):
    """
    Get the specified field of a public key as specified by the keystore.

    Parameters:
    keys (list): List of key dictionaries.
    index (int): Index of the key.
    field (str): Field name of the item to get.

    Returns:
    str: Field value.
    """
    field_value = ""
    if index < len(keys):
        key = keys[index]
        field_value = key.get(field, "")
    return field_value

def write_file_header(file, has_demo_key):
    """
    Write the header, includes, section directive, and demo warning if needed.

    Parameters:
    file (file object): The file to write to.
    has_demo_key (bool): Whether to include the demo key warning.
    """
    file.write(generated_keystore_description + "\n")
    file.write(config_file_includes + "\n")
    file.write(section_directive + "\n")
    file.write("\n")
    if has_demo_key:
        file.write(f"#warning \"{DEMO_KEY_WARNING}\"\n")
        print(f"{YELLOW}{DEMO_KEY_WARNING}{RESET}")

def write_key_comment(file, key_name, key_type):
    """
    Write a comment for the key in the output file.

    Parameters:
    file (file object): The file to write to.
    key_name (str): The name of the key.
    key_type (str): The type of the key.
    """
    file.write(f"    ; {key_name} ({key_type})\n")

def write_key_bytes(file, byte_list):
    """
    Write the key bytes as .long directives in the output file.

    Parameters:
    file (file object): The file to write to.
    byte_list (list): List of byte values representing the key.
    """
    for i in range(0, len(byte_list), 4):
        chunk = byte_list[i:i+4]
        while len(chunk) < 4:
            chunk.append(0)
        long_value = (chunk[3] << 24) | (chunk[2] << 16) | (chunk[1] << 8) | chunk[0]
        file.write(f"    .long 0x{long_value:08x}\n")

def process_key(keys, key_index, file):
    """
    Process a single key: write comment, extract bytes, and write bytes.

    Parameters:
    keys (list): List of key dictionaries from keystore.json.
    key_index (int): Index of the key to process.
    file (file object): The file to write to.
    """
    key_name = get_key_field(keys, key_index, "name")
    key_type = get_key_field(keys, key_index, "type")
    key_path = get_key_field(keys, key_index, "path")

    write_key_comment(file, key_name, key_type)

    public_key_path = os.path.join(keystore_directory, key_path)
    if not file_exists(public_key_path):
        print(f"{RED}Public key file '{public_key_path}' does not exist. Skipping this key.{RESET}")
        return

    if key_type.lower() == "mldsa87":
        byte_list = get_public_key_hex(public_key_path, False)
    else:
        byte_list = get_public_key_hex(public_key_path, True)

    write_key_bytes(file, byte_list)

def write_hex_to_s_file(keys, file_name):
    """
    Write all public keys as byte lists of hex values to a .S file using .long directive.

    Parameters:
    keys (list): List of key dictionaries from keystore.json.
    file_name (str): Name of the .S file to write to.
    """
    has_demo_key = any(get_key_field(keys, idx, "demo") == "true" for idx in range(len(keys)))

    with open(file_name, 'w') as file:
        write_file_header(file, has_demo_key)
        for key_index in range(len(keys)):
            process_key(keys, key_index, file)

def exit(error_message):
    """
    Exit the program with an error message.

    Parameters:
    error_message (str): The error message to display.
    """
    sys.exit(f"{RED}{error_message}{RESET}");

def generate_keystore_source():
    """
    Generate the keystore source file from the associated keystore files.

    Parameters:
    None

    Returns:
    None
    """
    if not file_exists(keystore_path):
        exit("The keystore file does not exist. Exiting.")

    with open(keystore_path, 'r') as file:
        data = json.load(file)
        keys = data.get('keys', [])

    if not keys:
        exit("No keys found in the keystore. Exiting.")

    write_hex_to_s_file(keys, generated_keystore_path)

def main():
    print("Creating the generated keystore.")
    generate_keystore_source()

if __name__ == "__main__":
    main()
