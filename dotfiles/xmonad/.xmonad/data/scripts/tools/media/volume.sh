#!/bin/bash
#
#        Filename: volume.sh
#     Description: Tool for volume
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2015-12-30 21:09:48
#        Modified: 2016-02-07 02:46:53
#
########################################################################################################################
# Load Library
source $HOME/.xmonad/data/scripts/main.sh


########################################################################################################################
# Volume | Get current volume
function __xmdt_volume-get()
{
  local vol=$(amixer sget Master | awk -F"[][]" '/dB/ {print $2}' | tr -d %)  # Get Volume

  echo $vol
}


################################################################################
# Volume | Print levels for headphones
function __xmdt_volume-showlvlhdphs()
{
  local vol=$(__xmdt_volume-get)  # Get Volume
  local vol_level_high=90         # Volume level: high
  local vol_level_medi=80         # Volume level: medium

  # Medium
  if (( "$vol" >= "$vol_level_medi" && "$vol" < "$vol_level_high" )); then
    xmdl_icns-show $ICON_HDPHONES
    xmdl_pntr-txt $COLOR_LORANGE "$vol%"
  # High
  elif (( "$vol" >= "$vol_level_high" )); then
    xmdl_icns-show $ICON_HDPHONES
    xmdl_pntr-txt $COLOR_LRED "$vol%"
  # Normal
  else
    xmdl_icns-show $ICON_HDPHONES
    xmdl_pntr-txt $COLOR_LBLUE "$vol%"
  fi
}


################################################################################
# Volume | Print levels for headphones when mute
function __xmdt_volume-showlvlhdphsm()
{
  local vol=$(__xmdt_volume-get)  # Get Volume

  xmdl_icns-show $ICON_HDPHONES
  xmdl_pntr-txt $COLOR_LGREY "$vol%"
}


################################################################################
# Volume | Print levels for speakers
function __xmdt_volume-showlvlspkrs()
{
  local vol=$(__xmdt_volume-get)  # Get Volume
  local vol_level_high=90         # Volume level: high
  local vol_level_medi=80         # Volume level: medium

  # Medium
  if (( "$vol" >= "$vol_level_medi" && "$vol" < "$vol_level_high" )); then
    xmdl_icns-show $ICON_VOLLVL_MEDIUM
    xmdl_pntr-txt $COLOR_LORANGE "$vol%"
  # High
  elif (( "$vol" >= "$vol_level_high" )); then
    xmdl_icns-show $ICON_VOLLVL_HIGH
    xmdl_pntr-txt $COLOR_LRED "$vol%"
  # Normal
  else
    xmdl_icns-show $ICON_VOLLVL_NORMAL
    xmdl_pntr-txt $COLOR_LBLUE "$vol%"
  fi
}


################################################################################
# Volume | Print levels for speakers when mute
function __xmdt_volume-showlvlspkrsm()
{
  local vol=$(__xmdt_volume-get)  # Get Volume

  xmdl_pntr-txt $COLOR_LGREY "$vol%"
}


################################################################################
# Volume | Handle headphones
function __xmdt_volume-handlehdphs()
{
  local mute_status=$(amixer sget Master | awk -F"[][]" '/dB/ {print $6}')  # Get Mute status
  local mute_status_off="on"                                                # Mute status: OFF
  local mute_status_on="off"                                                # Mute status: ON

  # Mute ON
  if [ "$mute_status" == "$mute_status_on" ]; then
    __xmdt_volume-showlvlhdphsm
  # Mute OFF
  elif [ "$mute_status" == "$mute_status_off" ]; then
    __xmdt_volume-showlvlhdphs
  # Case not handled
  else
    xmdl_pntr-err
  fi
}


################################################################################
# Volume | Handle speakers
function __xmdt_volume-handlespkrs()
{
  local mute_status=$(amixer sget Master | awk -F"[][]" '/dB/ {print $6}')  # Get Mute status
  local mute_status_off="on"                                                # Mute status: OFF
  local mute_status_on="off"                                                # Mute status: ON

  # Mute ON
  if [ "$mute_status" == "$mute_status_on" ]; then
    __xmdt_volume-showlvlspkrsm
  # Mute OFF
  elif [ "$mute_status" == "$mute_status_off" ]; then
    __xmdt_volume-showlvlspkrs
  # Case not handled
  else
    xmdl_pntr-err
  fi
}


################################################################################
# Volume | Main
function xmdt_volume()
{
  local hdphs_status=$(cat /proc/asound/card$AUDIO_CARD/codec#$AUDIO_CODEC | sed -n "$AUDIO_PINLINE p" | cut -d':' -f2 | tr -d ' ')  # Get Headphones status
  local hdphs_status_on="$HEADPHONES_ON"                                                                                             # Headphones status: ON
  local hdphs_status_off="$HEADPHONES_OFF"                                                                                           # Headphones status: FF

  # Headphones
  if [ "$hdphs_status" == "$hdphs_status_on" ]; then
    __xmdt_volume-handlehdphs
  # Speakers
  elif [ "$hdphs_status" == "$hdphs_status_off" ]; then
    __xmdt_volume-handlespkrs
  # Case not handled
  else
    xmdl_pntr-err
  fi
}


########################################################################################################################
xmdt_volume
