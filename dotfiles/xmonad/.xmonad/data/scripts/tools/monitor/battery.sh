#!/bin/bash
#
#        Filename: battery.sh
#     Description: Tool for battery
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2015-12-30 15:07:17
#        Modified: 2016-02-19 22:07:44
#
########################################################################################################################
# Load Library
source $HOME/.xmonad/data/scripts/main.sh


########################################################################################################################
# Battery | Print Battery levels when charging
#   $1: percentage
#   $2: time
function __xmdt_battery-showlvlc()
{
  local bat_level_emp=15               # Battery level: empty
  local bat_level_ful=90               # Battery level: full
  local bat_level_low=35               # Battery level: low
  local bat_status_char="Charging"     # Battery status: Charging
  local bat_status_disc="Discharging"  # Battery status: Discharging
  local bat_status_full="Full"         # Battery status: Full

  # Empty
  if (( "$1" <= "$bat_level_emp" )); then
    xmdl_icns-show $ICON_AC
    xmdl_pntr-txt $COLOR_LRED "$1% "
    xmdl_pntr-txt $COLOR_DRED "$2"
  # Low
  elif (( "$1" <= "$bat_level_low" && "$1" > "$bat_level_emp" )); then
    xmdl_icns-show $ICON_AC
    xmdl_pntr-txt $COLOR_LORANGE "$1% "
    xmdl_pntr-txt $COLOR_DORANGE "$2"
  # Full
  elif (( "$1" >= "$bat_level_ful" )); then
    xmdl_icns-show $ICON_AC
    xmdl_pntr-txt $COLOR_LGREEN "$1% "
    xmdl_pntr-txt $COLOR_DGREEN "$2"
  # Normal
  else
    xmdl_icns-show $ICON_AC
    xmdl_pntr-txt $COLOR_LBLUE "$1% "
    xmdl_pntr-txt $COLOR_DBLUE "$2"
  fi
}


################################################################################
# Battery | Print Battery levels when discharging
#   $1: percentage
#   $2: time
function __xmdt_battery-showlvld()
{
  local bat_level_emp=15               # Battery level: empty
  local bat_level_ful=90               # Battery level: full
  local bat_level_low=35               # Battery level: low
  local bat_status_char="Charging"     # Battery status: Charging
  local bat_status_disc="Discharging"  # Battery status: Discharging
  local bat_status_full="Full"         # Battery status: Full

  # Empty
  if (( "$1" <= "$bat_level_emp" )); then
    xmdl_icns-show $ICON_BATLVL_EMPTY
    xmdl_pntr-txt $COLOR_LRED "$1% "
    xmdl_pntr-txt $COLOR_DRED "$2"
  # Low
  elif (( "$1" <= "$bat_level_low" && "$1" > "$bat_level_emp" )); then
    xmdl_icns-show $ICON_BATLVL_LOW
    xmdl_pntr-txt $COLOR_LORANGE "$1% "
    xmdl_pntr-txt $COLOR_DORANGE "$2"
  # Full
  elif (( "$1" >= "$bat_level_ful" )); then
    xmdl_icns-show $ICON_BATLVL_FULL
    xmdl_pntr-txt $COLOR_LGREEN "$1% "
    xmdl_pntr-txt $COLOR_DGREEN "$2"
  # Normal
  else
    xmdl_icns-show $ICON_BATLVL_FULL
    xmdl_pntr-txt $COLOR_LBLUE "$1% "
    xmdl_pntr-txt $COLOR_DBLUE "$2"
  fi
}


################################################################################
# Battery | Handle status
#   $1: status
#   $2: percentage
#   $3: time
function __xmdt_battery-handlestatus()
{
  local bat_status_char="Charging"     # Battery status: Charging
  local bat_status_disc="Discharging"  # Battery status: Discharging

  # Charging
  if [ "$1" == "$bat_status_char" ]; then
    __xmdt_battery-showlvlc $2 $3
  # Discharging
  elif [ "$1" == "$bat_status_disc" ]; then
    __xmdt_battery-showlvld $2 $3
  # Case not handled
  else
    xmdl_pntr-err
  fi
}


################################################################################
# Battery | Show information when batteries total is equal to 1
function __xmdt_battery-showinftot1()
{
  local bat_a_percentage=$(acpi -b | cut -d' ' -f4 | tr -d % | tr -d ,)     # Battery percentage
  local bat_a_status=$(acpi -b | awk '{gsub(/,/,""); print $3}')            # Battery status
  local bat_a_time=$(acpi -b | awk '{gsub(/,/,""); print $5}' | cut -c -5)  # Battery remaining time

  __xmdt_battery-handlestatus $bat_a_status $bat_a_percentage $bat_a_time
}


################################################################################
# Battery | Show information when batteries total is equal to 2
function __xmdt_battery-showinftot2()
{
  local bat_a_percentage=$(acpi -b | sed -n '1p' | cut -d' ' -f4 | tr -d % | tr -d ,)     # Battery A: percentage
  local bat_a_status=$(acpi -b | sed -n '1p' | awk '{gsub(/,/,""); print $3}')            # Battery A: status
  local bat_a_time=$(acpi -b | sed -n '1p' | awk '{gsub(/,/,""); print $5}' | cut -c -5)  # Battery A: remaining time
  local bat_b_percentage=$(acpi -b | sed -n '2p' | cut -d' ' -f4 | tr -d % | tr -d ,)     # Battery B: percentage
  local bat_b_status=$(acpi -b | sed -n '2p' | awk '{gsub(/,/,""); print $3}')            # Battery B: status
  local bat_b_time=$(acpi -b | sed -n '2p' | awk '{gsub(/,/,""); print $5}' | cut -c -5)  # Battery B: remaining time
  local bat_level_ful=90                                                                  # Battery level: full
  local bat_status_char="Charging"                                                        # Battery status: Charging
  local bat_status_disc="Discharging"                                                     # Battery status: Discharging
  local bat_status_full="Full"                                                            # Battery status: Full

  # Battery A: Charging
  if [ "$bat_a_status" == "$bat_status_char" ]; then
    __xmdt_battery-showlvlc $bat_a_percentage $bat_a_time
    xmdl_pntr-txt $COLOR_LGREY " $bat_b_percentage%"
  # Battery A: Discharging
  elif [ "$bat_a_status" == "$bat_status_disc" ]; then
    __xmdt_battery-showlvld $bat_a_percentage $bat_a_time
    xmdl_pntr-txt $COLOR_LGREY " $bat_b_percentage%"
  # Battery B: Charging
  elif [ "$bat_b_status" == "$bat_status_char" ]; then
    __xmdt_battery-showlvlc $bat_b_percentage $bat_b_time
    xmdl_pntr-txt $COLOR_LGREY " $bat_a_percentage%"
  # Battery B: Discharging
  elif [ "$bat_b_status" == "$bat_status_disc" ]; then
    __xmdt_battery-showlvld $bat_b_percentage $bat_b_time
    xmdl_pntr-txt $COLOR_LGREY " $bat_a_percentage%"
  # Battery B: Full
  elif [ "$bat_b_status" == "$bat_status_full" ]; then
    xmdl_pntr-txt $COLOR_LORANGE "Full"
  # Battery A + Battery B: Full
  elif [ "$bat_a_percentage" -ge "$bat_level_ful" ] && [ "$bat_b_percentage" -ge "$bat_level_ful" ]; then
    xmdl_pntr-txt $COLOR_LORANGE "Full"
  # Case not handled
  else
    xmdl_pntr-err
  fi
}


################################################################################
# Battery | Handle all batteries
function __xmdt_battery-handleall()
{
  local bat_total=$(acpi -b | wc -l)  # Get the total of batteries

  # Battery total: 0
  if (( "$bat_total" == "0" )); then
    xmdl_icns-show $ICON_AC
  # Battery total: 1
  elif (( "$bat_total" == "1" )); then
    __xmdt_battery-showinftot1
  # Battery total: 2
  elif (( "$bat_total" == "2" )); then
    __xmdt_battery-showinftot2
  # Case not handled
  else
    xmdl_pntr-err
  fi
}


################################################################################
# Battery | Main
function xmdt_battery()
{
  __xmdt_battery-handleall
}


########################################################################################################################
xmdt_battery
