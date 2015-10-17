#!/bin/bash

source $HOME/.xmonad/data/scripts/_core.sh

## VARIABLES
# Brightness level in %
declare -i BRIGHTNESS_PERCENT
BRIGHTNESS_PERCENT=($BRIGHTNESS_CURRENT*100)/$BRIGHTNESS_MAXIMAL

# Print
echo "$BRIGHTNESS_PERCENT"%
