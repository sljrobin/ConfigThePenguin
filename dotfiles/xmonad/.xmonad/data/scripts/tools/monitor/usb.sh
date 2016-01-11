#!/bin/bash

source ../../main.sh

## VARIABLES
USB_STATUS=$(lsusb -v | grep Storage | wc -l)

## FUNCTIONS
# Get the total number of plugged USB devices
function get_number()
{
  xmdl_icns-show $ICON_USB
  echo $USB_STATUS
}


function main()
{
  get_number
} 
# MAIN
main
