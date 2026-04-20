import argparse
import json

def fill_bytes_with_zeros(filename, offset, num_bytes):
    """
    Fill a region of a binary file with zeros.

    Args:
        filename (str): Path to the binary file to modify.
        offset (int): Offset in the file where zero filling should begin.
        num_bytes (int): Number of bytes to fill with zeros.

    Behavior:
        Opens the file in read/write binary mode, seeks to the specified offset,
        and writes num_bytes of 0x00 to the file.
    """
    with open(filename, 'r+b') as f:
        f.seek(offset)
        f.write(b'\x00' * num_bytes)

def main():
    """
    Main function to parse arguments and perform zero filling.

    Command-line Arguments:
        --file: Path to the binary file to modify.
        --config: Path to the JSON file containing a 'zero_fill' array.

    Behavior:
        Reads the zero_fill array from the JSON file, and for each entry,
        fills the specified region in the binary file with zeros.
    """
    parser = argparse.ArgumentParser(description="Fill specified bytes in a binary file with 0x00 using zero_fill array from a JSON file.")
    parser.add_argument('--file', required=True, help='Path to the binary file')
    parser.add_argument('--config', required=True, help='Path to the JSON file containing zero_fill array')

    args = parser.parse_args()

    # Read zero_fill array from JSON file
    with open(args.config, 'r') as jf:
        params = json.load(jf)
        zero_fill_list = params.get('zero_fill', [])
        if not isinstance(zero_fill_list, list):
            raise ValueError("zero_fill must be an array of objects with 'offset' and 'length' fields.")

    for entry in zero_fill_list:
        offset = int(entry['offset'], 16)
        length = int(entry['length'], 16)
        fill_bytes_with_zeros(args.file, offset, length)

if __name__ == "__main__":
    main()
