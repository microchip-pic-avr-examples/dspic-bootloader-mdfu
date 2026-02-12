#!/bin/python3

"""
This script is used to take input .bin files and place them into an output .bin at a specific offset: 
    * The signature of the application header
    * The application header information
    * The all remaining application data
""" 
import os
import sys
import traceback
import argparse
import json

# Add a system path for import as the asndecode script is shared.
sys.path.append("..")

def file_exists(filename):
    """
    Check if a file exists at the given path.

    Args:
        filename (str): Path to the file.

    Returns:
        bool: True if the file exists, False otherwise. Prints an error if not found.
    """
    if os.path.isfile(filename):
        return True
    else:
        print("File does not exist: " + filename +'\n')
        return False

def inject_data(bin_file, offset, data):
    """
    Insert data bytes into a binary file at a specified offset.

    Args:
        bin_file (str): Path to the binary file to be modified.
        offset (int): Offset in the output binary file where the data will be written.
        data (bytes): The byte data to be injected.

    Exits:
        If the file does not exist, prints an error and exits.
    """
    if file_exists(bin_file):
        with open(bin_file, 'r+b') as file:
            file.seek(offset)
            file.write(data)
    else:
        sys.exit(-1)

def read_data(bin_file):
    """
    Read the contents of a binary file and return as bytes.

    Args:
        bin_file (str): Path to the binary file to be read.

    Returns:
        bytes: Contents of the binary file.

    Exits:
        If the file does not exist, prints an error and exits.
    """
    if file_exists(bin_file):
        with open(bin_file, 'rb') as file:
            bin_data = file.read()
            return bin_data
    else:
        sys.exit(-1)

def perform_inject_bin(args):
    """
    Inject data from one .bin file into another at a specified offset.

    Args:
        args (argparse.Namespace): Parsed command-line arguments containing:
            - out_bin (str): Output binary file to inject data into.
            - offset (int): Offset at which to inject the data.
            - in_bin (str): Input binary file containing data to be injected.

    Behavior:
        Reads the data from the input binary file and injects it into the output binary file at the specified offset.
    """
    injection_data = read_data(args.in_bin)
    inject_data(args.out_bin, args.offset, injection_data)

def perform_inject_from_config(args):
    """
    Inject multiple binary files into an output binary file as specified in a JSON config.

    Args:
        args (argparse.Namespace): Parsed command-line arguments containing:
            - config (str): Path to the JSON config file.
            - projectDir (str): Project directory.
            - imageDir (str): Image directory.

    Behavior:
        Reads the config file, iterates over the 'injections' array, and injects each input binary
        into the output binary at the specified offset.
    """
    # Read the config file
    with open(args.config, 'r') as f:
        cfg = json.load(f)
    base_dir = os.path.join(args.projectDir, args.imageDir)
    out_bin = os.path.join(base_dir, cfg["out_bin"])
    for inj in cfg["injections"]:
        in_bin = os.path.join(base_dir, inj["in_bin"])
        offset = int(inj["offset"], 16) if isinstance(inj["offset"], str) else inj["offset"]
        print(f"Injecting {in_bin} into {out_bin} at offset {hex(offset)}")
        injection_data = read_data(in_bin)
        inject_data(out_bin, offset, injection_data)

# Main
if __name__ == "__main__":

    # Defined this class to support verbose help on argument error.
    class MyParser(argparse.ArgumentParser):
        def error(self, message):
            sys.stderr.write('error: %s\n' % message)
            self.print_help()
            sys.exit(2)

    try:
        # Specify arguments.
        parser = MyParser(description=__doc__)
        subparsers = parser.add_subparsers(dest='choice')

        # subparser for .bin file combination   
        inject_bin_parser = subparsers.add_parser('inject_bin', help='Inject the data from the second .bin file into the first .bin file at the specified address.')
        inject_bin_parser.add_argument('--out_bin', help='The .bin file into which data will be injected.', required=True)
        inject_bin_parser.add_argument('--offset', help='The code offset for bin file addressing.', type=lambda x: int(x,16), required=True)
        inject_bin_parser.add_argument('--in_bin', help='The .bin file containing data to be injected.', required=True)

        inject_config_parser = subparsers.add_parser('inject_from_config', help='Inject multiple bins into an output bin as specified in a JSON config.')
        inject_config_parser.add_argument('--config', help='JSON config file specifying injections.', required=True)
        inject_config_parser.add_argument('--projectDir', help='Project directory', required=True)
        inject_config_parser.add_argument('--imageDir', help='Image directory', required=True)

        args = parser.parse_args()

        if args.choice == 'inject_bin':
            perform_inject_bin(args)
            sys(exit(0))
        elif args.choice == 'inject_from_config':
            perform_inject_from_config(args)
            sys.exit(0)

    except Exception as ex:
        print ("\n", traceback.format_exc())
        print(sys.argv)
        parser.print_help()

        sys.exit(1)
