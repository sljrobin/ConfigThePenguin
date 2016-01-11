#!/bin/bash
#
#        Filename: cpu.sh
#     Description: Tool for CPU
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2016-01-01 20:38:05
#        Modified: 2016-01-04 13:10:58
#
########################################################################################################################
# Load Library
source $HOME/.xmonad/data/scripts/main.sh


########################################################################################################################
# CPU | Get a rounded value of CPU usage
function __xmdt_cpu-getusage()
{
  local cpu_usage=$(cat /proc/stat | grep 'cpu ' | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}')  # Get CPU usage
  local cpu_usage_rounded=$(echo "$cpu_usage" | awk '{printf("%d\n",$1 + 0.5)}')                                # Round CPU usage value

  echo $cpu_usage_rounded
}


################################################################################
# CPU | Print CPU levels
function __xmdt_cpu-showlvl()
{
  local cpu_level_id=30                   # CPU level: ideal
  local cpu_level_ok=50                   # CPU level: ok
  local cpu_usage=$(__xmdt_cpu-getusage)  # Get CPU usage

  # Ideal
  if (( "$cpu_usage" <= "$cpu_level_id" )); then
    xmdl_icns-show $ICON_CPU 
    xmdl_pntr-txt $COLOR_LGREEN "$cpu_usage%"
  # OK
  elif (( "$cpu_usage" <= "$cpu_level_ok" && "$cpu_usage" > "$cpu_level_id" )); then
    xmdl_icns-show $ICON_CPU 
    xmdl_pntr-txt $COLOR_LORANGE "$cpu_usage%"
  # Poor
  else 
    xmdl_icns-show $ICON_CPU 
    xmdl_pntr-txt $COLOR_LRED "$cpu_usage%"
  fi
}


################################################################################
# CPU | Main
function xmdt_cpu()
{
  __xmdt_cpu-showlvl
}


########################################################################################################################
xmdt_cpu
