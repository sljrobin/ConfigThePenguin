#!/bin/bash

source $HOME/.xmonad/data/scripts/_core.sh

## VARIABLES ###########################################################################################################
LOCKCAPS_OFF="off"                                                # Caps Lock status: OFF
LOCKCAPS_ON="on"                                                  # Caps Lock status: ON
LOCKCAPS_STATUS=$(xset q | grep "Caps Lock" | awk '{print $4}')   # Caps Lock status
LOCKNUM_OFF="off"                                                 # Num Lock status: OFF
LOCKNUM_ON="on"                                                   # Num Lock status: ON
LOCKNUM_STATUS=$(xset q | grep "Num Lock" | awk '{print $8}')     # Num Lock status
XKBMAP=$(setxkbmap -print | grep xkb_symbols | cut -d'+' -f2)     # Keymap


## FUNCTIONS ###########################################################################################################
# Print a character for the Caps Lock
function print_char_caps()
{
  color_fg $COLOR_LORANGE "C"
}


# Print a character for the Num Lock
function print_char_num()
{
  color_fg $COLOR_LGREEN "N"
}


# Handle Caps Lock
function handle_lockcaps()
{
  # Caps Lock ON
  if [ "$LOCKCAPS_STATUS" == "$LOCKCAPS_ON" ]; then
    # Num Lock OFF
    if [ "$LOCKNUM_STATUS" == "$LOCKCAPS_OFF" ]; then
      print_char_caps
      echo -n " "
    # Num Lock ON
    else
      print_char_num
      print_char_caps
      echo -n " "
    fi
  # Caps Lock OFF
  elif [ "$LOCKCAPS_STATUS" == "$LOCKCAPS_OFF" ]; then
    echo -n ""
  # Case not handled
  else
    gen_error
  fi
}


# Handle Num Lock
function handle_locknum()
{
  if [ "$LOCKNUM_STATUS" == "$LOCKNUM_ON" ]; then
    # Caps Lock OFF
    if [ "$LOCKCAPS_STATUS" == "$LOCKNUM_OFF" ]; then
      print_char_num
      echo -n " "
    fi
  fi
}


# Show the keymap
function show_keymap()
{
  echo -n "$XKBMAP"
}


# Main function
function main()
{
  handle_locknum
  handle_lockcaps
  show_keymap
}


## MAIN ################################################################################################################
main
