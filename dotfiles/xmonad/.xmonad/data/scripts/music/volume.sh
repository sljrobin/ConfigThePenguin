#!/bin/bash

source $HOME/.xmonad/data/scripts/_core.sh

## VARIABLES
HEADPHONES_STATUS=$(cat /proc/asound/card$AUDIO_CARD/codec#$AUDIO_CODEC | sed -n "$AUDIO_PINLINE p" | cut -d':' -f2 | tr -d ' ')  # Headphones status
MUTE_OFF="on"                                                                                                                     # Mute status: OFF
MUTE_ON="off"                                                                                                                     # Mute status; ON
MUTE_STATUS=$(amixer sget Master | awk -F"[][]" '/dB/ {print $6}')                                                                # Mute status
VOLLVL_HIGH=90                                                                                                                    # Volume level high
VOLLVL_MEDIUM=80                                                                                                                  # Volume level medium
VOLUME=$(amixer sget Master | awk -F"[][]" '/dB/ {print $2}' | tr -d %)                                                           # Volume


## FUNCTIONS
# Print Volume levels when unmute
#   $1: icon for medium level
#   $2: icon for high level
#   $3: icon for normal level
function print_vollvls()
{
  # Medium
  if (( "$VOLUME" >= "$VOLLVL_MEDIUM" && "$VOLUME" < "$VOLLVL_HIGH" )); then
    print_ic $1
    color_fg $COLOR_LORANGE "$VOLUME%"
  # High
  elif (( "$VOLUME" >= "$VOLLVL_HIGH" )); then
    print_ic $2
    color_fg $COLOR_LRED "$VOLUME%"
  # Normal
  else
    print_ic $3
    color_fg $COLOR_LBLUE "$VOLUME%"
  fi
}


# Print Volume levels when mute
#   $1: icon for medium level
#   $2: icon for high level
#   $3: icon for normal level
function print_vollvls_m()
{
  # Medium
  if (( "$VOLUME" >= "$VOLLVL_MEDIUM" && "$VOLUME" < "$VOLLVL_HIGH" )); then
    print_ic $1
    color_fg $COLOR_LMAGENTA "M"
    color_fg $COLOR_DORANGE "$VOLUME%"
  # High
  elif (( "$VOLUME" >= "$VOLLVL_HIGH" )); then
    print_ic $2
    color_fg $COLOR_LMAGENTA "M"
    color_fg $COLOR_DRED "$VOLUME%"
  # Normal
  else
    print_ic $3
    color_fg $COLOR_LMAGENTA "M"
    color_fg $COLOR_DBLUE "$VOLUME%"
  fi
}


# Handle mute status for speakers
function handle_mute_spkr()
{
  # Mute ON
  if [ "$MUTE_STATUS" == "$MUTE_ON" ]; then
    print_vollvls_m $ICON_VOLLVL_MEDIUM $ICON_VOLLVL_HIGH $ICON_VOLLVL_NORMAL
  # Mute OFF
  elif [ "$MUTE_STATUS" == "$MUTE_OFF" ]; then
    print_vollvls $ICON_VOLLVL_MEDIUM $ICON_VOLLVL_HIGH $ICON_VOLLVL_NORMAL
  # Case not handled
  else
    gen_error
  fi
}


# Handle mute status for headphones
function handle_mute_hdphs()
{
  # Mute ON
  if [ "$MUTE_STATUS" == "$MUTE_ON" ]; then
    print_vollvls_m $ICON_HDPHONES $ICON_HDPHONES $ICON_HDPHONES
  # Mute OFF
  elif [ "$MUTE_STATUS" == "$MUTE_OFF" ]; then
    print_vollvls $ICON_HDPHONES $ICON_HDPHONES $ICON_HDPHONES
  # Case not handled
  else
    gen_error
  fi
}


# Handle headphones connection
function handle_hdphs_connection()
{
  # Headphones plugged
  if [ "$HEADPHONES_STATUS" == "$HEADPHONES_ON" ]; then
    handle_mute_hdphs
  # Headphones unplugged
  elif [ "$HEADPHONES_STATUS" == "$HEADPHONES_OFF" ]; then
    handle_mute_spkr
  # Case not handled
  else
    gen_error
  fi
}


# Main function
function main()
{
  handle_hdphs_connection
}


## MAIN
main
