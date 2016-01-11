#!/bin/bash
#
#        Filename: brightness.sh
#     Description: Tool for brightness
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2015-12-30 18:22:23
#        Modified: 2015-12-31 15:54:34
#
########################################################################################################################
# Load Library
source $HOME/.xmonad/data/scripts/main.sh


########################################################################################################################
# Brightness | Calculate brightness in percent
function __xmdt_brightness-calc()
{
  declare -i local brightness=($BRIGHTNESS_CURRENT*100)/$BRIGHTNESS_MAXIMAL
  
  xmdl_icns-show $ICON_BRIGHTNESS 
  echo "$brightness%"
}


################################################################################
# Brightness | Main 
function xmdt_brightness()
{
  __xmdt_brightness-calc
}


########################################################################################################################
xmdt_brightness
