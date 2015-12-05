#!/bin/bash
CURRENT=$(free | grep -i mem | awk '{print $3}')
MAXIMAL=$(free | grep -i mem | awk '{print $2}')

declare -i PERCENT
PERCENT=($CURRENT*100)/$MAXIMAL

echo "$PERCENT"%
