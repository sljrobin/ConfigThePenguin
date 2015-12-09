#!/bin/bash

source $HOME/.xmonad/data/scripts/_core.sh

## VARIABLES ###########################################################################################################
BT_STATUS=$(/etc/init.d/bluetooth status | grep Active | awk '{ print $2 }')
BT_STATUS_OFF="inactive"
BT_STATUS_ON="active"


## FUNCTIONS ###########################################################################################################
# Print Bluetooth status
function print_bt-st()
{
  # Bluetooth: active
  if [ "$BT_STATUS" == "$BT_STATUS_ON" ]; then
    echo -n " "
    print_ic $ICON_BLUETOOTH
    echo -n "|"
  # Bluetooth: inactive
  elif [ "$BT_STATUS" == "$BT_STATUS_OFF" ]; then
    :
  # Case not handled
  else
    gen_error
  fi
}


# Main function
function main()
{
  print_bt-st
}


## MAIN ################################################################################################################
main
