# dsPIC Bootloader MDFU v1.1.0
### Release Highlights

* Initial Release of "dsPIC33A Multi-Image PQC ECDSA Hybrid UART Boot Demo". Refer to the README.md for a summary and execution procedure.
* Updated shared files and scripts in "dsPIC33A Single Image CRC UART Boot Demo", "dsPIC33A Multi-Image ECDSA UART Boot Demo", and "dsPIC33A Multi-Image ECDSA CAN Boot Demo" to match updates made in "dsPIC33A Multi-Image PQC ECDSA Hybrid UART Boot Demo".

### Features Added\Updated

* Initial Release of "dsPIC33A Multi-Image PQC ECDSA Hybrid UART Boot Demo". Refer to the README.md for a summary and execution procedure. 
* Updated shared files and scripts in "dsPIC33A Single Image CRC UART Boot Demo", "dsPIC33A Multi-Image ECDSA UART Boot Demo", and "dsPIC33A Multi-Image ECDSA CAN Boot Demo" to match updates made in "dsPIC33A Multi-Image PQC ECDSA Hybrid UART Boot Demo". 
* Updated Crypto Accelerator Module to v1.3 in "dsPIC33A Multi-Image ECDSA UART Boot Demo" and "dsPIC33A Multi-Image ECDSA CAN Boot Demo".
* Resolved an issue in all demos where a DEBUG build would cause the device to lock up when not running in a debug session.
* Addressed an error in signing_tool.py for both demos, where hashes beginning with 0x00 could result in signing failures.
* Corrected script errors in both demos by eliminating the use of direct calls to Python scripts.

# dsPIC Bootloader MDFU v1.0.0
### Release Highlights

* Addition of "dsPIC33A Single Image CRC UART Boot Demo" and "dsPIC33A Multi-Image ECDSA UART Boot Demo" to the dsPIC Bootloader MDFU repository.
* Initial Release of "dsPIC33A Multi-Image ECDSA CAN Boot Demo". Refer to the README.md for a summary and execution procedure.

### Features Added\Updated

* Addition of "dsPIC33A Single Image CRC UART Boot Demo" and "dsPIC33A Multi-Image ECDSA UART Boot Demo" to the dsPIC Bootloader MDFU repository.
* Initial Release of "dsPIC33A Multi-Image ECDSA CAN Boot Demo". Refer to the README.md for a summary and execution procedure. 

