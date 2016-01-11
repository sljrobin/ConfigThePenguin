#!/bin/bash
#
#        Filename: disk.sh
#     Description: Tool for Disk
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-01-03 18:21:02
#        Modified: 2016-01-04 13:10:57
#
########################################################################################################################
# Load Library
source $HOME/.xmonad/data/scripts/main.sh


########################################################################################################################
# Disk | Get percentage of space disk that is used
function __xmdt_disk-getspace()
{
  local disk_perc=$(df "$DISK" | sed '1d' | awk '{ print $5 }' | tr -cd '[[:alnum:]]._-')  # Get Disk space in percentage

  echo $disk_perc
}


################################################################################
# Disk | Print Disk levels
function __xmdt_disk-showlvl()
{
  local disk_level_id=50                   # Disk level: ideal
  local disk_level_ok=75                   # Disk level: ok
  local disk_level_wa=85                   # Disk level: warning
  local disk_perc=$(__xmdt_disk-getspace)  # Get Disk space in percentage
  
  # Ideal
  if (( "$disk_perc" <= "$disk_level_id" )); then
    xmdl_icns-show $ICON_DISK
    xmdl_pntr-txt $COLOR_LGREEN "$disk_perc%"
  # OK
  elif (( "$disk_perc" <= "$disk_level_ok" && "$disk_perc" > "$disk_level_id" )); then
    xmdl_icns-show $ICON_DISK
    xmdl_pntr-txt $COLOR_LYELLOW "$disk_perc%"
  # Warning
  elif (( "$disk_perc" <= "$disk_level_wa" && "$disk_perc" > "$disk_level_ok" )); then
    xmdl_icns-show $ICON_DISK
    xmdl_pntr-txt $COLOR_LORANGE "$disk_perc%"
  # Critical
  else
    xmdl_icns-show $ICON_DISK
    xmdl_pntr-txt $COLOR_LRED "$disk_perc%"
  fi
}


################################################################################
# Disk | Main
function xmdt_disk()
{
  __xmdt_disk-showlvl
}


########################################################################################################################
xmdt_disk
