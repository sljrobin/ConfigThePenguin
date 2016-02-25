#!/bin/bash
#
#        Filename: usb.sh
#     Description: Tool for USB
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-02-07 14:14:49
#        Modified: 2016-02-07 14:21:33
#
########################################################################################################################
# Load Library
source $HOME/.xmonad/data/scripts/main.sh


########################################################################################################################
# USB | Get total of USB devices which are plugged
function __xmdt_usb-getnum()
{
  local usbtot=$(lsusb -v | grep Storage | wc -l)  # Get USB total

  echo $usbtot
}


################################################################################
# USB | Get total of USB devices which are plugged
function __xmdt_usb-shownum()
{
  local usbtot=$(__xmdt_usb-getnum)  # Get USB total

  xmdl_icns-show $ICON_USB
  xmdl_pntr-txt $COLOR_LWHITE "$usbtot"
}



################################################################################
# USB | Main
function xmdt_usb()
{
  __xmdt_usb-shownum
}


########################################################################################################################
xmdt_usb
