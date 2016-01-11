#!/bin/bash
#
#        Filename: internet.sh
#     Description: Tool for Internet
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2015-12-29 20:02:45
#        Modified: 2016-01-04 17:49:17
#
########################################################################################################################
# Load Library
source $HOME/.xmonad/data/scripts/main.sh


########################################################################################################################
# Internet | Calculate Link Quality
function __xmdt_internet-calclnkqlty()
{
  local lnkqlty_cur=$(/sbin/iwconfig "$DEVICE_WIFI" | grep -i quality | awk '{print $2}' | cut -d'=' -f2 | cut -d'/' -f1)  # Link Quality: Current
  local lnkqlty_max=$(/sbin/iwconfig "$DEVICE_WIFI" | grep -i quality | awk '{print $2}' | cut -d'=' -f2 | cut -d'/' -f2)  # Link Quality: Maximum
  declare -i local lnkqlty=($lnkqlty_cur*100)/$lnkqlty_max                                                                 # Link Quality

  echo $lnkqlty
}


################################################################################
# Internet | Calculate Signal Level
function __xmdt_internet-calcsgnllvl()
{
  local sgnllvl_cur=$(/sbin/iwconfig "$DEVICE_WIFI" | grep -i quality | awk '{print $4}' | cut -d'=' -f2 | tr -d -)  # Signal Level: Current
  local sgnllvl_max=100                                                                                              # Signal Level: Maximum
  declare -i local sgnllvl=$sgnllvl_max-$sgnllvl_cur

  echo $sgnllvl
}


################################################################################
# Internet | Print Link Quality levels
function __xmdt_internet-showlnkqlty()
{
  local lnkqlty=$(__xmdt_internet-calclnkqlty)  # Link Quality
  local lnkqlty_level_exct=80                   # Link Quality level: excellent
  local lnkqlty_level_fair=20                   # Link Quality level: fair
  local lnkqlty_level_good=50                   # Link Quality level: good

  # Weak
  if (( "$lnkqlty" <= "$lnkqlty_level_fair" )); then
    xmdl_pntr-txt $COLOR_LRED "$lnkqlty%"
  # Fair
  elif (( "$lnkqlty" > "$lnkqlty_level_fair" && "$lnkqlty" <= "$lnkqlty_level_good" )); then
    xmdl_pntr-txt $COLOR_LORANGE "$lnkqlty%"
  # Excellent
  elif (( "$lnkqlty" >= "$lnkqlty_level_exct" )); then
    xmdl_pntr-txt $COLOR_LGREEN "$lnkqlty%"
  # Good
  else
    xmdl_pntr-txt $COLOR_LBLUE "$lnkqlty%"
  fi
}


################################################################################
# Internet | Print Signal Level levels
function __xmdt_internet-showsgnllvl()
{
  local sgnllvl=$(__xmdt_internet-calcsgnllvl)  # Signal Level
  local sgnllvl_level_exct=50                   # Signal Level level: excellent
  local sgnllvl_level_fair=30                   # Signal Level level: fair
  local sgnllvl_level_good=40                   # Signal Level level: good

  # Weak
  if (( "$sgnllvl" <= "$sgnllvl_level_fair" )); then
    xmdl_pntr-txt $COLOR_LRED "$sgnllvl%"
  # Fair
  elif (( "$sgnllvl" > "$sgnllvl_level_fair" && "$sgnllvl" <= "$sgnllvl_level_good" )); then
    xmdl_pntr-txt $COLOR_LORANGE "$sgnllvl%"
  # Excellent
  elif (( "$sgnllvl" >= "$sgnllvl_level_exct" )); then
    xmdl_pntr-txt $COLOR_LGREEN "$sgnllvl%"
  # Good
  else
    xmdl_pntr-txt $COLOR_LBLUE "$sgnllvl%"
  fi
}


################################################################################
# Internet | Check if there are none secured wireless networks
function __xmdt_internet-wifinosecnets()
{
  local wifi_nosecnets=$(/sbin/iwlist "$DEVICE_WIFI" scan | grep "Encryption key:off")  # No secured networks
  local wifi_status=$(ip link | grep "$DEVICE_WIFI" | cut -d' ' -f9)                    # Get Wifi status
  local wifi_status_off="DOWN"                                                          # Wifi status: OFF

  # Wifi device is down 
  if [ "$wifi_status" == "$wifi_status_off" ]; then
    xmdl_pntr-txt $COLOR_LORANGE "W"
  # No networks available
  elif [ -z "$wifi_nosecnets" ]; then
    :
  # Available networks
  elif [ -n "$wifi_nosecnets" ]; then
    xmdl_icns-show $ICON_WIFI_LVL5 
    xmdl_pntr-txt $COLOR_LORANGE "P"
  # Case not handled
  else
    xmdl_pntr-err
  fi
}


################################################################################
# Internet | Print Wifi icons depending from Signal Level and Quality Link levels
function __xmdt_internet-wifishowlvlic()
{
  local lnkqlty=$(__xmdt_internet-calclnkqlty)    # Calculate Link Quality
  local sgnllvl=$(__xmdt_internet-calcsgnllvl)    # Calculate Signal Level
  local wifi_level_fair=60                        # Wifi level: fair
  local wifi_level_good=80                        # Wifi level: good
  local wifi_level_usel=20                        # Wifi level: useless
  local wifi_level_weak=40                        # Wifi level: weak
  declare -i local average=($lnkqlty+$sgnllvl)/2  # Get average from Link 

  # Useless
  if (( "$average" <= "$wifi_level_usel" )); then
    xmdl_icns-show $ICON_WIFI_LVL1
  # Weak
  elif (( "$average" <= "$wifi_level_weak" && "$average" > "$wifi_level_usel" )); then
    xmdl_icns-show $ICON_WIFI_LVL2
  # Fair
  elif (( "$average" <= "$wifi_level_fair" && "$average" > "$wifi_level_weak" )); then
    xmdl_icns-show $ICON_WIFI_LVL3
  # Good
  elif (( "$average" <= "$wifi_level_good" && "$average" > "$wifi_level_fair" )); then
    xmdl_icns-show $ICON_WIFI_LVL4
  # Excellent
  else
    xmdl_icns-show $ICON_WIFI_LVL5
  fi
}


################################################################################
# Internet | Get Wifi status
function __xmdt_internet-wifigetstatus()
{
  local wifi_essid=$(/sbin/iwgetid -r)  # Get ESSID

  # If no ESSID, check if none secured networks available
  if [ -z "$wifi_essid" ]; then
    __xmdt_internet-wifinosecnets
  # ESSID found, print information
  elif [ -n "$wifi_essid" ]; then
    __xmdt_internet-wifishowlvlic
    __xmdt_internet-showlnkqlty
    echo -n "/"
    __xmdt_internet-showsgnllvl
  # Case not handled
  else
    xmdl_pntr-err
  fi
}


################################################################################
# Internet | Get Ethernet status
function __xmdt_internet-ethgetstatus()
{
  local eth_status_1=$(ip link | grep "$DEVICE_ETHERNET" | cut -d' ' -f9)             # Get Ethernet status 1
  local eth_status_2=$(/sbin/ethtool "$DEVICE_ETHERNET" | grep Link | cut -d' ' -f3)  # Get Ethernet status 2
  local eth_status_off_1="DOWN"                                                       # Ethernet status: OFF 1
  local eth_status_off_2="no"                                                         # Ethernet status: OFF 2
  local eth_status_on="yes"                                                           # Ethernet status: ON
  local wifi_status=$(ip link | grep "$DEVICE_WIFI" | cut -d' ' -f9)                  # Get Wifi status
  local wifi_status_off="DOWN"                                                        # Wifi status: OFF

  # Ethernet OFF, check for Wifi
  if [ "$eth_status_2" == "$eth_status_off_2" ]; then
    __xmdt_internet-wifigetstatus
  # Ethernet OFF (Device)
  elif [ "$eth_status_1" == "$eth_status_off_1" ]; then
    xmdl_pntr-txt $COLOR_LORANGE "E"
    # Wifi device is down 
    if [ "$wifi_status" == "$wifi_status_off" ]; then
      xmdl_pntr-txt $COLOR_LORANGE "W"
    fi
  # Ethernet ON
  elif [ "$eth_status_2" == "$eth_status_on" ]; then
    xmdl_icns-show $ICON_ETHERNET | sed 's/.$//'
  # Case not handled
  else
    xmdl_pntr-err
  fi
}


################################################################################
# Internet | Main
function xmdt_internet()
{
  __xmdt_internet-ethgetstatus
}


########################################################################################################################
xmdt_internet
