#!/bin/bash
# Notes
#   Link Quality: general quality of the reception
#   Signal Level: signal strength at the receiver
#                   >-50 dBm: excellent
#                   -50 to -60 dBm: good
#                   -60 to -70 dBm: fair
#                   <-70 dBm: weak

source $HOME/.xmonad/data/scripts/_core.sh

## VARIABLES ###########################################################################################################
ESSID=$(/sbin/iwgetid -r)                                                                                               # ESSID
ETH_OFF_1="DOWN"                                                                                                        # Ethernet status 1: OFF
ETH_OFF_2="no"                                                                                                          # Ethernet status 2: OFF
ETH_ON="yes"                                                                                                            # Ethernet status: ON
ETH_STATUS_1=$(ip link | grep "$DEVICE_ETHERNET" | cut -d' ' -f9)                                                       # Ethernet status 1
ETH_STATUS_2=$(/sbin/ethtool "$DEVICE_ETHERNET" | grep Link | cut -d' ' -f3)                                            # Ethernet status 2
LNKQLTY_CURRENT=$(/sbin/iwconfig "$DEVICE_WIFI" | grep -i quality | awk '{print $2}' | cut -d'=' -f2 | cut -d'/' -f1)   # Current Link Quality
LNKQLTY_MAXIMUM=$(/sbin/iwconfig "$DEVICE_WIFI" | grep -i quality | awk '{print $2}' | cut -d'=' -f2 | cut -d'/' -f2)   # Maximal Link Quality
LNKQLTYLVL_EXCELLENT=80                                                                                                 # Link Quality excellent
LNKQLTYLVL_FAIR=20                                                                                                      # Link Quality fair
LNKQLTYLVL_GOOD=50                                                                                                      # Link Quality good
SGNLLVL_CURRENT=$(/sbin/iwconfig "$DEVICE_WIFI" | grep -i quality | awk '{print $4}' | cut -d'=' -f2 | tr -d -)         # Current Signal Level
SGNLLVL_MAXIMAL=100                                                                                                     # Maximal Signal Level
SGNLLVLLVL_EXCELLENT=50                                                                                                 # Signal Level excellent
SGNLLVLLVL_FAIR=30                                                                                                      # Signal Level fair
SGNLLVLLVL_GOOD=40                                                                                                      # Signal Level good
WIFI_NOSEC_NETS=$(/sbin/iwlist "$DEVICE_WIFI" scan | grep "Encryption key:off")                                         # No secured networks
WIFI_OFF="DOWN"                                                                                                         # Wifi status: OFF
WIFI_STATUS=$(ip link | grep "$DEVICE_WIFI" | cut -d' ' -f9)                                                            # Wifi status

declare -i LNKQLTY_PERCENT                                                                                              # Link Quality in %
declare -i SGNLLVL_PERCENT                                                                                              # Signal Level in %


## FUNCTIONS ###########################################################################################################
# Calculate the Link Quality in percent
function calc_lnkqlty()
{
  LNKQLTY_PERCENT=($LNKQLTY_CURRENT*100)/$LNKQLTY_MAXIMUM
}


# Calculate the Signal Level in percent
function calc_sgnllvl()
{
  SGNLLVL_PERCENT=$SGNLLVL_MAXIMAL-$SGNLLVL_CURRENT
}


# Print Link Quality levels
function print_lnkqltylvls()
{
  calc_lnkqlty
  # Weak
  if (( "$LNKQLTY_PERCENT" <= "$LNKQLTYLVL_FAIR" )); then
    color_fg $COLOR_LRED "$LNKQLTY_PERCENT%"
    echo -n "/"
  # Fair
  elif (( "$LNKQLTY_PERCENT" > "$LNKQLTYLVL_FAIR" && "$LNKQLTY_PERCENT" <= "$LNKQLTYLVL_GOOD" )); then
    color_fg $COLOR_LORANGE "$LNKQLTY_PERCENT%"
    echo -n "/"
  # Excellent
  elif (( "$LNKQLTY_PERCENT" >= "$LNKQLTYLVL_EXCELLENT" )); then
    color_fg $COLOR_LGREEN "$LNKQLTY_PERCENT%"
    echo -n "/"
  # Good
  else
    color_fg $COLOR_LBLUE "$LNKQLTY_PERCENT%"
    echo -n "/"
  fi
}


# Print Signal Level levels
function print_sgnlvllvls()
{
  calc_sgnllvl
  # Weak
  if (( "$SGNLLVL_PERCENT" <= "$SGNLLVLLVL_FAIR" )); then
    color_fg $COLOR_LRED "$SGNLLVL_PERCENT% "
    echo -n "("
    color_fg $COLOR_DRED "-$SGNLLVL_CURRENT dBm"
    echo -n ")"
  # Fair
  elif (( "$SGNLLVL_PERCENT" > "$SGNLLVLLVL_FAIR" && "$SGNLLVL_PERCENT" <= "$SGNLLVLLVL_GOOD" )); then
    color_fg $COLOR_LORANGE "$SGNLLVL_PERCENT% "
    echo -n "("
    color_fg $COLOR_DORANGE "-$SGNLLVL_CURRENT dBm"
    echo -n ")"
  # Excellent
  elif (( "$SGNLLVL_PERCENT" >= "$SGNLLVLLVL_EXCELLENT" )); then
    color_fg $COLOR_LGREEN "$SGNLLVL_PERCENT% "
    echo -n "("
    color_fg $COLOR_DGREEN "-$SGNLLVL_CURRENT dBm"
    echo -n ")"
  # Good
  else
    color_fg $COLOR_LBLUE "$SGNLLVL_PERCENT% "
    echo -n "("
    color_fg $COLOR_DBLUE "-$SGNLLVL_CURRENT dBm"
    echo -n ")"
  fi
}


# Check if there are none secured wireless networks
function is_nosec_nets()
{
  # Wifi device is down 
  if [ "$WIFI_STATUS" == "$WIFI_OFF" ]; then
    color_fg $COLOR_LORANGE "W"
  # No networks available
  elif [ -z "$WIFI_NOSEC_NETS" ]; then
    echo -n ""
  # Available networks
  elif [ -n "$WIFI_NOSEC_NETS" ]; then
    print_ic $ICON_WIFI 
    color_fg $COLOR_LORANGE "P"
  # Case not handled
  else
    gen_error
  fi
}


# Check if Wifi is enabled on an ESSID
function is_wifi()
{
  # If no ESSID, check if none secured networks available
  if [ -z "$ESSID" ]; then
    is_nosec_nets
  # ESSID found, print information
  elif [ -n "$ESSID" ]; then
    print_ic $ICON_WIFI 
    print_lnkqltylvls
    print_sgnlvllvls
  # Case not handled
  else
    gen_error
  fi
}


# Check if Ethernet is plugged or not
function is_ethernet()
{
  # Ethernet OFF, check for Wifi
  if [ "$ETH_STATUS_2" == "$ETH_OFF_2" ]; then
    is_wifi
  # Ethernet OFF (Device)
  elif [ "$ETH_STATUS_1" == "$ETH_OFF_1" ]; then
    color_fg $COLOR_LORANGE "E"
    # Wifi device is down 
    if [ "$WIFI_STATUS" == "$WIFI_OFF" ]; then
      color_fg $COLOR_LORANGE "W"
    fi
  # Ethernet ON
  elif [ "$ETH_STATUS_2" == "$ETH_ON" ]; then
    print_ic $ICON_ETHERNET | sed 's/.$//'
  # Case not handled
  else
    gen_error
  fi
}


# Main function
function main()
{
  is_ethernet
}


## MAIN ################################################################################################################
main
