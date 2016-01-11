#!/bin/bash
#
#        Filename: keyboard.sh
#     Description: Tool for keyboard
#          Author: Simon L. J. Robin | https://sljrobin.org
#         Created: 2015-12-30 18:37:15
#        Modified: 2015-12-30 20:06:51
#
########################################################################################################################
# Load Library
source $HOME/.xmonad/data/scripts/main.sh


########################################################################################################################
# Keyboard | Print a character for the Caps Lock
function __xmdt_keyboard-showcaps()
{
  xmdl_pntr-txt $COLOR_LORANGE "C"
}


################################################################################
# Keyboard | Print the keymap
function __xmdt_keyboard-showkeymap()
{
  local keymap=$(setxkbmap -print | grep xkb_symbols | cut -d'+' -f2)  # Keymap

  echo -n "$keymap"
}


################################################################################
# Keyboard | Print a character for the Num Lock
function __xmdt_keyboard-shownum()
{
  xmdl_pntr-txt $COLOR_LGREEN "N"
}


################################################################################
# Keyboard | Handle Caps Lock 
function __xmdt_keyboard-handlecaps()
{
  local caps_status=$(xset q | grep "Caps Lock" | awk '{print $4}')  # Get Caps Lock status
  local caps_status_off="off"                                        # Caps Lock status: OFF
  local caps_status_on="on"                                          # Caps Lock status: ON
  local num_status=$(xset q | grep "Num Lock" | awk '{print $8}')    # Get Num Lock status
  local num_status_off="off"                                         # Num Lock status: OFF

  # Caps Lock ON
  if [ "$caps_status" == "$caps_status_on" ]; then
    # Num Lock OFF
    if [ "$num_status" == "$num_status_off" ]; then
      __xmdt_keyboard-showcaps
      echo -n " "
    # Num Lock ON
    else
      __xmdt_keyboard-shownum
      __xmdt_keyboard-showcaps
      echo -n " "
    fi
  # Caps Lock OFF
  elif [ "$caps_status" == "$caps_status_off" ]; then
    :
  # Case not handled
  else
    xmdl_pntr-err
  fi
}


################################################################################
# Keyboard | Handle Num Lock
function __xmdt_keyboard-handlenum()
{
  local caps_status=$(xset q | grep "Caps Lock" | awk '{print $4}')  # Get Caps Lock status
  local caps_status_off="off"                                        # Caps Lock status: OFF
  local num_status=$(xset q | grep "Num Lock" | awk '{print $8}')    # Get Num Lock status
  local num_status_on="on"                                           # Num Lock status: ON

  # Num Lock ON
  if [ "$num_status" == "$num_status_on" ]; then
    # Caps Lock OFF
    if [ "$caps_status" == "$caps_status_off" ]; then
      __xmdt_keyboard-shownum
      echo -n " "
    fi
  fi
}


################################################################################
# Keyboard | Main
function xmdt_keyboard()
{
  __xmdt_keyboard-handlenum
  __xmdt_keyboard-handlecaps
  __xmdt_keyboard-showkeymap
}


########################################################################################################################
xmdt_keyboard
