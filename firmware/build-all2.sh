#!/bin/sh
make clean
make USB_PRODUCT_ID=0x0000 OPT_BL_FROM_WATCHDOG=0
make USB_PRODUCT_ID=0x0001 OPT_BL_FROM_RESET_INST=0
make USB_PRODUCT_ID=0x0002 OPT_BL_FROM_RA3=0

