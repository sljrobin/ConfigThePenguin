#!/bin/bash
#
#        Filename: bluetooth.sh
#     Description: Tool for Bluetooth
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2015-12-23 11:49:23
#        Modified: 2015-12-30 20:06:59
#
########################################################################################################################
# Load Library
source $HOME/.xmonad/data/scripts/main.sh


########################################################################################################################
# Bluetooth | Get status
function __xmdt_bluetooth-getstatus()
{
  local bt_status=$(/etc/init.d/bluetooth status | grep Active | awk '{ print $2 }')  # Get Bluetooth status
  local bt_status_off="inactive"                                                      # Bluetooth status: OFF
  local bt_status_on="active"                                                         # Bluetooth status: ON

  # Bluetooth: active
  if [ "$bt_status" == "$bt_status_on" ]; then
    echo -n " "
    xmdl_icns-show $ICON_BLUETOOTH
    echo -n "|"
  # Bluetooth: inactive
  elif [ "$bt_status" == "$bt_status_off" ]; then
    :
  # Case not handled
  else
    xmdl_pntr-err
  fi
}


################################################################################
# Bluetooth | Main
function xmdt_bluetooth()
{
  __xmdt_bluetooth-getstatus
}


########################################################################################################################
xmdt_bluetooth
