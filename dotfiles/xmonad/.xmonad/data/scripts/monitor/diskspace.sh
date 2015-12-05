#!/bin/bash
source $HOME/.xmonad/data/scripts/_core.sh

declare -i SPACE_TOTAL
declare -i SPACE_USED
SPACE_TOTAL=$(df "$DISK" | sed '1d' | awk '{ print $2 }')
SPACE_USED=$(df "$DISK" | sed '1d' | awk '{ print $3 }')
echo $SPACE_TOTAL

declare -i SPACE_AVAILABLE
SPACE_AVAILABLE=($SPACE_TOTAL-$SPACE_USED)
echo $SPACE_AVAILABLE
