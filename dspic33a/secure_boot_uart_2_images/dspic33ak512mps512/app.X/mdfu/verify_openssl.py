import subprocess
import sys

RED = '\033[41m'
RESET = '\033[0m'

def invalid_openssl_version():
    print(f"{RED}The currently installed version of OpenSSL does not support PQC algorithms. Please install OpenSSL version 3.5 or greater, add it to the system path, and close/reopen MPLAB X.{RESET}")
    print(f"{RED}For OpenSSL installs please check https://wiki.openssl.org/index.php/Binaries{RESET}")
    sys.exit(1)

def missing_openssl():
    print(f"{RED}OpenSSL was not found! Install OpenSSL, add it to the system path, and close/reopen MPLAB X.{RESET}")
    print(f"{RED}For OpenSSL installs please check https://wiki.openssl.org/index.php/Binaries{RESET}")
    sys.exit(1)

def check_openssl_version():
    try:
        result = subprocess.run(['openssl', 'version'], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        if result.returncode != 0:
            missing_openssl()
        ver_str = result.stdout.split()[1]
        parts = ver_str.split('.')
        if len(parts) < 2:
            invalid_openssl_version()
        major = int(parts[0])
        minor = int(parts[1])
        if major < 3 or (major == 3 and minor < 5):
            invalid_openssl_version()
    except Exception:
        invalid_openssl_version()

if __name__ == "__main__":
    check_openssl_version()