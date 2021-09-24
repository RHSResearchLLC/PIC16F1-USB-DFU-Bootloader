# Mac OS X Makefile for PIC programming using GPASM
# Copyright (c) 2015, Matt Sarnoff (msarnoff.org)
# v1.0, February 12, 2015
# Released under a 3-clause BSD license: see the accompanying LICENSE file.
#
# Run `make` to build the project as a .hex file.
# Run `make flash` to program the device.
#
# MPLAB X is required if using a PICkit 3 to program the device.
# This Makefile assumes it's installed in /Applications/microchip.

########## Project-specific definitions ##########

# -----------------------------------------------------------------------------
# Configuration
# -----------------------------------------------------------------------------

# USB serial number for the device. 0-65535
SERIAL_NUMBER=1

# The serial number can be omitted, which is better than having duplicates 
HIDE_SERIAL_NUMBER=1

# If true, will hold in bootloader if RA3 is grounded on boot
OPT_BL_FROM_RA3=1

# If true, will hold in bootloader from watchdog reset
OPT_BL_FROM_WATCHDOG=1

# If true, will hold in bootloader when reset instruction is executed
OPT_BL_FROM_RESET_INST=1

# Product bootloader's USB PID/VID
USB_VENDOR_ID = 0x1209
USB_PRODUCT_ID = 0x2002

# Which device to target. Assumes PIC16F prefix
PIC_DEVICE=1454

# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------

# The device name for as. (eg p16f1455. use `make list-devices` if not known)
AS_DEVICE = p16f$(PIC_DEVICE)

# The MDB-specific part number of the chip, used for programming with MDB
# (should be the actual PIC part number, e.g. PIC16LF1454)
MDB_DEVICE = PIC16F$(PIC_DEVICE)

# Project name
OUT = picbl_$(MDB_DEVICE)_$(USB_VENDOR_ID)_$(USB_PRODUCT_ID)

# Source files to assemble
ASM = bootloader.asm

########## Build settings ##########

AS = gpasm
DASM = gpdasm

########## Make rules ##########

HEX = $(OUT).hex

# Link
$(HEX): $(ASM)
	$(AS) -p $(AS_DEVICE) -DPIC_HEADER=$(AS_DEVICE).inc -DOPT_BL_FROM_RA3=$(OPT_BL_FROM_RA3) -DOPT_BL_FROM_WATCHDOG=$(OPT_BL_FROM_WATCHDOG) -DOPT_BL_FROM_RESET_INST=$(OPT_BL_FROM_RESET_INST) -DSERIAL_NUMBER=$(SERIAL_NUMBER) -DHIDE_SERIAL_NUMBER=$(HIDE_SERIAL_NUMBER) -DUSB_VENDOR_ID=$(USB_VENDOR_ID) -DUSB_PRODUCT_ID=$(USB_PRODUCT_ID) -o $(HEX) $(ASM)

# Disassemble
dis: $(HEX)
	$(DASM) -p $(AS_DEVICE) $(HEX)

# List supported device types
list-devices:
	@$(AS) -l

# Clean
clean:
	rm -f *.hex *.cod *.lst

.PHONY: all flash clean list-devices
