#!/bin/bash

########################################################################################################################
# Output a text with color
#   $1: text to print
#   $2: color to use
#   $3: add or not a new line
#         "y": add a new line
#         "n": do not add a new line
function colorize()
{
  # Add a new line
  if [ "$3" == "y" ] ; then
    printf "${2}${1}${CLR_RESET}\n"
  # No new line
  elif [ "$3" == "n" ] ; then
    printf "${2}${1}${CLR_RESET}"
  # Error with newline
  else 
    echo "Error with the new line..."
  fi
}
