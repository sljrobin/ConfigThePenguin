#!/bin/bash

source $HOME/.xmonad/data/scripts/_core.sh

## VARIABLES
USB_STATUS=$(lsusb -v | grep Storage | wc -l)

## FUNCTIONS
# Get the total number of plugged USB devices
function get_number()
{
  print_ic $ICON_USB 
  echo $USB_STATUS
}


function main()
{
  get_number
} 
# MAIN
main
