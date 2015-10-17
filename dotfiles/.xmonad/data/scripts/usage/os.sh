#!/bin/bash

source $HOME/.xmonad/data/scripts/_core.sh

## VARIABLES
OS_ARCH="ARCH"        # OS name: Arch
OS_DEBIAN="Debian"    # OS name: Debian

## FUNCTIONS
# Get information about the OS
function get_osinfo()
{
  uname -a | grep $1
}


# Check OS
function check_os()
{
  ARCH=$(get_osinfo $OS_ARCH)
  DEBIAN=$(get_osinfo $OS_DEBIAN)

  # Arch
  if [ -n "$ARCH" ]; then
    color_fg $COLOR_LBLUE "A "
  # Debian
  elif [ -n "$DEBIAN" ]; then
    color_fg $COLOR_LMAGENTA "D "
  # Unknown OS
  else
    color_fg $COLOR_LRED "U "
  fi
}


# Main function
function main()
{
  check_os
}


# MAIN
main
