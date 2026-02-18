import sys
import os
import subprocess
import json
import argparse

def run_cmd(cmd):
    """
    Run a shell command and exit if it fails.

    Args:
        cmd (str): The command to execute.

    Behavior:
        Prints the command being run. If the command fails (non-zero return code),
        prints an error message and exits the script with error code -1.
    """
    print(f"Running: {cmd}")
    result = subprocess.run(cmd, shell=True)
    if result.returncode != 0:
        print(f"\033[41mError running: {cmd}\033[0m")
        sys.exit(-1)

def format_range(start, end, prefix='r'):
    """
    Format a memory range string for use with hexmate.

    Args:
        start (int): Start address (integer).
        end (int): End address (integer).
        prefix (str): Prefix for the range string (default 'r').

    Returns:
        str: Formatted range string, e.g., 'r81A000-84CFFF'.
    """
    return f"{prefix}{start:X}-{end:X}"

def get_paths(projectDir, imageDir, imageName):
    """
    Generate a dictionary of file paths used in the post-build process.

    Args:
        projectDir (str): Project directory path.
        imageDir (str): Image directory path.
        imageName (str): Name of the input hex file.

    Returns:
        dict: Dictionary mapping logical names to file paths.
    """
    base = os.path.join(projectDir, imageDir)
    return {
        "hex_in": os.path.join(base, imageName),
        "filled_hex": os.path.join(base, "filled.hex"),
        "header_hex": os.path.join(base, "header.hex"),
        "header_bin": os.path.join(base, "header.bin"),
        "data_hex": os.path.join(base, "data.hex"),
        "data_bin": os.path.join(base, "data.bin"),
        "presigned_hex": os.path.join(base, "presigned_image.hex"),
        "signed_bin": os.path.join(base, "signed_image.bin"),
    }

def get_address_range(section_cfg):
    """
    Get start and end addresses from a config dictionary with 'origin' and 'length'.

    Args:
        section_cfg (dict): Dictionary with 'origin' and 'length' keys (hex strings).

    Returns:
        tuple: (start, end) as integers.
    """
    start = int(section_cfg["origin"], 16)
    length = int(section_cfg["length"], 16)
    end = start + length - 1
    return start, end

def get_executable_region(cfg):
    """
    Compute the full executable region start and end addresses.

    Args:
        cfg (dict): The loaded JSON configuration dictionary.

    Returns:
        tuple: (start, end) as integers for the full executable region.
    """
    start = int(cfg["executable_signature"]["origin"], 16)
    length_sig = int(cfg["executable_signature"]["length"], 16)
    length_hdr = int(cfg["executable_header"]["length"], 16)
    length_data = int(cfg["executable_data"]["length"], 16)
    total_length = length_sig + length_hdr + length_data
    if "ivt" in cfg:
        length_ivt = int(cfg["ivt"]["length"], 16)
        total_length += length_ivt
    end = start + total_length - 1
    return start, end

def fill_memory(exec_start, exec_end, hex_in, filled_hex):
    """
    Fill unimplemented memory locations in the input hex file with 0x00.

    Args:
        exec_start (int): Start address of the executable region.
        exec_end (int): End address of the executable region.
        hex_in (str): Path to the input hex file.
        filled_hex (str): Path to the output filled hex file.

    Behavior:
        Uses hexmate to fill the specified address range with 0x00.
    """
    fill_value = 0x00
    fill_range = format_range(exec_start, exec_end)
    fill_arg = f"w1:{fill_value}@0x{exec_start:X}:0x{exec_end:X}"
    run_cmd(f'hexmate {fill_range},"{hex_in}" -O"{filled_hex}" -FILL={fill_arg}')

def generate_hex_and_bin(section_cfgs, filled_hex, hex_out, bin_out, obj_cpy):
    """
    Generate a section hex file and its corresponding binary file.

    Args:
        section_cfgs (dict or list of dict): One or more dictionaries with 'origin' and 'length' keys (hex strings).
        filled_hex (str): Path to the filled hex file.
        hex_out (str): Path to the output section hex file.
        bin_out (str): Path to the output section binary file.
        obj_cpy (str): Path to the objcopy tool.

    Behavior:
        Uses hexmate to extract the section(s) and objcopy to convert to binary.
    """
    if isinstance(section_cfgs, dict):
        section_cfgs = [section_cfgs]

    starts_ends = [get_address_range(cfg) for cfg in section_cfgs]
    min_start = min(start for start, _ in starts_ends)
    max_end = max(end for _, end in starts_ends)

    section_range = format_range(min_start, max_end)
    run_cmd(f'hexmate {section_range},"{filled_hex}" -O"{hex_out}"')
    run_cmd(f'"{obj_cpy}" -I ihex -O binary "{hex_out}" "{bin_out}"')

def generate_binary(exec_start, exec_end, filled_hex, presigned_hex, signed_bin, obj_cpy):
    """
    Generate the presigned hex and final signed binary files.

    Args:
        exec_start (int): Start address of the executable region.
        exec_end (int): End address of the executable region.
        filled_hex (str): Path to the filled hex file.
        presigned_hex (str): Path to the output presigned hex file.
        signed_bin (str): Path to the output signed binary file.
        obj_cpy (str): Path to the objcopy tool.

    Behavior:
        Uses hexmate to extract the executable range and objcopy to convert to binary.
    """
    presigned_range = format_range(exec_start, exec_end)
    run_cmd(f'hexmate {presigned_range},"{filled_hex}" -O"{presigned_hex}"')
    run_cmd(f'"{obj_cpy}" -I ihex -O binary "{presigned_hex}" "{signed_bin}"')

def main():
    """
    Main function to run the post-build process.

    Command-line Arguments:
        --config (str): Path to the JSON configuration file.
        --compilerDir (str): Path to the objcopy tool.
        --projectDir (str): Path to the project directory.
        --imageDir (str): Path to the image directory.
        --imageName (str): Name of the input hex file.

    Behavior:
        Loads configuration, generates all required hex and bin files, and prints completion message.
    """
    parser = argparse.ArgumentParser(description="Post-build tool to generate and process hex/bin files.")
    parser.add_argument('--config', required=True, help='Path to the JSON configuration file.')
    parser.add_argument('--compilerDir', required=True, help='Path to the objcopy tool.')
    parser.add_argument('--projectDir', required=True, help='Path to the project directory.')
    parser.add_argument('--imageDir', required=True, help='Path to the image directory.')
    parser.add_argument('--imageName', required=True, help='Name of the input hex file.')
    args = parser.parse_args()

    config_file = args.config
    obj_cpy = args.compilerDir
    projectDir = args.projectDir
    imageDir = args.imageDir
    imageName = args.imageName

    with open(config_file, 'r') as f:
        cfg = json.load(f)

    paths = get_paths(projectDir, imageDir, imageName)

    # Compute full executable region
    exec_start, exec_end = get_executable_region(cfg)

    # Fill in unimplemented memory locations (full executable region)
    fill_memory(exec_start, exec_end, paths["hex_in"], paths["filled_hex"])

    # Generate header.hex and header.bin
    generate_hex_and_bin(cfg["executable_header"], paths["filled_hex"], paths["header_hex"], paths["header_bin"], obj_cpy)

    # Generate data.hex and data.bin
    sections = []
    sections.append(cfg["executable_data"])
    if "ivt" in cfg:
        sections.append(cfg["ivt"])
    generate_hex_and_bin(sections, paths["filled_hex"], paths["data_hex"], paths["data_bin"], obj_cpy)

    # Generate presigned_image.hex and signed_image.bin (full executable region)
    generate_binary(exec_start, exec_end, paths["filled_hex"], paths["presigned_hex"], paths["signed_bin"], obj_cpy)

    print("Hex and bin processing complete.")

if __name__ == "__main__":
    main()
