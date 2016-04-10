#!/bin/bash
#
#        Filename: uptime.sh
#     Description: Tool for uptime
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-04-09 15:56:33
#        Modified: 2016-04-10 05:38:11
#
########################################################################################################################
# Load Library
source $HOME/.xmonad/data/scripts/main.sh


########################################################################################################################
# Uptime | Get current uptime
function __xmdt_uptime-get()
{
  local uptime=$(awk '{printf("%d:%02d:%02d:%02d",($1/60/60/24),($1/60/60%24),($1/60%60),($1%60))}' /proc/uptime)  # Get current uptime

  xmdl_icns-show $ICON_UPTIME
  xmdl_pntr-txt $COLOR_DWHITE "$uptime"
}


################################################################################
# Uptime | Main
function xmdt_uptime()
{
  __xmdt_uptime-get
}


########################################################################################################################
xmdt_uptime
