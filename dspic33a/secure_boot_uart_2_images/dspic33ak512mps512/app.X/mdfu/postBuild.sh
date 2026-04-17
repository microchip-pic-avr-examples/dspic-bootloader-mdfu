#!/usr/bin/env sh

# ====================================
# Argument Variables
# ====================================
# ------------------------------------
# Argument(1): compilerDir
#
# Description:
#   Path to the compiler bin directory (absolute or relative)
#   e.g. - "/opt/microchip/xc-dsc/v3.10/bin"
#   NOTE - surround with quotes if there are spaces in the path
# ------------------------------------
compilerDir="$1"

# ------------------------------------
# Argument(2): projectDir
#
# Description:
#   Path to the root project folder (absolute or relative)
#   e.g. - "/home/user/app.X"
#   e.g. - ../..
#   NOTE - surround with quotes if there are spaces in the path
# ------------------------------------
projectDir="$2"

# ------------------------------------
# Argument(3): imageDir
#
# Description:
#   Relative path from the project root to the .hex file
#   e.g. - dist/default/production
#   NOTE - surround with quotes if there are spaces in the path
# ------------------------------------
imageDir="$3"

# ------------------------------------
# Argument(4): imageName
#
# Description:
#   Name of the .hex file to use
#   e.g. - app.X.production.hex
# ------------------------------------
imageName="$4"

# ------------------------------------
# Argument(5): isDebug
#
# Description:
#   String - "true" or "false" string if the project is being build in debug mode
# ------------------------------------
isDebug="$5"

# ------------------------------------
# Argument(6): DFP_DIR
#
# Description:
#   Path to the DFP (Device Family Pack) directory
# ------------------------------------
DFP_DIR="$6"
if [ -d "$DFP_DIR/xc16" ]; then
    DFP_DIR="$DFP_DIR/xc16"
fi

# ====================================
# Local Variables
# ====================================
reset="$(printf '\033[0m')"
cyan="$(printf '\033[46m')"
red="$(printf '\033[41m')"
p384_private_key_path="../../boot.X/mdfu/keystore/p384_private_key.pem"

# ====================================
# Functions
# ====================================
# ------------------------------------
# Function: MissingPython
#
# Description: Prints out a message with RED background that python is not installed and exits the script.
# ------------------------------------
MissingPython()
{
    echo "${red} Python was not found! Install Python3, add it to the system path, and close/reopen MPLAB X. ${reset}"
    exit 1
}

# ------------------------------------
# Function: MissingPrivateKey
#
# Description: Prints out a message with RED background that the private key is not
# present and exits the script. See the private_key_path local variable defined above
# for the location where the private key is expected.
# ------------------------------------
MissingPrivateKey()
{
    echo "${red} The private key was not found! ${reset}"
    echo "${red} See the README.md at the root of this demo for additional details on key generation. ${reset}"
    exit 1
}

# ------------------------------------
# Function: Error
#
# Description: Prints out a message with RED background that an error has occurred processing and signing the header and exits the script.
# ------------------------------------
Error()
{
    echo "${red} An error has occurred. The executable header stuffing and signing process did not complete. ${reset}"
    rm -f "$projectDir/$imageDir/signed_image.bin"
    exit 1
}

# ====================================
# Script Main
# ====================================
if [ "$isDebug" = "true" ]; then
    echo "${cyan} NOTE: You have built in DEBUG mode, therefore a .hex file was not generated. If you would like to generate a .hex file, please build in production mode. For more information, please open MCC and click on the question mark symbol next to the 16-bit Bootloader Library under Resource Management. ${reset}"
    exit 0
fi

# Check that the required tools are installed
python3 -V >/dev/null 2>&1 || MissingPython
python3 verify_openssl.py || Error

# Check that the p384 private key is present
if [ ! -f "$p384_private_key_path" ]; then
    MissingPrivateKey
fi

# If all required tools and files are present, continue with the signing process
# Check to see if MPLAB X(R) XC16 or XCDSC is in use.
# Create OBJ_CPY variable to point to whichever compiler is in use.
OBJ_CPY="$compilerDir/xc16-objcopy"
if [ -f "$compilerDir/xc-dsc-objcopy" ]; then
    OBJ_CPY="$compilerDir/xc-dsc-objcopy"
fi

echo "....................................."
echo "Generating unsigned executable binary"
echo "....................................."
python3 pre_sign_tool.py --config postBuildConfig.json --compilerDir "$OBJ_CPY" --projectDir "$projectDir" --imageDir "$imageDir" --imageName "$imageName" --dfp "$DFP_DIR" || Error

echo ".............................."
echo "Hashing image data"
echo ".............................."
# Hash the executable code
openssl dgst -sha384 "$projectDir/$imageDir/data.bin" || Error
openssl dgst -sha384 -binary -out "$projectDir/$imageDir/data.hash.bin" "$projectDir/$imageDir/data.bin" || Error

# inject the code digest into the executable header
python3 update_header_value.py update_header_value --header_bin "$projectDir/$imageDir/header.bin" --type_code 0x3 --value_bin "$projectDir/$imageDir/data.hash.bin" || Error

echo
echo ".............................."
echo "Generating P-384 signature for image header"
echo ".............................."
# Sign executable header binary file
openssl dgst -sha384 "$projectDir/$imageDir/header.bin" || Error
openssl dgst -sha384 -sign "$p384_private_key_path" -out "$projectDir/$imageDir/p384_signature.der" "$projectDir/$imageDir/header.bin" || Error

# Export signature value
python3 signing_tool.py -export "$projectDir/$imageDir/p384_signature.der" "$projectDir/$imageDir/p384_signature.bin" 384 || Error

echo
echo "Successfully generated signature file: \"$projectDir/$imageDir/p384_signature.bin\""
echo
echo "Signature:"
openssl asn1parse -in "$projectDir/$imageDir/p384_signature.der" -inform DER || Error

echo
echo ".............................."
echo "Creating final binary file"
echo ".............................."
python3 bin_tool.py inject_from_config --config postBuildConfig.json --projectDir "$projectDir" --imageDir "$imageDir" || Error

echo "Fully signed image generated: \"$projectDir/$imageDir/signed_image.bin\""

echo ".............................."
echo "Deleting temporary files"
echo ".............................."
python3 cleanup_temp_files.py --config postBuildConfig.json --projectDir "$projectDir" --imageDir "$imageDir" || Error

exit 0