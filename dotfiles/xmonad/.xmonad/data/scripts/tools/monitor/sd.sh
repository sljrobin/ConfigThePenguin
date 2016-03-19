#!/bin/bash
#
#        Filename: sd.sh
#     Description: Tool for SD
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-03-12 00:07:57
#        Modified: 2016-03-12 00:25:59
#
########################################################################################################################
# Load Library
source $HOME/.xmonad/data/scripts/main.sh


########################################################################################################################
# SD | Get status
function __xmdt_sd-getstatus()
{
  local sd_status=$(ls /dev/ | grep "mmcblk")   # Get SD status

  # SD: plugged
  if [ -n "$sd_status" ]; then
    echo -n " "
    xmdl_icns-show $ICON_SD
    echo -n "|"
  # SD: none
  elif [ -z "$sd_status" ]; then
    :
  # Case not handled
  else
    xmdl_pntr-err
  fi
}


################################################################################
# SD | Main
function xmdt_sd()
{
  __xmdt_sd-getstatus
}


########################################################################################################################
xmdt_sd
