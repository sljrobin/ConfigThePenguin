#!/bin/bash
#
#        Filename: time.sh
#     Description: Tool for time
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2015-12-31 15:56:33
#        Modified: 2015-12-31 18:12:07
#
########################################################################################################################
# Load Library
source $HOME/.xmonad/data/scripts/main.sh


########################################################################################################################
# Time | Get current date
function __xmdt_time-getdate()
{
  local date=$(date +"%d/%m/%y")  # Get current date

  xmdl_icns-show $ICON_CALENDAR
  xmdl_pntr-txt $COLOR_LWHITE "$date"
}


################################################################################
# Time | Get current hour
function __xmdt_time-gethour()
{
  local hour=$(date +"%T")  # Get current hour

  xmdl_icns-show $ICON_CLOCK 
  xmdl_pntr-txt $COLOR_LWHITE "$hour"
}


################################################################################
# Time | Main
function xmdt_time()
{
  __xmdt_time-gethour
  echo -n " "
  __xmdt_time-getdate
}


########################################################################################################################
xmdt_time
