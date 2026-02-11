# ====================================
# Local Variables
# ====================================
export reset="[0m"
export red="[41m"

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
    echo $red Python was not found! Install Python3, add it to the system path, and close/reopen MPLAB X. $reset
    exit 1
}

# ------------------------------------

# Function: Error
# 
# Description: Prints out a message with RED background that an error has occurred while generating the keystore files and exits the script.
# ------------------------------------
Error() 
{
    echo ${red} An error has occurred. The keystore and key creation did not complete. $reset
    exit 1
}

# ====================================
# Script Main
# ====================================
# Check that the required tools are installed
python3 -V || MissingPython
python3 verify_openssl.py || Error


# Creates the keystore and demo key pair if not already present 
python3 create_demo_key_files.py || Error

# Generates the source code containing the key data as outlined in the keystore
python3 generate_keystore.py || Error