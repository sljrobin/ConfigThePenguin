#!/bin/bash
#
#        Filename: memory.sh
#     Description: Tool for Memory
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-01-03 17:50:03
#        Modified: 2016-01-04 13:11:00
#
########################################################################################################################
# Load Library
source $HOME/.xmonad/data/scripts/main.sh


########################################################################################################################
# Memory | Calculate a percentage of memory in use
function __xmdt_memory-calc()
{
  local mem_tot=$(free | grep -i mem | awk '{print $2}')  # Get Memory: total
  local mem_use=$(free | grep -i mem | awk '{print $3}')  # Get Memory: used
  declare -i local mem_perc=($mem_use * 100)/$mem_tot     # Get Memory: percentage

  echo -n $mem_perc
}


################################################################################
# Memory | Print Memory levels
function __xmdt_memory-showlvl()
{
  local mem_perc=$(__xmdt_memory-calc)  # Get Memory: percentage
  local mem_level_nor=50                # Memory level: normal
  local mem_level_war=75                # Memory level: warning

  # Normal
  if (( "$mem_perc" <= "$mem_level_nor" )); then
    xmdl_icns-show $ICON_MEMORY
    xmdl_pntr-txt $COLOR_LGREEN "$mem_perc%"
  # Warning
  elif (( "$mem_perc" <= "$mem_level_war" && "$mem_perc" > "$mem_level_nor" )); then
    xmdl_icns-show $ICON_MEMORY
    xmdl_pntr-txt $COLOR_LORANGE "$mem_perc%"
  # Critical
  else
    xmdl_icns-show $ICON_MEMORY
    xmdl_pntr-txt $COLOR_LRED "$mem_perc%"
  fi
}


################################################################################
# Memory | Main
function xmdt_memory()
{
  __xmdt_memory-showlvl
}


########################################################################################################################
xmdt_memory
