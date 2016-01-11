#!/bin/bash
#
#        Filename: xmd-l_f-icns.sh
#     Description: Functions to use icons
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2015-12-22 17:47:33
#        Modified: 2015-12-31 18:53:09
#
########################################################################################################################
# Check if an icon exists
#   $1: the icon to check
function __xmdl_icns-check()
{
  # If the icon does not exist
  if [ ! -f "$1" ]; then 
    echo -n "Error: the icon '$1' does not exist!"
    return 1
  fi

  return 0
}


########################################################################################################################
# Show an icon
#   $1: the icon to show, use the icon's name only
function xmdl_icns-show()
{
  __xmdl_icns-check "$PATH_ICONS/$1.xbm"
  echo -n "^i($PATH_ICONS/$1.xbm) "
}
