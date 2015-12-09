#!/bin/bash

source $HOME/.xmonad/data/scripts/_core.sh

## VARIABLES
BATLVL_EMPTY=15                   # Battery level: empty
BATLVL_FULL=90                    # Battery level: full
BATLVL_LOW=35                     # Battery level: low
STATUS_CHARGING="Charging"        # Battery status: Charging
STATUS_DISCHARGING="Discharging"  # Battery status: Discharging
STATUS_FULL="Full"                # Battery status: Full


## FUNCTIONS
# Print Battery levels when charging
#    $1: percentage
#    $2: time
function print_batlvls_c()
{
  # Empty
  if (( "$1" <= "$BATLVL_EMPTY" )); then
    print_ic $ICON_AC
    color_fg $COLOR_LRED "$1% "
    color_fg $COLOR_DRED "$2"
  # Low
  elif (( "$1" <= "$BATLVL_LOW" && "$1" > "$BATLVL_EMPTY" )); then
    print_ic $ICON_AC
    color_fg $COLOR_LORANGE "$1% "
    color_fg $COLOR_DORANGE "$2"
  # Full
  elif (( "$1" >= "$BATLVL_FULL" )); then
    print_ic $ICON_AC
    color_fg $COLOR_LGREEN "$1% "
    color_fg $COLOR_DGREEN "$2"
  # Normal
  else
    print_ic $ICON_AC
    color_fg $COLOR_LBLUE "$1% "
    color_fg $COLOR_DBLUE "$2"
  fi
}


# Print Battery levels when discharging
#    $1: percentage
#    $2: time
function print_batlvls_d()
{
  # Empty
  if (( "$1" <= "$BATLVL_EMPTY" )); then
    print_ic $ICON_BATLVL_EMPTY
    color_fg $COLOR_LRED "$1% "
    color_fg $COLOR_DRED "$2"
  # Low
  elif (( "$1" <= "$BATLVL_LOW" && "$1" > "$BATLVL_EMPTY" )); then
    print_ic $ICON_BATLVL_LOW
    color_fg $COLOR_LORANGE "$1% "
    color_fg $COLOR_DORANGE "$2"
  # Full
  elif (( "$1" >= "$BATLVL_FULL" )); then
    print_ic $ICON_BATLVL_FULL
    color_fg $COLOR_LGREEN "$1% "
    color_fg $COLOR_DGREEN "$2"
  # Normal
  else
    print_ic $ICON_BATLVL_FULL
    color_fg $COLOR_LBLUE "$1% "
    color_fg $COLOR_DBLUE "$2"
  fi
}


# Handle battery status
#    $1: status
#    $2: percentage
#    $3: time
function handle_status()
{
  # Charging
  if [ "$1" == "$STATUS_CHARGING" ]; then
    print_batlvls_c $2 $3
  # Discharging
  elif [ "$1" == "$STATUS_DISCHARGING" ]; then
    print_batlvls_d $2 $3
  # Case not handled
  else
    gen_error
  fi
}


# Battery total: 1
function bat1()
{
  BATA_PERCENTAGE=$(acpi -b | cut -d' ' -f4 | tr -d % | tr -d ,)     # Battery percentage
  BATA_STATUS=$(acpi -b | awk '{gsub(/,/,""); print $3}')            # Battery status
  BATA_TIME=$(acpi -b | awk '{gsub(/,/,""); print $5}' | cut -c -5)  # Remaining time

  handle_status $BATA_STATUS $BATA_PERCENTAGE $BATA_TIME 
}


# Battery total: 2 
function bat2()
{
  # Battery A
  BATA_PERCENTAGE=$(acpi -b | sed -n '1p' | cut -d' ' -f4 | tr -d % | tr -d ,)     # Battery A: percentage
  BATA_STATUS=$(acpi -b | sed -n '1p' | awk '{gsub(/,/,""); print $3}')            # Battery A: status
  BATA_TIME=$(acpi -b | sed -n '1p' | awk '{gsub(/,/,""); print $5}' | cut -c -5)  # Battery A: remaining time

  # Battery B
  BATB_PERCENTAGE=$(acpi -b | sed -n '2p' | cut -d' ' -f4 | tr -d % | tr -d ,)     # Battery B: percentage
  BATB_STATUS=$(acpi -b | sed -n '2p' | awk '{gsub(/,/,""); print $3}')            # Battery B: status
  BATB_TIME=$(acpi -b | sed -n '2p' | awk '{gsub(/,/,""); print $5}' | cut -c -5)  # Battery B: remaining time

  # Battery A: Charging
  if [ "$BATA_STATUS" == "$STATUS_CHARGING" ]; then
    print_batlvls_c $BATA_PERCENTAGE $BATA_TIME
    color_fg $COLOR_LGREY " $BATB_PERCENTAGE%"
  # Battery A: Discharging
  elif [ "$BATA_STATUS" == "$STATUS_DISCHARGING" ]; then
    print_batlvls_d $BATA_PERCENTAGE $BATA_TIME
    color_fg $COLOR_LGREY " $BATB_PERCENTAGE%"
  # Battery B: Charging
  elif [ "$BATB_STATUS" == "$STATUS_CHARGING" ]; then
    print_batlvls_c $BATB_PERCENTAGE $BATB_TIME
    color_fg $COLOR_LGREY " $BATA_PERCENTAGE%"
  # Battery B: Discharging
  elif [ "$BATB_STATUS" == "$STATUS_DISCHARGING" ]; then
    print_batlvls_c $BATB_PERCENTAGE $BATB_TIME
    color_fg $COLOR_LGREY " $BATA_PERCENTAGE%"
  # Battery B: Full
  elif [ "$BATB_STATUS" == "$STATUS_FULL" ]; then
    color_fg $COLOR_LORANGE "Full"
  # Battery A + Battery B: Full
  elif [ "$BATA_PERCENTAGE" -ge "$BATLVL_FULL" ] && [ "$BATB_PERCENTAGE" -ge "$BATLVL_FULL" ]; then
    color_fg $COLOR_LORANGE "Full"
  # Case not handled
  else
    gen_error
  fi
}


# Detect if there are several batteries
function several_bats()
{
  NUMBER_BATS=$(acpi -b | wc -l)

  # No batteries
  if (( "$NUMBER_BATS" == "0" )); then
    print_ic $ICON_AC
  # 1 battery
  elif (( "$NUMBER_BATS" == "1" )); then
    bat1
  # 2 batteries
  elif (( "$NUMBER_BATS" == "2" )); then
    bat2
  # Case not handled
  else
    gen_error
  fi
}


# Main function
function main()
{
  several_bats
}


# MAIN
main
