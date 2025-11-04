<picture>
    <source media="(prefers-color-scheme: dark)" srcset="images/microchip_logo_white_red.png">
	<source media="(prefers-color-scheme: light)" srcset="images/microchip_logo_black_red.png">
    <img alt="Microchip Logo." src="images/microchip_logo_black_red.png">
</picture>

## dsPIC Bootloader MDFU

## <u>dsPIC33A Single Image CRC UART Boot Demo</u>

### Summary
An example bootloader using the Microchip Device Firmware Update (MDFU) protocol and UART peripheral on the Curiosity Platform Development Board with a dsPIC33AK128MC106 DIM demonstrating the following: 
* Firmware update via UART using Microchip Device Firmware Update (MDFU) protocol 
* Application verification checking using a 32-bit CRC-32Q signature  

### Related Documentation
* [dsPIC33AK128MC106 DIM (EV02G02A)](https://www.microchip.com/en-us/development-tool/ev02g02a)
* [Curiosity Platform Development Board (EV74H48A)](https://www.microchip.com/en-us/development-tool/ev74h48a)
* [MDFU Protocol](http://www.microchip.com/DS50003743)

### Setup And Operation
See [crc_uart_1_image](crc_uart_1_image/) and the associated [README.md](crc_uart_1_image/README.md) files for details on the required hardware, software, setup, and how to run the demo.

## <u>dsPIC33A Multi-Image ECDSA UART Boot Demo</u>

### Summary
An example secure bootloader using the Microchip Device Firmware Update (MDFU) protocol and UART peripheral on the Curiosity Platform Development Board with a dsPIC33AK512MPS512 DIM demonstrating the following: 
* Secure firmware update via UART using Microchip Device Firmware Update (MDFU) protocol 
* Application verification checking using Elliptic Curve Digital Signature Algorithm (ECDSA) with P-384

### Related Documentation
* [Curiosity Platform Development Board (EV74H48A)](https://www.microchip.com/en-us/development-tool/ev74h48a)
* [MDFU Protocol](http://www.microchip.com/DS50003743)

### Setup And Operation
See [secure_boot_uart_2_images](secure_boot_uart_2_images/) and the associated [README.md](secure_boot_uart_2_images/README.md) files for details on the required hardware, software, setup, and how to run the demo.

## <u>dsPIC33A Multi-Image ECDSA CAN Boot Demo</u>

### Summary
An example secure bootloader using the Microchip Device Firmware Update (MDFU) protocol and CAN-FD peripheral on the Curiosity Platform Development Board with a dsPIC33AK512MPS512 DIM demonstrating the following: 
* Secure firmware update via CAN-FD using Microchip Device Firmware Update (MDFU) protocol 
* Application verification checking using Elliptic Curve Digital Signature Algorithm (ECDSA) with P-384

### Related Documentation
* [Curiosity Platform Development Board (EV74H48A)](https://www.microchip.com/en-us/development-tool/ev74h48a)
* [MDFU Protocol](http://www.microchip.com/DS50003743)

### Setup And Operation
See [secure_boot_can_2_images](secure_boot_can_2_images/) and the associated [README.md](secure_boot_can_2_images/README.md) files for details on the required hardware, software, setup, and how to run the demo.



